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
    public partial class TeacherCourse : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }
        protected void bind()
        {
            if (Session["thnnum"] == null)
            {
                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else
            {
                string tnum = Session["thnnum"].ToString();
                DataBaseUtil.connectDB();
                string showSql = " select cno as '课程号',cname as '课程名',ccredit as '学分',tno as '本人教师编号' from tb_course where tno='" + tnum + "'";
                DataSet ds = new DataSet();
                SqlDataAdapter myDA = new SqlDataAdapter(showSql, myconn);

                myDA.Fill(ds, "TEST");


                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

        }
      
           
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView gvw = (GridView)sender;

            if (e.NewPageIndex < 0)
            {
                TextBox PageNum = (TextBox)GridView1.BottomPagerRow.FindControl("txtNewPageIndex");

                int Pa = int.Parse(PageNum.Text);

                if (Pa <= 0)//如果前往分页的index小于或等于0则转向0
                {
                    gvw.PageIndex = 0;
                }
                else
                {
                    gvw.PageIndex = Pa - 1;
                }
            }
            else
            {
                gvw.PageIndex = e.NewPageIndex;
            }

            bind();//自定义的GridView控件绑定数据函数
        }
    }
}