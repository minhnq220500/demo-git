using System;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace PPQ
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ShoppingCart"] == null)
            {
                Literal1.Text = "Sorry, Your shopping cart is empty";
                this.btnOrder.Enabled = false;
            }
            else
            {
                this.btnOrder.Enabled = true;
                // Retrieves the data from the Session object into the DataTable object
                DataTable dataTable = (DataTable)Session["ShoppingCart"];
                // Calculate the total order value
                GetTotalAmount(dataTable, this.Literal2);
                DataList1.DataSource = dataTable;
                DataList1.DataBind();
            }
        }
        void GetTotalAmount(DataTable dataTable, Literal literal)
        {
            int totalAmount = 0;
            foreach (DataRow dataRow in dataTable.Rows)
            {
                totalAmount += Convert.ToInt32(dataRow["Quantity"])
                * Convert.ToInt32(dataRow["Price"]);
            }
            literal.Text = totalAmount.ToString("#,###,00");
        }
        protected void btnOrder_Click(object sender, EventArgs e)
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["conn"].ConnectionString;
                // Declare and initialize the SqlServerProvider object
                SqlServerProvider sqlServerProvider = new SqlServerProvider(connectionString);
                // Declare the property of the SqlServerProvider object
                sqlServerProvider.CommandText = "SPOrders";
                sqlServerProvider.CommandType = CommandType.StoredProcedure;
                // Declare the array of parameters
                sqlServerProvider.ParameterCollection = new string[8] { "@OrderID", "@CustomerName", "@ContactPerson", "@Address", "@Tel", "@PaymentType", "@Description", "@TotalValue" };
                // Declare the array of values for the parameter
                sqlServerProvider.ValueCollection = new string[8] { "0", this.txtFullName.Text, this.txtContact.Text, txtAddress.Text, txtTel.Text, ddlPayType.SelectedValue, txtDescription.Text, Literal2.Text };
                // Declare the return parameter for column 0
                sqlServerProvider.ReturnValueParameter = 0;
                // Call the ExecuteNonQuery method to add customer information to the Orders table
                sqlServerProvider.ExecuteNonQuery();
                // Retrieve OrderID as an automatic number
                int returnValue = sqlServerProvider.ReturnValue;

                // Declare the array of parameters 
                sqlServerProvider.CommandText = "SPOrderDetails";
                sqlServerProvider.ParameterCollection = new string[4] { "@OrderID", "@ItemID", "@Quantity", "@Price" };
                // Declare the array of values for the parameter
                sqlServerProvider.ValueCollection = new string[4] { returnValue.ToString(), "", "", "" };
                // Declare the return parameter for column -1
                sqlServerProvider.ReturnValueParameter = -1;
                // Browse through each product
                for (int i = 0; i < DataList1.Items.Count; i++)
                {
                    // Update the value for the parameter
                    Label labelID = (Label)DataList1.Items[i].FindControl("lblID");
                    sqlServerProvider.ValueCollection[1] = labelID.Text;
                    labelID = (Label)DataList1.Items[i].FindControl("lblQuantity");
                    sqlServerProvider.ValueCollection[2] = labelID.Text;
                    labelID = (Label)DataList1.Items[i].FindControl("lblPrice");
                    sqlServerProvider.ValueCollection[3] = labelID.Text;
                    // Call the ExecuteNonQuery method to add product information to the OrderDetails table
                    sqlServerProvider.ExecuteNonQuery();
                }

                Session.Remove("ShoppingCart");
                Response.Redirect("Thankyou.aspx"); ;
            }
            catch (Exception ex)
            {
                Literal1.Text = ex.Message;
            }
        }
    }
}