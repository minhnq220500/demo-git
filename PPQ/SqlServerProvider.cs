using System;
using System.Data;
using System.Data.SqlClient;

namespace PPQ
{
    public class SqlServerProvider
    {
        private SqlConnection sqlConnection;
        private SqlCommand sqlCommand;

        private string connectionString = "";
        public string ConnectionString
        {
            set { connectionString = value; }
            get { return connectionString; }
        }

        private string commandText = "";
        public string CommandText
        {
            set { commandText = value; }
            get { return commandText; }
        }

        private CommandType commandType;
        public CommandType CommandType
        {
            set { commandType = value; }
            get { return commandType; }
        }

        private string[] parameterCollection;
        public string[] ParameterCollection
        {
            set { parameterCollection = value; }
            get { return parameterCollection; }
        }

        private string[] valueCollection;
        public string[] ValueCollection
        {
            set { valueCollection = value; }
            get { return valueCollection; }
        }

        private int returnValueParameter = -1;
        public int ReturnValueParameter
        {
            set { returnValueParameter = value; }
            get { return returnValueParameter; }
        }

        private int returnValue = 0;
        public int ReturnValue
        {
            set { returnValue = value; }
            get { return returnValue; }
        }

        private string errorMessage = "";
        public string ErrorMessage
        {
            set { errorMessage = value; }
            get { return errorMessage; }
        }

        private int errorCode = 0;
        public int ErrorCode
        {
            set { errorCode = value; }
            get { return errorCode; }
        }

        public SqlServerProvider()
        {
            connectionString = "server=(local);" +
                "database=RecruitVietnamDb;" +
                "Integrated Security=SSPI;";
        }

        public SqlServerProvider(string conString)
        {
            connectionString = conString;
            OpenConnection();
        }

        private void OpenConnection()
        {
            if (sqlConnection == null || sqlConnection.State == ConnectionState.Closed)
            {
                sqlConnection = new SqlConnection();
                sqlConnection.ConnectionString = connectionString;
                sqlConnection.Open();
            }
        }

        public void CloseConnection()
        {
            if (sqlConnection.State == ConnectionState.Open)
            {
                sqlConnection.Close();
            }
            sqlConnection.Dispose();
        }

        void AddParameters(SqlCommand sqlCommand)
        {
            for (int i = 0; i < parameterCollection.Length; i++)
            {
                if (valueCollection[i] != "")
                {
                    sqlCommand.Parameters.AddWithValue(
                    parameterCollection[i], valueCollection[i]);

                }
            }
            if (returnValueParameter != -1)
            {
                sqlCommand.Parameters[
                returnValueParameter].Direction =
                ParameterDirection.ReturnValue;
            }
        }

        // Summary description for SqlServerTransaction
        #region	 ExecuteNonQuery
        public int ExecuteNonQuery()
        {
            sqlCommand = new SqlCommand();
            sqlCommand.CommandText = commandText;
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandType = commandType;
            if (ParameterCollection.Length > 0)
                AddParameters(sqlCommand);

            int rows = sqlCommand.ExecuteNonQuery();
            if (returnValueParameter != -1)
                returnValue = Convert.ToInt32(
                sqlCommand.Parameters[
                returnValueParameter].Value);
            sqlCommand.Dispose();
            return rows;

        }
        #endregion

        #region ExecuteScalar
        public object ExecuteScalar()
        {
            sqlCommand = new SqlCommand();
            sqlCommand.CommandText = commandText;
            sqlCommand.Connection = sqlConnection;
            sqlCommand.CommandType = commandType;

            if (ParameterCollection != null)
                AddParameters(sqlCommand);

            object obj = sqlCommand.ExecuteScalar();

            if (returnValueParameter != -1)
                returnValue = Convert.ToInt32(
                sqlCommand.Parameters[
                returnValueParameter].Value);

            sqlCommand.Dispose();
            return obj;
        }
        #endregion
    }
}