<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainMaster.Master" AutoEventWireup="true" CodeBehind="AdminInfo-3.aspx.cs" Inherits="CSsystem.AdminInfo_3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;信息查询-&gt;教师信息
     
                  <br />
    </span>
    <div class="gridviewLayout" style="margin-top:50px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-striped" DataKeyNames="tno" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" Width="1000px" AllowPaging="True" PageSize="5">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="tno" HeaderText="教师编号" ReadOnly="True" SortExpression="tno" />
            <asp:BoundField DataField="dno" HeaderText="系别编号" SortExpression="dno" />
            <asp:BoundField DataField="tname" HeaderText="教师姓名" SortExpression="tname" />
            <asp:BoundField DataField="tsex" HeaderText="教师性别" SortExpression="tsex" />
            <asp:BoundField DataField="tpass" HeaderText="登录密码" SortExpression="tpass" />
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
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSsystemConnectionString %>" SelectCommand="SELECT * FROM [tb_teacher]" DeleteCommand="DELETE FROM [tb_teacher] WHERE [tno] = @tno" InsertCommand="INSERT INTO [tb_teacher] ([tno], [dno], [tname], [tsex], [tpass]) VALUES (@tno, @dno, @tname, @tsex, @tpass)" UpdateCommand="UPDATE [tb_teacher] SET [dno] = @dno, [tname] = @tname, [tsex] = @tsex, [tpass] = @tpass WHERE [tno] = @tno">
        <DeleteParameters>
            <asp:Parameter Name="tno" Type="String" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="tno" Type="String" />
            <asp:Parameter Name="dno" Type="String" />
            <asp:Parameter Name="tname" Type="String" />
            <asp:Parameter Name="tsex" Type="String" />
            <asp:Parameter Name="tpass" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="dno" Type="String" />
            <asp:Parameter Name="tname" Type="String" />
            <asp:Parameter Name="tsex" Type="String" />
            <asp:Parameter Name="tpass" Type="String" />
            <asp:Parameter Name="tno" Type="String" />
        </UpdateParameters>
        </asp:SqlDataSource>

    </div>
    
</asp:Content>
