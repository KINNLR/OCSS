using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading;
namespace CSsystem
{
    public partial class ChosedCourse : System.Web.UI.Page
    {
        SqlCommand mycomd = DataBaseUtil.getSqlCommand();
        SqlConnection myconn = DataBaseUtil.getSqlConnection();

        protected void Page_Load(object sender, EventArgs e)
        {
            bind();
        }
        protected void bind()
        {
            if (Session["stunum"] == null)
            {
                Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
            }
            else
            {
                string studentNum = Session["stunum"].ToString();
                DataBaseUtil.connectDB();
                string showSql = " select tb_course.cno as '课程号',cname as '课程名',ccredit as '学分',tname as '教师名',dname as '系别',dtel as '联系方式' from tb_course,tb_sc,tb_teacher,tb_dept where tb_course.cno=tb_sc.cno and tb_sc.tno=tb_teacher.tno and tb_teacher.dno=tb_dept.dno and tb_sc.sno='" + studentNum + "'";
                DataSet ds = new DataSet();
                SqlDataAdapter myDA = new SqlDataAdapter(showSql, myconn);

                myDA.Fill(ds, "TEST");


                GridView1.DataSource = ds;
                GridView1.DataBind();
            }

        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            string snum=Session["stunum"].ToString();
            string cnum = GridView1.Rows[e.RowIndex].Cells[1].Text;
            string deleteSql = "delete from tb_sc where sno='" + snum + "' and cno='" + cnum + "'";

            mycomd.CommandText = deleteSql;
            mycomd.Connection = myconn;
            mycomd.ExecuteNonQuery();

           // Page.ClientScript.RegisterClientScriptBlock(GetType(), "Attention", "<script>alert('退选成功');</script>");
            Response.Write("  <script language=javascript>alert('退选成功'); </script>"); 
            Thread.Sleep(1000);
            Response.Write( "  <script language=javascript>window.location.href=document.URL; </script>" ); 
           // Response.Redirect(Request.Url.ToString()); 

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridViewRow row = (GridViewRow)e.Row;
            TableCell selectCell = row.Cells[0]; 
            if (selectCell.Controls.Count > 0)
            {
                LinkButton selectControl = selectCell.Controls[0] as LinkButton;

                if (selectControl != null)
                {
                    selectControl.Text = "退选";
                    
                }

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