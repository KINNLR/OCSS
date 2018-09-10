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
    public partial class TeacherPass : System.Web.UI.Page
    {
        SqlCommand mycmd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["thnnum"] == null)
            {

                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else
            {
                DataBaseUtil.connectDB();
            }
           
        }

        protected void ChangePassBut_Click(object sender, EventArgs e)
        {
            string tno = Session["thnnum"].ToString();
            string correctPass, mysql, mychangesql;
            mysql = "select tpass from tb_teacher where tno='" + tno + "'";
            mycmd.CommandText = mysql;
            mycmd.Connection = myconn;
            correctPass = mycmd.ExecuteScalar().ToString();
            if (TextBox1.Text == "" || TextBox1.Text != correctPass)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('密码错误，请重新输入');</script>");
                TextBox1.Text = "";
            }
            else if (TextBox1.Text == TextBox2.Text)
            {
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('新密码不能与旧密码重复');</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
            }
            else if (TextBox2.Text != "")
            {
                mychangesql = "update tb_teacher set tpass='" + TextBox2.Text + "'";
                mycmd.CommandText = mychangesql;
                mycmd.Connection = myconn;
                mycmd.ExecuteNonQuery();
                Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('修改成功！');</script>");
                TextBox1.Text = "";
                TextBox2.Text = "";
            }
        }
    }
}