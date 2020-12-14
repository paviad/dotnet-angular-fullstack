// Copyright (c) Brock Allen & Dominick Baier. All rights reserved.
// Licensed under the Apache License, Version 2.0. See LICENSE in the project root for license information.


using System.Linq;
using Auth.Data;
using Auth.Models;
using IdentityServer4;
using IdentityServer4.EntityFramework.DbContexts;
using IdentityServer4.EntityFramework.Options;
using IdentityServer4.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace Auth {
    public class Startup {
        public Startup(IWebHostEnvironment environment, IConfiguration configuration) {
            Environment = environment;
            Configuration = configuration;
        }

        public IWebHostEnvironment Environment { get; }
        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services) {
            services.AddControllersWithViews();

            var connectionString = Configuration.GetConnectionString("DefaultConnection");

            services.AddDbContext<ApplicationDbContext>(options => {
                options.UseSqlServer(connectionString,
                    sql => sql.MigrationsAssembly(typeof(Startup).Assembly.FullName));
            });

#if DEBUG
            services.AddCors(options => {
                var corsPolicyBuilder = new CorsPolicyBuilder()
                    .AllowAnyMethod()
                    .AllowAnyOrigin()
                    .AllowAnyHeader();

                var corsPolicy = corsPolicyBuilder.Build();
                options.AddPolicy("allow-localhost", corsPolicy);
            });
#endif

            services.AddDefaultIdentity<ApplicationUser>()
                .AddEntityFrameworkStores<ApplicationDbContext>();

            var builder = services.AddIdentityServer(options => {
                    options.Events.RaiseErrorEvents = true;
                    options.Events.RaiseInformationEvents = true;
                    options.Events.RaiseFailureEvents = true;
                    options.Events.RaiseSuccessEvents = true;

                    // There is confusion on where the UI for login/logout should come from.
                    // One part is from the Quickstart/ folder, another is from Areas/Identity/...
                    // Here we set the logout URL to come from the Quickstart folder, because
                    // it does the auto-redirect out of the box...
                    options.UserInteraction.LogoutUrl = "/Account/Logout";

                    // see https://identityserver4.readthedocs.io/en/latest/topics/resources.html
                    options.EmitStaticAudienceClaim = true;
                })
                .AddAspNetIdentity<ApplicationUser>()
                // .AddTestUsers(TestUsers.Users)
                // this adds the config data from DB (clients, resources, CORS)
                .AddConfigurationStore<ConfigurationDbContext>(options => {
                    options.ConfigureDbContext = builder => builder.UseSqlServer(connectionString,
                        sql => sql.MigrationsAssembly(typeof(Startup).Assembly.FullName));
                    var tableConfigs = options.GetType().GetProperties()
                        .Where(x => x.PropertyType == typeof(TableConfiguration)).ToList();
                    tableConfigs.ForEach(x => {
                        var cv = (TableConfiguration) x.GetValue(options);
                        cv.Name = "Is4_" + cv.Name;
                    });
                })
                // this adds the operational data from DB (codes, tokens, consents)
                .AddOperationalStore<PersistedGrantDbContext>(options => {
                    options.ConfigureDbContext = builder => builder.UseSqlServer(connectionString,
                        sql => sql.MigrationsAssembly(typeof(Startup).Assembly.FullName));
                    var tableConfigs = options.GetType().GetProperties()
                        .Where(x => x.PropertyType == typeof(TableConfiguration)).ToList();
                    tableConfigs.ForEach(x => {
                        var cv = (TableConfiguration) x.GetValue(options);
                        cv.Name = "Is4_" + cv.Name;
                    });

                    // this enables automatic token cleanup. this is optional.
                    options.EnableTokenCleanup = true;
                });

            // not recommended for production - you need to store your key material somewhere secure
            builder.AddDeveloperSigningCredential();

            services.AddAuthentication()
                .AddGoogle(options => {
                    options.SignInScheme = IdentityServerConstants.ExternalCookieAuthenticationScheme;

                    // register your IdentityServer with Google at https://console.developers.google.com
                    // enable the Google+ API
                    // set the redirect URI to https://localhost:5001/signin-google
                    options.ClientId = "copy client ID from Google here";
                    options.ClientSecret = "copy client secret from Google here";
                });

#if DEBUG
            services.AddSingleton<ICorsPolicyService>(container => {
                var logger = container.GetRequiredService<ILogger<DefaultCorsPolicyService>>();
                return new DefaultCorsPolicyService(logger) {
                    AllowAll = true
                };
            });
#endif

            services.AddRazorPages();
        }

        public void Configure(IApplicationBuilder app) {
            if (Environment.IsDevelopment()) {
                app.UseDeveloperExceptionPage();
            }

#if DEBUG
            app.UseCors("allow-localhost");
#endif

            app.UsePathBase("/auth");
            app.UseStaticFiles();

            app.UseRouting();
            app.UseIdentityServer();
            app.UseAuthorization();
            app.UseEndpoints(endpoints => {
                endpoints.MapDefaultControllerRoute();
                endpoints.MapRazorPages();
            });
        }
    }
}