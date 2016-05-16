using System.Web;
using System.Web.Optimization;

namespace Fidelizacion
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            // bootstrap
            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.js",
                      "~/Scripts/respond.js"));

            bundles.Add(new StyleBundle("~/Content/bootstrap").Include(
                      "~/Content/bootstrap.min.css",
                       "~/Content/carousel.css"));

            // datetimepicker
            bundles.Add(new ScriptBundle("~/bundles/datetimepicker").Include(
                      "~/Scripts/moment-with-locales.js",
                      "~/Scripts/bootstrap-datetimepicker.min.js"));

            bundles.Add(new StyleBundle("~/Content/datetimepicker").Include(
                      "~/Scripts/bootstrap-datetimepicker.min.css"));

            // bootbox
            bundles.Add(new ScriptBundle("~/bundles/bootbox").Include(
                      "~/Scripts/bootbox.min.js"));

            // typeahead
            bundles.Add(new ScriptBundle("~/bundles/typeahead").Include(
                      "~/Scripts/bootstrap3-typeahead.min.js"));

            // datatables
            bundles.Add(new ScriptBundle("~/bundles/datatables").Include(
                      "~/Scripts/jquery.dataTables.min.js",
                      "~/Scripts/dataTables.bootstrap.min.js"));

            bundles.Add(new StyleBundle("~/Content/datatables").Include(
                      "~/Content/dataTables.bootstrap.min.css"));

            // gml resources
            bundles.Add(new ScriptBundle("~/bundles/js").Include(
                      ));

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/dashboard.css",
                      "~/Content/style.css"));
        }
    }
}
