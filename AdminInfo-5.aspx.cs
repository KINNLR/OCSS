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
    public partial class AdminInfo_5 : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
           if(Session["adminname"]==null){
               
            Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
             else
             {
                 DataBaseUtil.connectDB();

             }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sno = TextBox1.Text;
            string sname = TextBox2.Text;
            string ssex = TextBox3.Text;
            string spass = TextBox4.Text;
            string mno = TextBox5.Text;
            string sdept = TextBox6.Text;
            string sbirth = TextBox7.Text;

            Regex regSMno = new Regex(@"^\d{4}$");
            Regex regSdept = new Regex(@"^\d{3}$");
            Regex regSex = new Regex("([男]|[女])+$");
            Regex regSname = new Regex("[\u4e00-\u9fa5]");

            if (sno==null||sname==null||ssex==null||spass==null||mno==null||!regSMno.IsMatch(sno)||!regSMno.IsMatch(mno)||!regSdept.IsMatch(sdept)||!regSex.IsMatch(ssex)||!regSname.IsMatch(sname))
            {
                Response.Write("<script>alert('请确认学生信息无误再提交！')</script>");

            }
            else
            {
                string searchSql = "select * from tb_student where sno='" + sno + "'";
                string searchMDSql = "select * from tb_major,tb_dept where tb_major.dno=tb_dept.dno and mno='"+mno+"' and tb_major.dno= '"+sdept+"'";

                SqlDataAdapter sda = new SqlDataAdapter(searchSql, myconn);
                SqlDataAdapter sda2 = new SqlDataAdapter(searchMDSql, myconn);

                DataSet ds = new DataSet();
                DataSet ds2 = new DataSet();
                int dsc = sda.Fill(ds, "studentInfo");
                int dsc2 = sda2.Fill(ds2, "MajorDInfo");
                if (dsc != 0)
                {
                    Response.Write("<script>alert('学生已存在，请重新输入！')</script>");
                }
                else if(dsc2==0){
                    Response.Write("<script>alert('请检查专业相关信息是否正确！')</script>");
                }else
                {
                    string insertSql = "insert into tb_student(sno,sname,ssex,spass,mno,sdept,sbirth) values('" + sno + "','" + sname + "','" + ssex + "','" + spass + "','" + mno + "','"+sdept+"','" + sbirth + "')";
                
                    mycomd.CommandText=insertSql;
                    mycomd.Connection=myconn;
                    mycomd.ExecuteNonQuery();


                    Response.Write("  <script language=javascript>alert('录入成功！'); </script>");
                    Thread.Sleep(1000);
                    Response.Write("  <script language=javascript>window.location.href=document.URL; </script>"); 
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentInfoM.aspx");
        }
    }
}