using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Auth.Migrations.Identity {
    public partial class Identity : Migration {
        protected override void Up(MigrationBuilder migrationBuilder) {
            migrationBuilder.CreateTable(
                "is4_AspNetRoles",
                table => new {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true)
                },
                constraints: table => { table.PrimaryKey("PK_is4_AspNetRoles", x => x.Id); });

            migrationBuilder.CreateTable(
                "is4_AspNetUsers",
                table => new {
                    Id = table.Column<string>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false)
                },
                constraints: table => { table.PrimaryKey("PK_is4_AspNetUsers", x => x.Id); });

            migrationBuilder.CreateTable(
                "is4_AspNetRoleClaims",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table => {
                    table.PrimaryKey("PK_is4_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        "FK_is4_AspNetRoleClaims_is4_AspNetRoles_RoleId",
                        x => x.RoleId,
                        "is4_AspNetRoles",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "is4_AspNetUserClaims",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table => {
                    table.PrimaryKey("PK_is4_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        "FK_is4_AspNetUserClaims_is4_AspNetUsers_UserId",
                        x => x.UserId,
                        "is4_AspNetUsers",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "is4_AspNetUserLogins",
                table => new {
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderKey = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderDisplayName = table.Column<string>(nullable: true),
                    UserId = table.Column<string>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_is4_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        "FK_is4_AspNetUserLogins_is4_AspNetUsers_UserId",
                        x => x.UserId,
                        "is4_AspNetUsers",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "is4_AspNetUserRoles",
                table => new {
                    UserId = table.Column<string>(nullable: false),
                    RoleId = table.Column<string>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_is4_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        "FK_is4_AspNetUserRoles_is4_AspNetRoles_RoleId",
                        x => x.RoleId,
                        "is4_AspNetRoles",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        "FK_is4_AspNetUserRoles_is4_AspNetUsers_UserId",
                        x => x.UserId,
                        "is4_AspNetUsers",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "is4_AspNetUserTokens",
                table => new {
                    UserId = table.Column<string>(nullable: false),
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    Name = table.Column<string>(maxLength: 128, nullable: false),
                    Value = table.Column<string>(nullable: true)
                },
                constraints: table => {
                    table.PrimaryKey("PK_is4_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        "FK_is4_AspNetUserTokens_is4_AspNetUsers_UserId",
                        x => x.UserId,
                        "is4_AspNetUsers",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                "IX_is4_AspNetRoleClaims_RoleId",
                "is4_AspNetRoleClaims",
                "RoleId");

            migrationBuilder.CreateIndex(
                "RoleNameIndex",
                "is4_AspNetRoles",
                "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                "IX_is4_AspNetUserClaims_UserId",
                "is4_AspNetUserClaims",
                "UserId");

            migrationBuilder.CreateIndex(
                "IX_is4_AspNetUserLogins_UserId",
                "is4_AspNetUserLogins",
                "UserId");

            migrationBuilder.CreateIndex(
                "IX_is4_AspNetUserRoles_RoleId",
                "is4_AspNetUserRoles",
                "RoleId");

            migrationBuilder.CreateIndex(
                "EmailIndex",
                "is4_AspNetUsers",
                "NormalizedEmail");

            migrationBuilder.CreateIndex(
                "UserNameIndex",
                "is4_AspNetUsers",
                "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");
        }

        protected override void Down(MigrationBuilder migrationBuilder) {
            migrationBuilder.DropTable(
                "is4_AspNetRoleClaims");

            migrationBuilder.DropTable(
                "is4_AspNetUserClaims");

            migrationBuilder.DropTable(
                "is4_AspNetUserLogins");

            migrationBuilder.DropTable(
                "is4_AspNetUserRoles");

            migrationBuilder.DropTable(
                "is4_AspNetUserTokens");

            migrationBuilder.DropTable(
                "is4_AspNetRoles");

            migrationBuilder.DropTable(
                "is4_AspNetUsers");
        }
    }
}