using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Auth2.Migrations.Configuration
{
    public partial class Configuration : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Is4_ApiResources",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Enabled = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(maxLength: 200, nullable: false),
                    DisplayName = table.Column<string>(maxLength: 200, nullable: true),
                    Description = table.Column<string>(maxLength: 1000, nullable: true),
                    AllowedAccessTokenSigningAlgorithms = table.Column<string>(maxLength: 100, nullable: true),
                    ShowInDiscoveryDocument = table.Column<bool>(nullable: false),
                    Created = table.Column<DateTime>(nullable: false),
                    Updated = table.Column<DateTime>(nullable: true),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    NonEditable = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ApiResources", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ApiScopes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Enabled = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(maxLength: 200, nullable: false),
                    DisplayName = table.Column<string>(maxLength: 200, nullable: true),
                    Description = table.Column<string>(maxLength: 1000, nullable: true),
                    Required = table.Column<bool>(nullable: false),
                    Emphasize = table.Column<bool>(nullable: false),
                    ShowInDiscoveryDocument = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ApiScopes", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Is4_Clients",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Enabled = table.Column<bool>(nullable: false),
                    ClientId = table.Column<string>(maxLength: 200, nullable: false),
                    ProtocolType = table.Column<string>(maxLength: 200, nullable: false),
                    RequireClientSecret = table.Column<bool>(nullable: false),
                    ClientName = table.Column<string>(maxLength: 200, nullable: true),
                    Description = table.Column<string>(maxLength: 1000, nullable: true),
                    ClientUri = table.Column<string>(maxLength: 2000, nullable: true),
                    LogoUri = table.Column<string>(maxLength: 2000, nullable: true),
                    RequireConsent = table.Column<bool>(nullable: false),
                    AllowRememberConsent = table.Column<bool>(nullable: false),
                    AlwaysIncludeUserClaimsInIdToken = table.Column<bool>(nullable: false),
                    RequirePkce = table.Column<bool>(nullable: false),
                    AllowPlainTextPkce = table.Column<bool>(nullable: false),
                    RequireRequestObject = table.Column<bool>(nullable: false),
                    AllowAccessTokensViaBrowser = table.Column<bool>(nullable: false),
                    FrontChannelLogoutUri = table.Column<string>(maxLength: 2000, nullable: true),
                    FrontChannelLogoutSessionRequired = table.Column<bool>(nullable: false),
                    BackChannelLogoutUri = table.Column<string>(maxLength: 2000, nullable: true),
                    BackChannelLogoutSessionRequired = table.Column<bool>(nullable: false),
                    AllowOfflineAccess = table.Column<bool>(nullable: false),
                    IdentityTokenLifetime = table.Column<int>(nullable: false),
                    AllowedIdentityTokenSigningAlgorithms = table.Column<string>(maxLength: 100, nullable: true),
                    AccessTokenLifetime = table.Column<int>(nullable: false),
                    AuthorizationCodeLifetime = table.Column<int>(nullable: false),
                    ConsentLifetime = table.Column<int>(nullable: true),
                    AbsoluteRefreshTokenLifetime = table.Column<int>(nullable: false),
                    SlidingRefreshTokenLifetime = table.Column<int>(nullable: false),
                    RefreshTokenUsage = table.Column<int>(nullable: false),
                    UpdateAccessTokenClaimsOnRefresh = table.Column<bool>(nullable: false),
                    RefreshTokenExpiration = table.Column<int>(nullable: false),
                    AccessTokenType = table.Column<int>(nullable: false),
                    EnableLocalLogin = table.Column<bool>(nullable: false),
                    IncludeJwtId = table.Column<bool>(nullable: false),
                    AlwaysSendClientClaims = table.Column<bool>(nullable: false),
                    ClientClaimsPrefix = table.Column<string>(maxLength: 200, nullable: true),
                    PairWiseSubjectSalt = table.Column<string>(maxLength: 200, nullable: true),
                    Created = table.Column<DateTime>(nullable: false),
                    Updated = table.Column<DateTime>(nullable: true),
                    LastAccessed = table.Column<DateTime>(nullable: true),
                    UserSsoLifetime = table.Column<int>(nullable: true),
                    UserCodeType = table.Column<string>(maxLength: 100, nullable: true),
                    DeviceCodeLifetime = table.Column<int>(nullable: false),
                    NonEditable = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_Clients", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Is4_IdentityResources",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Enabled = table.Column<bool>(nullable: false),
                    Name = table.Column<string>(maxLength: 200, nullable: false),
                    DisplayName = table.Column<string>(maxLength: 200, nullable: true),
                    Description = table.Column<string>(maxLength: 1000, nullable: true),
                    Required = table.Column<bool>(nullable: false),
                    Emphasize = table.Column<bool>(nullable: false),
                    ShowInDiscoveryDocument = table.Column<bool>(nullable: false),
                    Created = table.Column<DateTime>(nullable: false),
                    Updated = table.Column<DateTime>(nullable: true),
                    NonEditable = table.Column<bool>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_IdentityResources", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ApiResourceClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(maxLength: 200, nullable: false),
                    ApiResourceId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ApiResourceClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ApiResourceClaims_Is4_ApiResources_ApiResourceId",
                        column: x => x.ApiResourceId,
                        principalTable: "Is4_ApiResources",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ApiResourceProperties",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Key = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    ApiResourceId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ApiResourceProperties", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ApiResourceProperties_Is4_ApiResources_ApiResourceId",
                        column: x => x.ApiResourceId,
                        principalTable: "Is4_ApiResources",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ApiResourceScopes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Scope = table.Column<string>(maxLength: 200, nullable: false),
                    ApiResourceId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ApiResourceScopes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ApiResourceScopes_Is4_ApiResources_ApiResourceId",
                        column: x => x.ApiResourceId,
                        principalTable: "Is4_ApiResources",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ApiResourceSecrets",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(maxLength: 1000, nullable: true),
                    Value = table.Column<string>(maxLength: 4000, nullable: false),
                    Expiration = table.Column<DateTime>(nullable: true),
                    Type = table.Column<string>(maxLength: 250, nullable: false),
                    Created = table.Column<DateTime>(nullable: false),
                    ApiResourceId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ApiResourceSecrets", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ApiResourceSecrets_Is4_ApiResources_ApiResourceId",
                        column: x => x.ApiResourceId,
                        principalTable: "Is4_ApiResources",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ApiScopeClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(maxLength: 200, nullable: false),
                    ScopeId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ApiScopeClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ApiScopeClaims_Is4_ApiScopes_ScopeId",
                        column: x => x.ScopeId,
                        principalTable: "Is4_ApiScopes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ApiScopeProperties",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Key = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    ScopeId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ApiScopeProperties", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ApiScopeProperties_Is4_ApiScopes_ScopeId",
                        column: x => x.ScopeId,
                        principalTable: "Is4_ApiScopes",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 250, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientClaims_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientCorsOrigins",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Origin = table.Column<string>(maxLength: 150, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientCorsOrigins", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientCorsOrigins_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientGrantTypes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    GrantType = table.Column<string>(maxLength: 250, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientGrantTypes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientGrantTypes_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientIdPRestrictions",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Provider = table.Column<string>(maxLength: 200, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientIdPRestrictions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientIdPRestrictions_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientPostLogoutRedirectUris",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PostLogoutRedirectUri = table.Column<string>(maxLength: 2000, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientPostLogoutRedirectUris", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientPostLogoutRedirectUris_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientProperties",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Key = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientProperties", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientProperties_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientRedirectUris",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RedirectUri = table.Column<string>(maxLength: 2000, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientRedirectUris", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientRedirectUris_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientScopes",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Scope = table.Column<string>(maxLength: 200, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientScopes", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientScopes_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_ClientSecrets",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(maxLength: 2000, nullable: true),
                    Value = table.Column<string>(maxLength: 4000, nullable: false),
                    Expiration = table.Column<DateTime>(nullable: true),
                    Type = table.Column<string>(maxLength: 250, nullable: false),
                    Created = table.Column<DateTime>(nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_ClientSecrets", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_ClientSecrets_Is4_Clients_ClientId",
                        column: x => x.ClientId,
                        principalTable: "Is4_Clients",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_IdentityResourceClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(maxLength: 200, nullable: false),
                    IdentityResourceId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_IdentityResourceClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_IdentityResourceClaims_Is4_IdentityResources_IdentityResourceId",
                        column: x => x.IdentityResourceId,
                        principalTable: "Is4_IdentityResources",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "Is4_IdentityResourceProperties",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Key = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    IdentityResourceId = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Is4_IdentityResourceProperties", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Is4_IdentityResourceProperties_Is4_IdentityResources_IdentityResourceId",
                        column: x => x.IdentityResourceId,
                        principalTable: "Is4_IdentityResources",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ApiResourceClaims_ApiResourceId",
                table: "Is4_ApiResourceClaims",
                column: "ApiResourceId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ApiResourceProperties_ApiResourceId",
                table: "Is4_ApiResourceProperties",
                column: "ApiResourceId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ApiResources_Name",
                table: "Is4_ApiResources",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ApiResourceScopes_ApiResourceId",
                table: "Is4_ApiResourceScopes",
                column: "ApiResourceId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ApiResourceSecrets_ApiResourceId",
                table: "Is4_ApiResourceSecrets",
                column: "ApiResourceId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ApiScopeClaims_ScopeId",
                table: "Is4_ApiScopeClaims",
                column: "ScopeId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ApiScopeProperties_ScopeId",
                table: "Is4_ApiScopeProperties",
                column: "ScopeId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ApiScopes_Name",
                table: "Is4_ApiScopes",
                column: "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientClaims_ClientId",
                table: "Is4_ClientClaims",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientCorsOrigins_ClientId",
                table: "Is4_ClientCorsOrigins",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientGrantTypes_ClientId",
                table: "Is4_ClientGrantTypes",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientIdPRestrictions_ClientId",
                table: "Is4_ClientIdPRestrictions",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientPostLogoutRedirectUris_ClientId",
                table: "Is4_ClientPostLogoutRedirectUris",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientProperties_ClientId",
                table: "Is4_ClientProperties",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientRedirectUris_ClientId",
                table: "Is4_ClientRedirectUris",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_Clients_ClientId",
                table: "Is4_Clients",
                column: "ClientId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientScopes_ClientId",
                table: "Is4_ClientScopes",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_ClientSecrets_ClientId",
                table: "Is4_ClientSecrets",
                column: "ClientId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_IdentityResourceClaims_IdentityResourceId",
                table: "Is4_IdentityResourceClaims",
                column: "IdentityResourceId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_IdentityResourceProperties_IdentityResourceId",
                table: "Is4_IdentityResourceProperties",
                column: "IdentityResourceId");

            migrationBuilder.CreateIndex(
                name: "IX_Is4_IdentityResources_Name",
                table: "Is4_IdentityResources",
                column: "Name",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Is4_ApiResourceClaims");

            migrationBuilder.DropTable(
                name: "Is4_ApiResourceProperties");

            migrationBuilder.DropTable(
                name: "Is4_ApiResourceScopes");

            migrationBuilder.DropTable(
                name: "Is4_ApiResourceSecrets");

            migrationBuilder.DropTable(
                name: "Is4_ApiScopeClaims");

            migrationBuilder.DropTable(
                name: "Is4_ApiScopeProperties");

            migrationBuilder.DropTable(
                name: "Is4_ClientClaims");

            migrationBuilder.DropTable(
                name: "Is4_ClientCorsOrigins");

            migrationBuilder.DropTable(
                name: "Is4_ClientGrantTypes");

            migrationBuilder.DropTable(
                name: "Is4_ClientIdPRestrictions");

            migrationBuilder.DropTable(
                name: "Is4_ClientPostLogoutRedirectUris");

            migrationBuilder.DropTable(
                name: "Is4_ClientProperties");

            migrationBuilder.DropTable(
                name: "Is4_ClientRedirectUris");

            migrationBuilder.DropTable(
                name: "Is4_ClientScopes");

            migrationBuilder.DropTable(
                name: "Is4_ClientSecrets");

            migrationBuilder.DropTable(
                name: "Is4_IdentityResourceClaims");

            migrationBuilder.DropTable(
                name: "Is4_IdentityResourceProperties");

            migrationBuilder.DropTable(
                name: "Is4_ApiResources");

            migrationBuilder.DropTable(
                name: "Is4_ApiScopes");

            migrationBuilder.DropTable(
                name: "Is4_Clients");

            migrationBuilder.DropTable(
                name: "Is4_IdentityResources");
        }
    }
}
