using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CSsystem
{
    public partial class CommanPass : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminnum"] == null)
            {
                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }else
            {
                if (!IsPostBack) //判断第一次加载页面
                {
                    dBind();
                }
               
            }
       

        }
        public void dBind()
        {
            DataBaseUtil.connectDB();
            string anum = Session["adminnum"].ToString();
            string showSql = "select ano ,aname ,apass from tb_admin where ano='" + anum + "'";

            SqlDataAdapter sda = new SqlDataAdapter(showSql, myconn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "admintab");

            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
      
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            //((GridView1.Rows[e.NewEditIndex].Cells[1].Controls[1]) as TextBox).ReadOnly = true;

            this.GridView1.EditIndex = e.NewEditIndex;

           
            //(GridView1.Rows[e.NewEditIndex].Cells[2].Controls[0] as TextBox).ReadOnly = true;

            dBind();

           
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            dBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           // ((TextBox)(GridView1.Rows[e.RowIndex].Cells[1].Controls[0])).ReadOnly = true;
            string apassc = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[3].Controls[0])).Text.ToString().Trim();

            string anum = Session["adminnum"].ToString();
            string upstr = "update tb_admin set apass='" + apassc + "' where ano='" +anum+ "'";

            
            mycomd.CommandText = upstr;
            mycomd.Connection = myconn;
            mycomd.ExecuteNonQuery();

            GridView1.EditIndex = -1;

            dBind();
        }

    }
}