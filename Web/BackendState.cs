using Microsoft.AspNetCore.Antiforgery;

namespace Web {
    public class BackendState {
        public bool Mobile { get; set; }
        public AntiforgeryTokenSet AntiForgeryToken { get; set; }
        public Deployment Deployment { get; set; }
    }
}
