<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainMaster.Master" AutoEventWireup="true" CodeBehind="CoursesManage.aspx.cs" Inherits="CSsystem.CourseManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;课程信息
     
<br />
<br />
<br />
    </span>
    <asp:GridView ID="GridView1" runat="server" Width="1000px" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-striped" DataKeyNames="cno" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" PageSize="4">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="cno" HeaderText="课程号" ReadOnly="True" SortExpression="cno" />
            <asp:BoundField DataField="cname" HeaderText="课程名称" SortExpression="cname" />
            <asp:BoundField DataField="ccredit" HeaderText="课程学分" SortExpression="ccredit" />
            <asp:BoundField DataField="tno" HeaderText="教师编号" SortExpression="tno" />
        </Columns>
        <EditRowStyle BackColor="#3D8031" ForeColor="Black" />
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
        <SelectedRowStyle BackColor="#3D8031" Font-Bold="True" ForeColor="Black" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" /> 
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
      </asp:GridView>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSsystemConnectionString %>" DeleteCommand="DELETE FROM [tb_course] WHERE [cno] = @cno" InsertCommand="INSERT INTO [tb_course] ([cno], [cname], [ccredit], [tno]) VALUES (@cno, @cname, @ccredit, @tno)" SelectCommand="SELECT * FROM [tb_course]" UpdateCommand="UPDATE [tb_course] SET [cname] = @cname, [ccredit] = @ccredit, [tno] = @tno WHERE [cno] = @cno">
          <DeleteParameters>
              <asp:Parameter Name="cno" Type="String" />
          </DeleteParameters>
          <InsertParameters>
              <asp:Parameter Name="cno" Type="String" />
              <asp:Parameter Name="cname" Type="String" />
              <asp:Parameter Name="ccredit" Type="Double" />
              <asp:Parameter Name="tno" Type="String" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="cname" Type="String" />
              <asp:Parameter Name="ccredit" Type="Double" />
              <asp:Parameter Name="tno" Type="String" />
              <asp:Parameter Name="cno" Type="String" />
          </UpdateParameters>
      </asp:SqlDataSource>
      <br />
</asp:Content>
