<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainMaster.Master" AutoEventWireup="true" CodeBehind="AdminInfo-4.aspx.cs" Inherits="CSsystem.AdminInfo_4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;信息查询-&gt;专业信息查询
     
                   
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" Width="1000px" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-striped" ForeColor="Black" GridLines="Horizontal" AllowPaging="True" PageSize="5">
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
     
                  <br />
    </span>
</asp:Content>
