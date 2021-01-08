using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace Api.Controllers {
    [ApiController]
    [Route("[controller]/[action]")]
    [Authorize]
    public class SecuredController : ControllerBase {
        private ILogger<SecuredController> _logger;

        public SecuredController(ILogger<SecuredController> logger) {
            _logger = logger;
        }

        public string GetData() {
            return "secret revealed";
        }
    }
}
