using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;

namespace Web {
    public static class SsrMiddlewareExtensions {
        public static IApplicationBuilder UseSsr(this IApplicationBuilder builder) {
            return builder.UseMiddleware<SsrMiddleware>();
        }
    }
}
