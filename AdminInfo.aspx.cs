using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSsystem
{
    public partial class AdminInfo1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
            {
                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminInfo-1.aspx");
           
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminInfo-2.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminInfo-3.aspx");
         
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminInfo-4.aspx");
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminInfo-5.aspx");
        }

        protected void LinkButton6_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminInfo-6.aspx");
        }

        protected void LinkButton7_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminInfo-7.aspx");
        }

        protected void LinkButton8_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdminInfo-8.aspx");
        }

    }
}