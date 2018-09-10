<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMainMaster.Master" AutoEventWireup="true" CodeBehind="ChooseNewC.aspx.cs" Inherits="CSsystem.ChooseNewC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;选课
    </span>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="cno" DataSourceID="SqlDataSource1" Height="59px"  OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="5" Width="1000px" CssClass="table table-striped" Font-Bold="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowSelectButton="True"  />
            <asp:BoundField DataField="cno" HeaderText="课程代码" ReadOnly="True" SortExpression="cno" />
            <asp:BoundField DataField="cname" HeaderText="课程名称" SortExpression="cname" />
            <asp:BoundField DataField="ccredit" HeaderText="课程学分" SortExpression="ccredit" />
            <asp:BoundField DataField="tno" HeaderText="教师编号" SortExpression="tno" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerSettings FirstPageText="首页" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <PagerTemplate>
            <table width="100%">
                <tr>
                    <td style="text-align: center">
                        <asp:LinkButton ID="btnFirst" runat="server" CausesValidation="False" CommandArgument="First" CommandName="Page" Text="首页" ForeColor="#3D8031"></asp:LinkButton>
                        <asp:LinkButton ID="btnPrev" runat="server" CausesValidation="False" CommandArgument="Prev" CommandName="Page" Text="上一页" ForeColor="#3D8031"></asp:LinkButton>
                        <asp:LinkButton ID="btnNext" runat="server" CausesValidation="False" CommandArgument="Next" CommandName="Page" Text="下一页" ForeColor="#3D8031"></asp:LinkButton>
                        <asp:LinkButton ID="btnLast" runat="server" CausesValidation="False" CommandArgument="Last" CommandName="Page" Text="尾页" ForeColor="#3D8031"></asp:LinkButton>
                        <asp:TextBox ID="txtNewPageIndex" runat="server" Text="<%# ((GridView)Container.Parent.Parent).PageIndex + 1%>" Width="20px"></asp:TextBox>
                        <asp:LinkButton ID="btnGo" runat="server" CausesValidation="False" CommandArgument="-1" CommandName="Page" Text="GO" ForeColor="#3D8031"></asp:LinkButton>
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSsystemConnectionString %>" SelectCommand="SELECT * FROM [tb_course]"></asp:SqlDataSource>
    <br />
</asp:Content>
