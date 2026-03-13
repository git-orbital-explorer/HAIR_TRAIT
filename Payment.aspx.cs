using System;
using System.Data.SqlClient;

namespace HAIR_TRAIT
{
    public partial class Payment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If cart is empty, disable payment form
            if (Session["CartItems"] == null)
            {
                lblMessage.Text = "Your cart is empty. Add products first.";
                pnlPayment.Visible = false;
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            string paymentType = rblPaymentType.SelectedValue;
            string name = txtName.Text.Trim();

            if (string.IsNullOrEmpty(paymentType) || string.IsNullOrEmpty(name))
            {
                lblMessage.Text = "Payment type and name are required.";
                return;
            }

            // Get UserID from session if logged in
            int? userID = Session["UserID"] != null ? Convert.ToInt32(Session["UserID"]) : (int?)null;

            // Pick first product from CartItems for demo
            int? productID = null;
            if (Session["CartItems"] != null)
            {
                var cart = Session["CartItems"] as System.Collections.Generic.List<int>;
                if (cart.Count > 0) productID = cart[0];
            }

            // Insert order into Orders table
            string connStr = @"Server=YOUR_SERVER_NAME;Database=YOUR_DB_NAME;Trusted_Connection=True;";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string sql = "INSERT INTO Orders (UserID, ProductID, OrderDate, Status) " +
                             "VALUES (@UserID, @ProductID, GETDATE(), @Status)";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", (object)userID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ProductID", (object)productID ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Status", "Order Confirmed");

                    conn.Open();
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
            }

            // Hide payment form and show confirmation
            pnlPayment.Visible = false;
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "✅ Your order has been confirmed!";
        }
    }
}