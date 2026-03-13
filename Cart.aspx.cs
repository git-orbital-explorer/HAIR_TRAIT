using System;
using System.Data;
using System.Web.UI.WebControls;

namespace HAIR_TRAIT
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Only logged-in users
            if (Session["Role"] == null)
                Response.Redirect("~/Login.aspx");

            if (!IsPostBack)
                BindCart();
        }

        private void BindCart()
        {
            DataTable cart = Session["Cart"] as DataTable;
            if (cart == null)
                cart = new DataTable();

            GridViewCart.DataSource = cart;
            GridViewCart.DataBind();

            decimal total = 0;
            foreach (DataRow row in cart.Rows)
                total += (decimal)row["Price"] * (int)row["Quantity"];

            lblTotal.Text = "Total: " + total.ToString("C");
        }

        protected void GridViewCart_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RemoveItem")
            {
                int serviceId = Convert.ToInt32(e.CommandArgument);
                DataTable cart = Session["Cart"] as DataTable;
                if (cart != null)
                {
                    DataRow[] rows = cart.Select("ServiceID = " + serviceId);
                    foreach (DataRow row in rows)
                        cart.Rows.Remove(row);

                    Session["Cart"] = cart;
                    BindCart();
                }
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Optional: Insert orders into DB

            Session["Cart"] = null;
            BindCart();
            lblTotal.Text = "Thank you for your purchase!";
        }
    }
}