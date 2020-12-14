using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace Auth.Migrations.Configuration {
    public partial class Configuration : Migration {
        protected override void Up(MigrationBuilder migrationBuilder) {
            migrationBuilder.CreateTable(
                "Is4_ApiResources",
                table => new {
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
                constraints: table => { table.PrimaryKey("PK_Is4_ApiResources", x => x.Id); });

            migrationBuilder.CreateTable(
                "Is4_ApiScopes",
                table => new {
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
                constraints: table => { table.PrimaryKey("PK_Is4_ApiScopes", x => x.Id); });

            migrationBuilder.CreateTable(
                "Is4_Clients",
                table => new {
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
                constraints: table => { table.PrimaryKey("PK_Is4_Clients", x => x.Id); });

            migrationBuilder.CreateTable(
                "Is4_IdentityResources",
                table => new {
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
                constraints: table => { table.PrimaryKey("PK_Is4_IdentityResources", x => x.Id); });

            migrationBuilder.CreateTable(
                "Is4_ApiResourceClaims",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(maxLength: 200, nullable: false),
                    ApiResourceId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ApiResourceClaims", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ApiResourceClaims_Is4_ApiResources_ApiResourceId",
                        x => x.ApiResourceId,
                        "Is4_ApiResources",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ApiResourceProperties",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Key = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    ApiResourceId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ApiResourceProperties", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ApiResourceProperties_Is4_ApiResources_ApiResourceId",
                        x => x.ApiResourceId,
                        "Is4_ApiResources",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ApiResourceScopes",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Scope = table.Column<string>(maxLength: 200, nullable: false),
                    ApiResourceId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ApiResourceScopes", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ApiResourceScopes_Is4_ApiResources_ApiResourceId",
                        x => x.ApiResourceId,
                        "Is4_ApiResources",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ApiResourceSecrets",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(maxLength: 1000, nullable: true),
                    Value = table.Column<string>(maxLength: 4000, nullable: false),
                    Expiration = table.Column<DateTime>(nullable: true),
                    Type = table.Column<string>(maxLength: 250, nullable: false),
                    Created = table.Column<DateTime>(nullable: false),
                    ApiResourceId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ApiResourceSecrets", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ApiResourceSecrets_Is4_ApiResources_ApiResourceId",
                        x => x.ApiResourceId,
                        "Is4_ApiResources",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ApiScopeClaims",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(maxLength: 200, nullable: false),
                    ScopeId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ApiScopeClaims", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ApiScopeClaims_Is4_ApiScopes_ScopeId",
                        x => x.ScopeId,
                        "Is4_ApiScopes",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ApiScopeProperties",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Key = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    ScopeId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ApiScopeProperties", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ApiScopeProperties_Is4_ApiScopes_ScopeId",
                        x => x.ScopeId,
                        "Is4_ApiScopes",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientClaims",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 250, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientClaims", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientClaims_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientCorsOrigins",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Origin = table.Column<string>(maxLength: 150, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientCorsOrigins", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientCorsOrigins_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientGrantTypes",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    GrantType = table.Column<string>(maxLength: 250, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientGrantTypes", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientGrantTypes_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientIdPRestrictions",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Provider = table.Column<string>(maxLength: 200, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientIdPRestrictions", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientIdPRestrictions_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientPostLogoutRedirectUris",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PostLogoutRedirectUri = table.Column<string>(maxLength: 2000, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientPostLogoutRedirectUris", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientPostLogoutRedirectUris_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientProperties",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Key = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientProperties", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientProperties_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientRedirectUris",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RedirectUri = table.Column<string>(maxLength: 2000, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientRedirectUris", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientRedirectUris_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientScopes",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Scope = table.Column<string>(maxLength: 200, nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientScopes", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientScopes_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_ClientSecrets",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Description = table.Column<string>(maxLength: 2000, nullable: true),
                    Value = table.Column<string>(maxLength: 4000, nullable: false),
                    Expiration = table.Column<DateTime>(nullable: true),
                    Type = table.Column<string>(maxLength: 250, nullable: false),
                    Created = table.Column<DateTime>(nullable: false),
                    ClientId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_ClientSecrets", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_ClientSecrets_Is4_Clients_ClientId",
                        x => x.ClientId,
                        "Is4_Clients",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_IdentityResourceClaims",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Type = table.Column<string>(maxLength: 200, nullable: false),
                    IdentityResourceId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_IdentityResourceClaims", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_IdentityResourceClaims_Is4_IdentityResources_IdentityResourceId",
                        x => x.IdentityResourceId,
                        "Is4_IdentityResources",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                "Is4_IdentityResourceProperties",
                table => new {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Key = table.Column<string>(maxLength: 250, nullable: false),
                    Value = table.Column<string>(maxLength: 2000, nullable: false),
                    IdentityResourceId = table.Column<int>(nullable: false)
                },
                constraints: table => {
                    table.PrimaryKey("PK_Is4_IdentityResourceProperties", x => x.Id);
                    table.ForeignKey(
                        "FK_Is4_IdentityResourceProperties_Is4_IdentityResources_IdentityResourceId",
                        x => x.IdentityResourceId,
                        "Is4_IdentityResources",
                        "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                "IX_Is4_ApiResourceClaims_ApiResourceId",
                "Is4_ApiResourceClaims",
                "ApiResourceId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ApiResourceProperties_ApiResourceId",
                "Is4_ApiResourceProperties",
                "ApiResourceId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ApiResources_Name",
                "Is4_ApiResources",
                "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                "IX_Is4_ApiResourceScopes_ApiResourceId",
                "Is4_ApiResourceScopes",
                "ApiResourceId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ApiResourceSecrets_ApiResourceId",
                "Is4_ApiResourceSecrets",
                "ApiResourceId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ApiScopeClaims_ScopeId",
                "Is4_ApiScopeClaims",
                "ScopeId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ApiScopeProperties_ScopeId",
                "Is4_ApiScopeProperties",
                "ScopeId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ApiScopes_Name",
                "Is4_ApiScopes",
                "Name",
                unique: true);

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientClaims_ClientId",
                "Is4_ClientClaims",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientCorsOrigins_ClientId",
                "Is4_ClientCorsOrigins",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientGrantTypes_ClientId",
                "Is4_ClientGrantTypes",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientIdPRestrictions_ClientId",
                "Is4_ClientIdPRestrictions",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientPostLogoutRedirectUris_ClientId",
                "Is4_ClientPostLogoutRedirectUris",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientProperties_ClientId",
                "Is4_ClientProperties",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientRedirectUris_ClientId",
                "Is4_ClientRedirectUris",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_Clients_ClientId",
                "Is4_Clients",
                "ClientId",
                unique: true);

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientScopes_ClientId",
                "Is4_ClientScopes",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_ClientSecrets_ClientId",
                "Is4_ClientSecrets",
                "ClientId");

            migrationBuilder.CreateIndex(
                "IX_Is4_IdentityResourceClaims_IdentityResourceId",
                "Is4_IdentityResourceClaims",
                "IdentityResourceId");

            migrationBuilder.CreateIndex(
                "IX_Is4_IdentityResourceProperties_IdentityResourceId",
                "Is4_IdentityResourceProperties",
                "IdentityResourceId");

            migrationBuilder.CreateIndex(
                "IX_Is4_IdentityResources_Name",
                "Is4_IdentityResources",
                "Name",
                unique: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder) {
            migrationBuilder.DropTable(
                "Is4_ApiResourceClaims");

            migrationBuilder.DropTable(
                "Is4_ApiResourceProperties");

            migrationBuilder.DropTable(
                "Is4_ApiResourceScopes");

            migrationBuilder.DropTable(
                "Is4_ApiResourceSecrets");

            migrationBuilder.DropTable(
                "Is4_ApiScopeClaims");

            migrationBuilder.DropTable(
                "Is4_ApiScopeProperties");

            migrationBuilder.DropTable(
                "Is4_ClientClaims");

            migrationBuilder.DropTable(
                "Is4_ClientCorsOrigins");

            migrationBuilder.DropTable(
                "Is4_ClientGrantTypes");

            migrationBuilder.DropTable(
                "Is4_ClientIdPRestrictions");

            migrationBuilder.DropTable(
                "Is4_ClientPostLogoutRedirectUris");

            migrationBuilder.DropTable(
                "Is4_ClientProperties");

            migrationBuilder.DropTable(
                "Is4_ClientRedirectUris");

            migrationBuilder.DropTable(
                "Is4_ClientScopes");

            migrationBuilder.DropTable(
                "Is4_ClientSecrets");

            migrationBuilder.DropTable(
                "Is4_IdentityResourceClaims");

            migrationBuilder.DropTable(
                "Is4_IdentityResourceProperties");

            migrationBuilder.DropTable(
                "Is4_ApiResources");

            migrationBuilder.DropTable(
                "Is4_ApiScopes");

            migrationBuilder.DropTable(
                "Is4_Clients");

            migrationBuilder.DropTable(
                "Is4_IdentityResources");
        }
    }
}