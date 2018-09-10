using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace CSsystem
{
    public class DataBaseUtil
    {
        static SqlCommand dbcmd = new SqlCommand();
        static  SqlConnection dbconn = new SqlConnection();
         public static void connectDB()
         {
            dbconn.Close();
            dbconn.ConnectionString = "Data Source=localhost;Initial Catalog=CSsystem;Integrated Security=True";
            dbconn.Open();
        }
        public static SqlCommand getSqlCommand()
        {
            return dbcmd;
        }
        public static SqlConnection getSqlConnection()
        {
            return dbconn;
        }

        public static void closeDB()
        {
            dbconn.Close();
        }

    }
}