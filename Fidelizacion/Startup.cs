using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Fidelizacion.Startup))]
namespace Fidelizacion
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
