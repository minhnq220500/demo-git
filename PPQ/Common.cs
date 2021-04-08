using System.Data;

namespace PPQ
{
    public class Common
    {
        public Common()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        // The IsExistItemInShoppingCart method allow you Check whether the 
        // product already exists in ShoppingCart
        public int IsExistItemInShoppingCart(string itemID, DataTable dataTable)
        {
            int indexOfRow = -1;
            for (int dataRow = 0; dataRow < dataTable.Rows.Count; dataRow++)
            {
                if (dataTable.Rows[dataRow]["ID"].ToString() == itemID)
                {
                    indexOfRow = dataRow;
                    break;
                }
            }
            return indexOfRow;
        }
    }
}