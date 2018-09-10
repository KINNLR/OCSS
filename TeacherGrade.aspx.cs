using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

namespace CSsystem
{
    public partial class TeacherGrade : System.Web.UI.Page
    {
            SqlCommand mycomd = DataBaseUtil.getSqlCommand();
            SqlConnection myconn = DataBaseUtil.getSqlConnection();

            protected void Page_Load(object sender, EventArgs e)
            {
                if (Session["thnnum"] == null)
                {
                    Response.Write("<script>alert('请先登录！');window.location.href='Login.aspx'</script>");
                }
                else
                {
                    if (!IsPostBack) //判断第一次加载页面
                    {
                        bind();
                    }

                }
            }
            protected void bind()
            {
                    string tnum = Session["thnnum"].ToString();
                    DataBaseUtil.connectDB();
                    string showSql = " select tb_student.sno,sname,tb_course.cno,cname,grade from tb_course,tb_sc,tb_teacher,tb_student where tb_course.cno=tb_sc.cno and tb_sc.tno=tb_teacher.tno and tb_sc.sno=tb_student.sno and  tb_sc.tno='" + tnum + "'";
                    DataSet ds = new DataSet();
                    SqlDataAdapter myDA = new SqlDataAdapter(showSql, myconn);

                    myDA.Fill(ds, "TEST");
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
            }
            protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
            {
               
                this.GridView1.EditIndex = e.NewEditIndex;

                bind();


            }

            protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
            {
                GridView1.EditIndex = -1;
                bind();
            }

            protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
            {

                string sgrade = ((TextBox)(GridView1.Rows[e.RowIndex].Cells[5].Controls[0])).Text.ToString().Trim();
                string snum = GridView1.Rows[e.RowIndex].Cells[1].Text;
                string cnum = GridView1.Rows[e.RowIndex].Cells[3].Text;

                Regex regGrade = new Regex(@"^100$|^(\d|[1-9]\d)(\.\d+)*$");
                if(sgrade==null || ! regGrade.IsMatch(sgrade)){
                    Response.Write("<script>alert('成绩输入有误！');window.location.href='TeacherGrade.aspx'</script>");
                }else{
                    string upstr = " update tb_sc set grade='" + sgrade + "' where sno='" + snum + "' and cno='" + cnum + "'";


                    mycomd.CommandText = upstr;
                    mycomd.Connection = myconn;
                    mycomd.ExecuteNonQuery();

                    GridView1.EditIndex = -1;

                    bind();
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

