using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;
using System.Threading;

namespace CSsystem
{
    public partial class AdminInfo_6 : System.Web.UI.Page
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
            string cno=TextBox1.Text;
            string cname=TextBox2.Text;
            string ccredit=TextBox3.Text;
            string tno=TextBox4.Text;

            Regex regCno=new Regex(@"^[a-z]\d{3}$");
            Regex regCname = new Regex("[\u4e00-\u9fa5]");
            Regex regCre = new Regex(@"^[1-5]$");

            if (cno == null || cname == null || ccredit == null || tno == null || !regCno.IsMatch(cno) || !regCre.IsMatch(ccredit) || !regCname.IsMatch(cname))
            {
                Response.Write("<script>alert('请确认课程信息无误再提交！')</script>");
            }
            else
            {
                string searchSql = "select * from tb_course where cno='" + cno + "'";
                string serrchTSql = "select * from tb_teacher where tno='" + tno + "'";

                int i = 0;

                mycomd.CommandText = serrchTSql;
                mycomd.Connection = myconn;
                SqlDataReader sdr = mycomd.ExecuteReader();
                while (sdr.Read())
                {
                    i++;
                }
               
                SqlDataAdapter sda = new SqlDataAdapter(searchSql, myconn);
                DataSet ds = new DataSet();
                sdr.Close();
                int dsc = sda.Fill(ds, "courseInfo");
                if (dsc != 0)
                {
                    Response.Write("<script>alert('课程已存在，请重新输入！')</script>");
                }
                else  if (i <= 0)
                {
                    Response.Write("<script>alert('教师不存在，请重新输入！')</script>");
                }else
                {
                    string insertSql = "insert into tb_course(cno,cname,ccredit,tno) values('" + cno + "','" + cname + "','" + ccredit + "','" + tno + "')";

                    mycomd.CommandText = insertSql;
                    mycomd.Connection = myconn;
                    mycomd.ExecuteNonQuery();


                    Response.Write("  <script language=javascript>alert('录入成功！'); </script>");
                    Thread.Sleep(1000);
                    Response.Write("  <script language=javascript>window.location.href=document.URL; </script>");
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("CoursesManage.aspx");
        }
    }
}