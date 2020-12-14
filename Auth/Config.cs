// Copyright (c) Brock Allen & Dominick Baier. All rights reserved.
// Licensed under the Apache License, Version 2.0. See LICENSE in the project root for license information.


using System.Collections.Generic;
using IdentityServer4.Models;

namespace Auth {
    public static class Config {
        public static IEnumerable<IdentityResource> IdentityResources =>
            new IdentityResource[] {
                new IdentityResources.OpenId(),
                new IdentityResources.Profile()
            };

        public static IEnumerable<ApiScope> ApiScopes =>
            new[] {
                new ApiScope("scope1"),
                new ApiScope("scope2")
            };

        public static IEnumerable<Client> Clients =>
            new[] {
                // m2m client credentials flow client
                new Client {
                    ClientId = "m2m.client",
                    ClientName = "Client Credentials Client",

                    AllowedGrantTypes = GrantTypes.ClientCredentials,
                    ClientSecrets = {new Secret("511536EF-F270-4058-80CA-1C89C192F69A".Sha256())},

                    AllowedScopes = {"scope1"}
                },

                // interactive client using code flow + pkce
                new Client {
                    ClientId = "interactive",
                    ClientSecrets = {new Secret("49C1A7E1-0C79-4A89-A3D6-A37998FB86B0".Sha256())},

                    AllowedGrantTypes = GrantTypes.Code,

                    RedirectUris = {"https://localhost:44314/signin-oidc", "https://localhost:44314/silent-renew.html"},
                    FrontChannelLogoutUri = "https://localhost:44314/signout-oidc",
                    PostLogoutRedirectUris = {"https://localhost:44314/"},
                    AllowedCorsOrigins = {"https://localhost:44314/"},

                    AllowOfflineAccess = true,
                    AllowedScopes = {"openid", "profile", "scope2"}
                }
            };
    }
}