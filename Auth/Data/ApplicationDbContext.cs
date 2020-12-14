using Auth.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Auth.Data {
    public class ApplicationDbContext : IdentityDbContext<ApplicationUser> {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
            : base(options) {
        }

        protected override void OnModelCreating(ModelBuilder builder) {
            base.OnModelCreating(builder);
            // Customize the ASP.NET Identity model and override the defaults if needed.
            // For example, you can rename the ASP.NET Identity table names and more.
            // Add your customizations after calling base.OnModelCreating(builder);

            builder.Entity<IdentityRoleClaim<string>>().ToTable("Is4_AspNetRoleClaims");
            builder.Entity<IdentityUserClaim<string>>().ToTable("Is4_AspNetUserClaims");
            builder.Entity<IdentityUserLogin<string>>().ToTable("Is4_AspNetUserLogins");
            builder.Entity<IdentityUserRole<string>>().ToTable("Is4_AspNetUserRoles");
            builder.Entity<IdentityUserToken<string>>().ToTable("Is4_AspNetUserTokens");
            builder.Entity<IdentityRole>().ToTable("Is4_AspNetRoles");
            builder.Entity<ApplicationUser>().ToTable("Is4_AspNetUsers");
        }
    }
}
