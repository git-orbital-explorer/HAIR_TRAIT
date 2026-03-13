using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HAIR_TRAIT
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["Hair_Star_DB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(
                "SELECT Role FROM Users WHERE Email=@email AND Password=@pass AND Role=@role", conn);

                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@pass", txtPassword.Text);
                cmd.Parameters.AddWithValue("@role", rblRole.SelectedValue);

                object role = cmd.ExecuteScalar();

                if (role != null)
                {
                    Session["Email"] = txtEmail.Text;
                    Session["Role"] = role.ToString();

                    if (role.ToString() == "admin")
                    {
                        Response.Redirect("~/Admin/ManageServices.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Home.aspx");
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid credentials or incorrect role selected.";
                }
            }
        }
    }
}