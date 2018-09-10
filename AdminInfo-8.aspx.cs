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
    public partial class AdminInfo_7 : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
            {
                
               Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else if(Session["adminright"].ToString() == "10" || Session["adminright"].ToString() == null)
            {
               Response.Write("<script>alert('您没有权限使用此功能');window.location.href='AdminInfo.aspx'</script>");
            }else
            {
                DataBaseUtil.connectDB();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ano = TextBox1.Text;
            string aname = TextBox2.Text;
            string asex = TextBox3.Text;
            string apass = TextBox4.Text;

            Regex regAno = new Regex(@"^\d{2}$");
            Regex regName = new Regex("[\u4e00-\u9fa5]");
            Regex regPass = new Regex("^[A-Za-z0-9]+$");
            Regex regSex = new Regex("([男]|[女])+$");

            if (ano == null || aname == null || asex == null || apass == null || !regAno.IsMatch(ano) || !regName.IsMatch(aname) || !regSex.IsMatch(asex) || !regPass.IsMatch(apass))
            {
                Response.Write("<script>alert('请确认信息无误再提交！')</script>");

            }
            else
            {
                string searchSql = "select * from tb_admin where ano='" + ano + "'";
                SqlDataAdapter sda = new SqlDataAdapter(searchSql, myconn);
                DataSet ds = new DataSet();
            
                int dsc = sda.Fill(ds, "courseInfo");
                if (dsc != 0)
                {
                    Response.Write("<script>alert('管理员已存在，请重新输入！')</script>");
                }
                else
                {
                    string insertSql = "insert into tb_admin(ano,aname,apass,asex) values('" + ano + "','" + aname + "','" + apass + "','" + asex + "')";

                    mycomd.CommandText = insertSql;
                    mycomd.Connection = myconn;
                    mycomd.ExecuteNonQuery();


                    Response.Write("  <script language=javascript>alert('录入成功！'); </script>");
                    Thread.Sleep(1000);
                    Response.Write("  <script language=javascript>window.location.href=document.URL; </script>");
                }
            }
        }

     
    }
}