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
    public partial class StudentInfo : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["stunum"] == null)
            {
                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else
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
            string snum = Session["stunum"].ToString();
            string showSql = "select sno ,sname ,ssex, sbirth, mname from tb_student join tb_major on tb_student.mno=tb_major.mno and sno='" + snum + "'";

            SqlDataAdapter sda = new SqlDataAdapter(showSql, myconn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "stutab");

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
          
            string sname = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[2].Controls[0])).Text.ToString().Trim();
            string sbirth = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[4].Controls[0])).Text.ToString().Trim();
        

            string snum = Session["stunum"].ToString();
            string upstr = "update tb_student set sname='" + sname + "',sbirth='"+sbirth+"'"+" where sno='" + snum + "'";


            mycomd.CommandText = upstr;
            mycomd.Connection = myconn;
            mycomd.ExecuteNonQuery();

            GridView1.EditIndex = -1;

            dBind();
        }

      

    }
}