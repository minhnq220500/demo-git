using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PPQ
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Declaring a program segment in the ItemCommand event of the DataList control 
        // that retrieves information of the selected product.
        // ItemCommand event: Occurs when any button is clicked in the DataList control.
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            // Searches the controls in each DataListItem control
            DataListItem dataListItem = e.Item;
            Label labelID = (Label)dataListItem.FindControl("lblID");
            HyperLink hyperLink = (HyperLink)dataListItem.FindControl("hyperLinkName");
            Label labelPrice = (Label)dataListItem.FindControl("lblPrice");
            Literal1.Text = "You just added \"" + hyperLink.Text + "\" to Shopping cart";
            // Call the method to add to the shopping cart
            AddToShoppingCart(labelID.Text, hyperLink.Text, labelPrice.Text);
        }

        // The AddToShoppingCart method allows you to test the Session object named ShoppingCart
        void AddToShoppingCart(string itemID, string itemName, string itemPrice)
        {
            DataTable dataTable;
            // If this object does not already exist, initialize the DataTable object and 
            // then add the information of the selected product to the DataTable object
            if (Session["ShoppingCart"] == null)
            {
                dataTable = new DataTable();
                dataTable.Columns.Add("ID");
                dataTable.Columns.Add("Name");
                dataTable.Columns.Add("Quantity");
                dataTable.Columns.Add("Price");
            }
            // If the Shopping Cart object already exists, you declare to convert the data 
            // type of this object into the DataTable object
            else
            {
                dataTable = (DataTable)Session["ShoppingCart"];
            }
            // Check whether the product already exists in ShoppingCart
            Common cls = new Common();
            int indexOfItem = cls.IsExistItemInShoppingCart(itemID, dataTable);
            // If there are already, update add 1 
            if (indexOfItem != -1)
            {
                dataTable.Rows[indexOfItem]["Quantity"] = Convert.ToInt32(dataTable.Rows[indexOfItem]["Quantity"]) + 1;
            }
            // If not, add a new product to Shopping Cart
            else
            {
                DataRow dataRow = dataTable.NewRow();
                dataRow["ID"] = itemID;
                dataRow["Name"] = itemName;
                dataRow["Quantity"] = "1";
                dataRow["Price"] = itemPrice;
                dataTable.Rows.Add(dataRow);
            }
            // Assign the DataTable object to the Session object
            Session["ShoppingCart"] = dataTable;
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            //DataListItem dataListItem = e.Item;
            //HyperLink hyperLink = (HyperLink)dataListItem.FindControl("hyperLinkName");
            //Label labelID = (Label)dataListItem.FindControl("lblID");
            //hyperLink.NavigateUrl = "Details.aspx?ItemID=" + labelID.Text;
        }
    }
}