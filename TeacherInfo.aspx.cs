using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace CSsystem
{
    public partial class TeacherInfo : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["thnnum"] == null)
            {
                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else
            {
                if (!IsPostBack) 
                {
                    dBind();
                }

            }

        }
        public void dBind()
        {
            DataBaseUtil.connectDB();
            string tnum = Session["thnnum"].ToString();
            string showSql = "select tno ,dno ,tname, tsex from tb_teacher where tno='" + tnum + "'";

            SqlDataAdapter sda = new SqlDataAdapter(showSql, myconn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "thtab");

            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
          

            this.GridView1.EditIndex = e.NewEditIndex;

            dBind();


        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            dBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            string tname = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();
           
            string tnum = Session["thnnum"].ToString();
            string upstr = "update tb_teacher set tname='" + tname + "'";


            mycomd.CommandText = upstr;
            mycomd.Connection = myconn;
            mycomd.ExecuteNonQuery();

            GridView1.EditIndex = -1;

            dBind();
        }

    }
}