using System;
using System.Diagnostics;
using System.Text.Json;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.SpaServices.AngularCli;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Options;

namespace Web {
    public class Startup {
        public Startup(IConfiguration configuration) {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services) {
            services.AddControllersWithViews();
            // In production, the Angular files will be served from this directory
            services.AddSpaStaticFiles(
                configuration => { configuration.RootPath = "ClientApp/dist/ClientApp/browser"; });
            services.AddOptions<Deployment>()
                .Bind(Configuration.GetSection("Deployment"));
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, IAntiforgery antiforgery,
            IOptions<Deployment> deployment) {
            if (env.IsDevelopment()) {
                app.UseDeveloperExceptionPage();
            }
            else {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            //if (!env.IsDevelopment())
            {
                app.UseSpaStaticFiles();
            }

            app.UseRouting();

            app.UseEndpoints(endpoints => {
                endpoints.MapControllerRoute(
                    "default",
                    "{controller}/{action=Index}/{id?}");
            });

            app.Run(async context => {
                var backendState = new BackendState {
                    Mobile = false,
                    AntiForgeryToken = antiforgery.GetAndStoreTokens(context),
                    Deployment = deployment.Value
                };
                var jsonOpts = new JsonSerializerOptions {
                    PropertyNamingPolicy = JsonNamingPolicy.CamelCase
                };
                var stateJson = JsonSerializer.Serialize(backendState, jsonOpts);
                var angularPath = context.Request.GetEncodedUrl();
                var escapedStateJson = stateJson.Replace("\"", "\\\"");
                var arguments = $"dist/ClientApp/server/main.js {angularPath} {escapedStateJson}";

                Debug.Print($"path {angularPath} cwd {Environment.CurrentDirectory}\nnode {arguments}");

                var processStartInfo = new ProcessStartInfo("node") {
                    Arguments = arguments,
                    UseShellExecute = false,
                    RedirectStandardInput = false,
                    RedirectStandardOutput = true,
                    RedirectStandardError = true,
#if DEBUG
                    WorkingDirectory = "ClientApp",
#else
                    WorkingDirectory = "tmp",
#endif
                };

                var process = Process.Start(processStartInfo);

                var stdErr = process.StandardError;
                var stdOut = process.StandardOutput;

                var result = await stdOut.ReadToEndAsync();
                var errResult = await stdErr.ReadToEndAsync();
                Debug.Print(processStartInfo.Arguments);
                Debug.Print(errResult);
                //Debug.Print(result);
                await context.Response.WriteAsync(result);
                await context.Response.CompleteAsync();
            });

            app.UseSpa(spa => {
                // To learn more about options for serving an Angular SPA from ASP.NET Core,
                // see https://go.microsoft.com/fwlink/?linkid=864501

                spa.Options.SourcePath = "ClientApp";

                if (env.IsDevelopment()) {
                    spa.UseAngularCliServer("start");
                }
            });
        }
    }
}