using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;

namespace CSsystem
{
    public partial class Login : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["stunum"] != null || Session["adminnum"] != null || Session["thnnum"] != null)
            {
                Session.Abandon();
            }
            DataBaseUtil.connectDB();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Textbox1.Text != null || Textbox2.Text != null)
            {
                Textbox1.Text = "";
                Textbox2.Text = "";
                RadioButton1.Checked = false;
                RadioButton2.Checked = false;
                RadioButton3.Checked = false;
            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            string usernumber = Textbox1.Text;
            string userpass = Textbox2.Text;

            if (Textbox1.Text == "" || Textbox2.Text == "")
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('请输入学号或密码');</script>");
            }
            else if (!RadioButton1.Checked && !RadioButton2.Checked && !RadioButton3.Checked)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('请选择您的身份');</script>");
            }
            else if(RadioButton1.Checked)
            {
                //loginsql = 
                //    "select sno,spass,sname,ssex,sbirth,sdept from tb_student where sno='"+usernumber+"' and spass='"+userpass+"'";
                string studentsql = "select sno,spass,sname,ssex,sbirth,dname,mname from tb_student join tb_major on tb_student.mno=tb_major.mno join tb_dept on tb_major.dno=tb_dept.dno where sno='" + usernumber + "'" + " and spass='" + userpass + "'";
                mycomd.CommandText = studentsql;
                mycomd.Connection = myconn;
                SqlDataAdapter myDA= new SqlDataAdapter();
                myDA.SelectCommand=mycomd;
                //将数据保存至数据集
                DataSet myDS= new DataSet();
                int n=myDA.Fill(myDS,"login");
                if(n!=0){
                    string studentname = myDS.Tables["login"].Rows[0]["sname"].ToString();
                    string studentnumber = myDS.Tables["login"].Rows[0]["sno"].ToString();
                    string studentsex = myDS.Tables["login"].Rows[0]["ssex"].ToString();
                    string studentpass = myDS.Tables["login"].Rows[0]["spass"].ToString();
                    string studentbirth = myDS.Tables["login"].Rows[0]["sbirth"].ToString();
                    string deptname = myDS.Tables["login"].Rows[0]["dname"].ToString();
                    string majorname = myDS.Tables["login"].Rows[0]["mname"].ToString();

                    Session["stuname"] = studentname;
                    Session["stunum"] = studentnumber;
                    Session["stusex"] = studentsex;
                    Session["stupass"] = studentpass;
                    Session["stubirth"] = studentbirth;
                    Session["deptn"] = deptname;
                    Session["majorn"] = majorname;
                    Response.Redirect("StudentMainPage.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('编号或密码有误，请重新输入');</script>");
                    Textbox1.Text = "";
                    Textbox2.Text = "";
                }
            }
            else if (RadioButton2.Checked)
            {
                string adminsql = "select ano,aname,apass,asex,aright from tb_admin where ano='" + usernumber + "' and apass='" + userpass + "'";

                SqlDataAdapter sda = new SqlDataAdapter(adminsql, myconn);
                DataSet ds = new DataSet();
                int dsc = sda.Fill(ds, "admin");
                if (dsc != 0)
                {
                    string adminnumber = ds.Tables["admin"].Rows[0]["ano"].ToString();
                    string adminname = ds.Tables["admin"].Rows[0]["aname"].ToString();
                    string adminpass = ds.Tables["admin"].Rows[0]["apass"].ToString();
                    string adminsex = ds.Tables["admin"].Rows[0]["asex"].ToString();
                    string adminright = ds.Tables["admin"].Rows[0]["aright"].ToString();

                    Session["adminnum"] = adminnumber;
                    Session["adminpass"] = adminpass;
                    Session["adminsex"] = adminsex;
                    Session["adminname"] = adminname;
                    Session["adminright"] = adminright;

                    Response.Redirect("AdminMainPage.aspx");

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('编号或密码有误，请重新输入');</script>");
                    Textbox1.Text = "";
                    Textbox2.Text = "";
                }
            }
            else if (RadioButton3.Checked)
            {
                string teachersql = "select tno,dno,tname,tsex,tpass from tb_teacher where tno='" + usernumber + "' and tpass='" + userpass + "'";

                SqlDataAdapter sda = new SqlDataAdapter(teachersql, myconn);
                DataSet ds = new DataSet();
                int dsc = sda.Fill(ds, "teacher");
               
                if (dsc != 0)
                {
                    string teachernumber = ds.Tables["teacher"].Rows[0]["tno"].ToString();
                    string deptnumber = ds.Tables["teacher"].Rows[0]["dno"].ToString();
                    string teachername = ds.Tables["teacher"].Rows[0]["tname"].ToString();
                    string teacherpass = ds.Tables["teacher"].Rows[0]["tpass"].ToString();
                    string teachersex = ds.Tables["teacher"].Rows[0]["tsex"].ToString();


                    Session["thnnum"] = teachernumber;
                    Session["deptnum"] = deptnumber;
                    Session["thname"] = teachername;
                    Session["thpass"] = teacherpass;
                    Session["thsex"] = teachersex;

                    Response.Redirect("TeacherMainPage.aspx");

                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('编号或密码有误，请重新输入');</script>");
                    Textbox1.Text = "";
                    Textbox2.Text = "";
                }

            }
            DataBaseUtil.closeDB();
            //Server.Transfer("TestingRedirect.aspx");

        }

    
       
    }
}