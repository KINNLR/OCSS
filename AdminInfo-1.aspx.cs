using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSsystem
{
    public partial class AdminInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["adminname"]==null){
               
                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else
            {
                Label1.Text = Session["adminnum"].ToString();
                Label2.Text = Session["adminname"].ToString();
                Label3.Text = Session["adminsex"].ToString();
                Label4.Text = Session["adminpass"].ToString();
                if (Session["adminright"].ToString() == "20")
                {
                    Label5.Text = "高级管理员";
                }
                else
                {
                    Label5.Text = "普通管理员";
                }
            }
        }
    }
}