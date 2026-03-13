using System;

namespace HAIR_TRAIT
{
    public partial class _Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnServices_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }
    }
}