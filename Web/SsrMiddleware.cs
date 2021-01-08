using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Antiforgery;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.Extensions.Options;

namespace Web {
    public class SsrMiddleware {
        private readonly RequestDelegate _next;
        private readonly IAntiforgery _antiforgery;
        private readonly IOptions<Deployment> _deployment;

        public SsrMiddleware(RequestDelegate next, IAntiforgery antiforgery, IOptions<Deployment> deployment) {
            _next = next;
            _antiforgery = antiforgery;
            _deployment = deployment;
        }

        public async Task Invoke(HttpContext httpContext) {
            var backendState = new BackendState {
                Mobile = false,
                AntiForgeryToken = _antiforgery.GetAndStoreTokens(httpContext),
                Deployment = _deployment.Value
            };
            var jsonOpts = new JsonSerializerOptions {
                PropertyNamingPolicy = JsonNamingPolicy.CamelCase
            };
            var stateJson = JsonSerializer.Serialize(backendState, jsonOpts);
            var angularPath = httpContext.Request.GetEncodedUrl();
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

            var result = await File.ReadAllTextAsync(Path.Combine("ClientApp", "out.html"));
            var stdOutResult = await stdOut.ReadToEndAsync();
            var stdErrResult = await stdErr.ReadToEndAsync();
            Debug.Print(processStartInfo.Arguments);
            Debug.Print(stdOutResult);
            Debug.Print(stdErrResult);
            //Debug.Print(result);
            await httpContext.Response.WriteAsync(result);
            await httpContext.Response.CompleteAsync();
        }
    }
}
