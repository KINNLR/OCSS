<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentInfoM.aspx.cs" Inherits="CSsystem.StudentInfoM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta charset="UTF-8">
		<title>选课中心</title>
		<link rel="stylesheet" href="css/studentmain.css" />
         
		<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
   
</head>
<body>
      <form id="form1" runat="server">
    <div class="header">
			<div class="header logo">
				<a id="headera">
					<img src="img/logo.png" />
				
				<span id="logopara" > 学生选课系统</span>
</a>
			</div>

		</div>
    <div class="navitems">
			<ul >
               <li>
					<a href="AdminMainPage.aspx" >主页</a>
				</li>
				<li>
					<a href="AdminInfo.aspx" >信息查询与录入</a>
				</li>
				<li>
					<a href="StudentInfoM.aspx">学生信息管理</a>
				</li>
				<li>
					<a href="CoursesManage.aspx">课程信息管理</a>
				</li>
				<li>
					<a href="PassManage.aspx">登录密码管理</a>
				</li>
				<li>
                   
        
        
         <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">退出</asp:LinkButton>
   
   
                   
					<%-- <a href="Login.aspx" >退出</a>--%>
				</li>
			</ul>
		</div>
    <div class="maincontent" style="margin:20px auto;width:1000px;height:600px">
        <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;学生信息管理
     
                  <br />
        <br />
    </span>
     
      <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sno" DataSourceID="SqlDataSource1" Width="1000px" CssClass="table table-striped" AllowPaging="True" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" PageSize="4">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="sno" HeaderText="学号" ReadOnly="True" SortExpression="sno" />
            <asp:BoundField DataField="sname" HeaderText="学生姓名" SortExpression="sname" />
            <asp:BoundField DataField="ssex" HeaderText="学生性别" SortExpression="ssex" />
        </Columns>
          <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
          <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
          <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
          <PagerTemplate>
              <table width="100%">
                  <tr>
                      <td style="text-align: center">
                          <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First" CommandName="Page" ForeColor="#3D8031" Text="首页"></asp:LinkButton>
                          <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev" CommandName="Page" ForeColor="#3D8031" Text="上一页"></asp:LinkButton>
                          <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next" CommandName="Page" ForeColor="#3D8031" Text="下一页"></asp:LinkButton>
                          <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last" CommandName="Page" ForeColor="#3D8031" Text="尾页"></asp:LinkButton>
                          <asp:TextBox ID="txtNewPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1%>" Width="20px"></asp:TextBox>
                          <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-1" CommandName="Page" ForeColor="#3D8031" Text="GO"></asp:LinkButton>
                      </td>
                  </tr>
              </table>
          </PagerTemplate>
          <SelectedRowStyle BackColor="#3D8031" Font-Bold="True" ForeColor="White" />
          <SortedAscendingCellStyle BackColor="#F7F7F7" />
          <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
          <SortedDescendingCellStyle BackColor="#E5E5E5" />
          <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSsystemConnectionString %>" SelectCommand="SELECT [sno], [sname], [ssex] FROM [tb_student]" DeleteCommand="DELETE FROM [tb_student] WHERE [sno] = @sno" InsertCommand="INSERT INTO [tb_student] ([sno], [sname], [ssex]) VALUES (@sno, @sname, @ssex)" UpdateCommand="UPDATE [tb_student] SET [sname] = @sname, [ssex] = @ssex WHERE [sno] = @sno">
        <DeleteParameters>
            <asp:Parameter Name="sno" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="sno" Type="String" />
            <asp:Parameter Name="sname" Type="String" />
            <asp:Parameter Name="ssex" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="sname" Type="String" />
            <asp:Parameter Name="ssex" Type="String" />
            <asp:Parameter Name="sno" Type="String" />
        </UpdateParameters>
</asp:SqlDataSource>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="46px" Width="940px" AutoGenerateRows="False" DataKeyNames="sno" DataSourceID="SqlDataSource2" AutoGenerateEditButton="True" CssClass="table table-striped" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
        <EditRowStyle BackColor="#3D8031" BorderColor="#3D8031" Font-Bold="True" ForeColor="Black" />
        <Fields>
            <asp:BoundField DataField="sbirth" HeaderText="生日" SortExpression="sbirth" />
            <asp:BoundField DataField="mno" HeaderText="专业编号" SortExpression="mno" />
            <asp:BoundField DataField="sname" HeaderText="学生姓名" SortExpression="sname" />
            <asp:BoundField DataField="sdept" HeaderText="学生系别" SortExpression="sdept" />
            <asp:BoundField DataField="sno" HeaderText="学号" ReadOnly="True" SortExpression="sno" />
            <asp:BoundField DataField="ssex" HeaderText="性别" SortExpression="ssex" />
            <asp:BoundField DataField="spass" HeaderText="登录密码" SortExpression="spass" />
        </Fields>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
    </asp:DetailsView>
    <br />
    
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CSsystemConnectionString %>"  SelectCommand="SELECT [sbirth], [mno], [sname], [sdept], [sno], [ssex], [spass] FROM [tb_student] WHERE [sno] = @sno " UpdateCommand="UPDATE [tb_student] SET [sbirth] = @sbirth, [mno] = @mno, [sname] = @sname, [sdept] = @sdept, [ssex] = @ssex,[spass] = @spass WHERE [sno] = @sno">
                                                                                                                                                                                                                                                                                                                                                                                                        
        <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="sno" PropertyName="SelectedValue"  Type="String" />
             </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="sbirth" Type="DateTime" />
            <asp:Parameter Name="mno" Type="String" />
            <asp:Parameter Name="sname" Type="String" />
            <asp:Parameter Name="sdept" Type="String" />
            <asp:Parameter Name="ssex" Type="String" />
            <asp:Parameter Name="spass" />
            <asp:Parameter Name="sno" Type="String" />
        </UpdateParameters>

    </asp:SqlDataSource>
     
    </form>
    </div>

        <div class="bottom" >
			<p id="bottomp"> ©2018-2019 KINN. All rights reserved</p>
		</div>
</body>
</html>
