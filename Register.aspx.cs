using System;
using System.Configuration;
using System.Data.SqlClient;

namespace HAIR_TRAIT
{
    public partial class Register : System.Web.UI.Page
    {

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            if (txtPassword.Text != txtConfirmPassword.Text)
            {
                lblMessage.Text = "Passwords do not match";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["Hair_Star_DB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                SqlCommand check = new SqlCommand(
                "SELECT COUNT(*) FROM Users WHERE Email=@email", conn);

                check.Parameters.AddWithValue("@email", txtEmail.Text);

                int exists = (int)check.ExecuteScalar();

                if (exists > 0)
                {
                    lblMessage.Text = "Email already registered";
                    return;
                }

                SqlCommand cmd = new SqlCommand(
                "INSERT INTO Users (Name,Email,Password,Role) VALUES (@name,@email,@pass,'user')", conn);

                cmd.Parameters.AddWithValue("@name", txtName.Text);
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@pass", txtPassword.Text);

                cmd.ExecuteNonQuery();

                lblMessage.Text = "Registration successful. Please login.";

            }

        }

    }
}