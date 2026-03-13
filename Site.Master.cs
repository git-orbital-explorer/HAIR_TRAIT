using System;

namespace HAIR_TRAIT
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Default guest view
            lnkLogin.Visible = true;
            lnkSignup.Visible = true;
            lnkLogout.Visible = false;
            lblUser.Text = "";

            hlProducts.Visible = true;  // Products always visible
            hlCart.Visible = false;     // Cart hidden for guests
            lnkAdmin.Visible = false;   // Admin link hidden by default
            hlHome.NavigateUrl = "~/Home.aspx"; // Home links to Home.aspx

            if (Session["Role"] != null)
            {
                string role = Session["Role"].ToString();

                // Hide guest links
                lnkLogin.Visible = false;
                lnkSignup.Visible = false;
                lnkLogout.Visible = true;

                // Admin user
                if (role == "admin")
                {
                    lblUser.Text = Session["Email"]?.ToString() ?? "Admin";
                    hlCart.Visible = true;      // Cart now visible for admin
                    lnkAdmin.Visible = true;    // Admin link visible
                }
                // Normal user
                else
                {
                    lblUser.Text = "Hello, " + (Session["Name"]?.ToString() ?? "User");
                    hlCart.Visible = true;      // non-admin users see cart
                    lnkAdmin.Visible = false;
                }
            }
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/Home.aspx");
        }
    }
}