using System;
using System.Data;
using System.Web.UI.WebControls;

namespace PPQ
{
    public partial class YourCart : System.Web.UI.Page
    {
        // Cart presentation
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // If the cart does not exist yet
                if (Session["ShoppingCart"] == null)
                {
                    Literal1.Text = "Sorry, Your shopping cart is empty";
                    this.btnDelete.Enabled = false;
                    this.btnEmpty.Enabled = false;
                    this.btnUpdate.Enabled = false;
                    this.btnCheckOut.Enabled = false;
                }
                // If the cart exists
                else
                {
                    this.btnDelete.Enabled = true;
                    this.btnEmpty.Enabled = true;
                    this.btnUpdate.Enabled = true;
                    this.btnCheckOut.Enabled = true;
                    DataTable dataTable = (DataTable)Session["ShoppingCart"];
                    DataList1.DataSource = dataTable;
                    DataList1.DataBind();
                }
            }
        }

        // Occurs when the Delete button is clicked for an item in the DataList control
        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            DataListItem dataListItem = e.Item;
            Label labelID = (Label)dataListItem.FindControl("lblID");
            RemoveShoppingCart(labelID.Text);
            Label labelName = (Label)dataListItem.FindControl("lblName");
            Literal1.Text = "Item " + labelName.Text + " has removed";
            if (this.DataList1.Items.Count == 0)
            {
                this.btnDelete.Enabled = false;
                this.btnEmpty.Enabled = false;
                this.btnUpdate.Enabled = false;
                this.btnCheckOut.Enabled = false;
            }
        }

        // Remove the selected product from the shopping cart
        void RemoveShoppingCart(string itemID)
        {
            if (Session["ShoppingCart"] == null)
            {
                Literal1.Text = "Sorry, Can not remove item in your shopping cart";
            }
            else
            {
                DataTable dataTable = (DataTable)Session["ShoppingCart"];
                Common common = new Common();
                int indexOfRow = common.IsExistItemInShoppingCart(itemID, dataTable);
                if (indexOfRow != -1)
                {
                    dataTable.Rows.RemoveAt(indexOfRow);
                    Session["ShoppingCart"] = dataTable;
                    DataList1.DataSource = dataTable;
                    DataList1.DataBind();
                }
            }
        }

        // Cancel the cart
        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            Session.Remove("ShoppingCart");
            DataList1.DataSource = null;
            DataList1.DataBind();
            Literal1.Text = "Your Shopping Cart has been removed";
            this.btnDelete.Enabled = false;
            this.btnEmpty.Enabled = false;
            this.btnUpdate.Enabled = false;
            this.btnCheckOut.Enabled = false;
        }

        // Delete the user-selected items in the CheckBox control
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DataTable dataTable = (DataTable)Session["ShoppingCart"];
            string itemID = "";
            foreach (DataListItem dataListItem in DataList1.Items)
            {
                CheckBox checkBox = (CheckBox)dataListItem.FindControl("chkID");
                if (checkBox.Checked)
                {
                    Label labelID = (Label)dataListItem.FindControl("lblID");
                    itemID += labelID.Text + ",";
                    DeleteItems(labelID.Text, dataTable);
                }
            }
            if (itemID != "")
            {
                DataList1.DataSource = dataTable;
                DataList1.DataBind();
                if (this.DataList1.Items.Count == 0)
                {
                    this.btnDelete.Enabled = false;
                    this.btnEmpty.Enabled = false;
                    this.btnUpdate.Enabled = false;
                    this.btnCheckOut.Enabled = false;
                }
                Literal1.Text = "Items (" +
                itemID.Substring(0, itemID.Length
                - 1) + ") have been deleted";
            }
        }
        void DeleteItems(string itemID, DataTable dataTable)
        {
            foreach (DataRow dataRow in dataTable.Rows)
            {
                if (itemID == dataRow["ID"].ToString())
                {
                    dataTable.Rows.Remove(dataRow);
                    break;
                }
            }
            Session["ShoppingCart"] = dataTable;
        }

        // Update product quantity
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            DataTable dataTable = (DataTable)Session["ShoppingCart"];

            foreach (DataListItem dataListItem in DataList1.Items)
            {
                TextBox textBox = (TextBox)dataListItem.FindControl("txtQuantity");
                if (textBox != null)
                {
                    Label labelID =
                    (Label)dataListItem.FindControl("lblID");
                    UpdateCart(labelID.Text,
                    Convert.ToInt32(textBox.Text), dataTable);
                }
            }
            Session["ShoppingCart"] = dataTable;
            Literal1.Text = "Shopping Cart has been updated";
        }
        void UpdateCart(string itemID,
        int itemQuantity, DataTable dataTable)
        {
            foreach (DataRow dataRow in dataTable.Rows)
            {
                if (itemID == dataRow["ID"].ToString())
                {
                    dataRow["Quantity"] = itemQuantity;
                    break;
                }
            }
        }
    }
}