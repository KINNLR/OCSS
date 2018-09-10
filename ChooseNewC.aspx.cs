using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
namespace CSsystem
{
    public partial class ChooseNewC : System.Web.UI.Page
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
                DataBaseUtil.connectDB();
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
           
            string stunum=Session["stunum"].ToString();
            string cnum=GridView1.Rows[GridView1.SelectedIndex].Cells[1].Text;
            string tnum=GridView1.Rows[GridView1.SelectedIndex].Cells[4].Text;
            string searchSql="select * from tb_sc where cno='"+cnum+"' and sno='"+stunum+"'";
            string insertSql = "insert into tb_sc (sno,cno,tno) values('" + stunum + "','" + cnum + "','" + tnum + "')";
            
            mycomd.CommandText=searchSql;
            mycomd.Connection=myconn;
            SqlDataReader dr=mycomd.ExecuteReader();
            if(dr.Read()){
                Thread.Sleep(1000);
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('您已选了此课程，请重新选择');</script>");
            }else{
                mycomd.CommandText = insertSql;
                dr.Close();
                mycomd.ExecuteNonQuery();
                Thread.Sleep(1000);
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('选课成功');</script>");
            }
        }
    }
}