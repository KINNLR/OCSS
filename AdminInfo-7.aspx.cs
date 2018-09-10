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
    public partial class AdminInfo_71 : System.Web.UI.Page
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
            string tno = TextBox1.Text;
            string dno = TextBox2.Text;
            string tname = TextBox3.Text;
            string tsex = TextBox4.Text;

            Regex regTno  = new Regex(@"^\d{3}$");
            Regex regDno = new Regex(@"^\d{3}$");
            Regex regTname = new Regex("[\u4e00-\u9fa5]");
            Regex regTsex = new Regex("([男]|[女])+$");
            if (tno == null || dno == null || tname == null || tsex == null || !regTno.IsMatch(tno) || !regDno.IsMatch(dno) || !regTsex.IsMatch(tsex) || !regTname.IsMatch(tname))
            {
                Response.Write("<script>alert('请确认教师信息无误再提交！')</script>");
            }
            else
            {
                string searcTSql = "select * from tb_teacher where tno='" + tno + "'";

                string serrcDSql = "select * from tb_dept where dno='"+dno+"'";
               
                int i = 0;

                mycomd.CommandText = serrcDSql;
                mycomd.Connection = myconn;
                SqlDataReader sdr = mycomd.ExecuteReader();
                while (sdr.Read())
                {
                    i++;
                }


                sdr.Close();
                SqlDataAdapter sda = new SqlDataAdapter(searcTSql, myconn);
                DataSet ds = new DataSet();
                
                int dsc = sda.Fill(ds, "teacherInfo");
             
                if (dsc != 0)
                {
                    Response.Write("<script>alert('教师已存在，请重新输入！')</script>");
                }
                else if (i<=0)
                {
                    Response.Write("<script>alert('系别不存在，请重新输入！')</script>");
                }
                else
                {
                    string insertSql = "insert into tb_teacher(tno,dno,tname,tsex) values('" + tno + "','" + dno + "','" + tname + "','" + tsex + "')";

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
            Response.Redirect("AdminInfo-3.aspx");
        }

    }
}