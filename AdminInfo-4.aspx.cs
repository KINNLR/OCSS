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
    public partial class AdminInfo_4 : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
            {

                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else
            {
                DataBaseUtil.connectDB();
                string ssql = "select mno as '专业编号',mname as '专业名称',tb_major.dno as '系别编号',dname as '系别',dtel as '联系方式' from tb_major join tb_dept on tb_major.dno=tb_dept.dno";
               
                SqlDataAdapter sda = new SqlDataAdapter(ssql, myconn);
                DataSet ds = new DataSet();
                sda.Fill(ds, "mdInfo");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }
    }
}