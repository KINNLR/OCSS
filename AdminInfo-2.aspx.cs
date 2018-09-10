using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;
using System.Data;
using System.Data.SqlClient;
namespace CSsystem
{
    public partial class AdminInfo_2 : System.Web.UI.Page
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
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string stunum = TextBox1.Text;
            Regex reg=new Regex(@"^\d{4}$");
            if (!reg.IsMatch(stunum))
            {
                Response.Write("<script>alert('请输入正确的学号')</script>");
                TextBox1.Text="";
            }
            else
            {
                string ssql = " select sno as '学生学号',tb_course.cno as '课程编号',cname as '课程名称' from tb_course join tb_sc on tb_sc.cno=tb_course.cno where sno='" + stunum + "'";
                SqlDataAdapter sda = new SqlDataAdapter(ssql, myconn);
                DataSet ds = new DataSet();
                int dsc = sda.Fill(ds, "stuinfo");
                if (dsc != 0)
                {
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                
                }
                else
                {
                    Response.Write("<script>alert('学号有误，请重新输入')</script>");
                    TextBox1.Text = "";
                }

            }
        }
    }
}