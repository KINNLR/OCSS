using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CSsystem
{
    public partial class AdminInfo_3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminname"] == null)
            {

               Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
        }
    }
}