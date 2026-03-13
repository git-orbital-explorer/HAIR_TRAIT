using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace HAIR_TRAIT
{
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Guests can view products
            if (!IsPostBack)
                LoadServices();

            // Show Add Product button only for admin
            btnAddProduct.Visible = (Session["Role"] != null && Session["Role"].ToString() == "admin");
        }

        private void LoadServices()
        {
            string connStr = ConfigurationManager.ConnectionStrings["Hair_Star_DB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Services", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridViewProduct.DataSource = dt;
                GridViewProduct.DataBind();
            }
        }

        protected void GridViewProduct_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddToCart")
            {
                // Only logged-in normal users can add to cart
                if (Session["Role"] == null || Session["Role"].ToString() == "admin")
                {
                    Response.Redirect("~/Login.aspx");
                    return;
                }

                int rowIndex = Convert.ToInt32(e.CommandArgument);
                int serviceId = Convert.ToInt32(GridViewProduct.DataKeys[rowIndex].Value);

                string connStr = ConfigurationManager.ConnectionStrings["Hair_Star_DB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Services WHERE ServiceID=@id", conn);
                    cmd.Parameters.AddWithValue("@id", serviceId);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        DataTable cart;
                        if (Session["Cart"] == null)
                        {
                            cart = new DataTable();
                            cart.Columns.Add("ServiceID", typeof(int));
                            cart.Columns.Add("ServiceName", typeof(string));
                            cart.Columns.Add("Price", typeof(decimal));
                            cart.Columns.Add("ImageURL", typeof(string));
                            cart.Columns.Add("Quantity", typeof(int));
                        }
                        else
                        {
                            cart = (DataTable)Session["Cart"];
                        }

                        // Check if service already in cart
                        DataRow[] existingRows = cart.Select("ServiceID = " + serviceId);
                        if (existingRows.Length > 0)
                        {
                            existingRows[0]["Quantity"] = (int)existingRows[0]["Quantity"] + 1;
                        }
                        else
                        {
                            DataRow row = cart.NewRow();
                            row["ServiceID"] = serviceId;
                            row["ServiceName"] = reader["ServiceName"];
                            row["Price"] = Convert.ToDecimal(reader["Price"]);
                            row["ImageURL"] = reader["ImageURL"];
                            row["Quantity"] = 1;
                            cart.Rows.Add(row);
                        }

                        Session["Cart"] = cart;
                        Response.Redirect("Cart.aspx");
                    }
                }
            }
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            // Only admin can add products
            if (Session["Role"] == null || Session["Role"].ToString() != "admin")
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            // Simple validation to prevent nulls
            if (string.IsNullOrWhiteSpace(txtServiceName.Text) || string.IsNullOrWhiteSpace(txtPrice.Text))
            {
                lblMessage.Text = "Please fill all required fields.";
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["Hair_Star_DB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO Services (ServiceName, Price, Description, ImageURL) VALUES (@name, @price, @desc, @img)", conn);
                cmd.Parameters.AddWithValue("@name", txtServiceName.Text);
                cmd.Parameters.AddWithValue("@price", Convert.ToDecimal(txtPrice.Text));
                cmd.Parameters.AddWithValue("@desc", txtDescription.Text ?? "");
                cmd.Parameters.AddWithValue("@img", txtImageURL.Text ?? "");
                cmd.ExecuteNonQuery();
            }

            lblMessage.Text = "Product added successfully!";
            LoadServices(); // refresh product list
        }
    }
}