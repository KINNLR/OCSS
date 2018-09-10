using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CSsystem
{
    public partial class PassManage : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminnum"] == null)
            {
                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else
            {
                if (Session["adminright"].ToString() == "10")
                {
                    Response.Redirect("CommonPass.aspx");
                }
            
            }
             
        }

        protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            //GridViewRow row = GridView1.Rows[e.NewSelectedIndex];
            //string stunum = row.Cells[1].Text;
            //string showSql = " select sno as '学号',sname as '学生名',spass as '密码' from tb_student where sno='" + stunum + "'";
            // DataSet ds = new DataSet();
            //SqlDataAdapter myDA = new SqlDataAdapter(showSql, myconn);
            //myDA.Fill(ds, "StuManage");
            //DetailsView1.DataSource = ds.Tables[0];
            //DetailsView1.DataBind();
            //DetailsView1.ChangeMode(DetailsViewMode.Edit);
            

        }

       

       


   
       
      
    }
}