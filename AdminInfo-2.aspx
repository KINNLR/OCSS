<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainMaster.Master" AutoEventWireup="true" CodeBehind="AdminInfo-2.aspx.cs" Inherits="CSsystem.AdminInfo_2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;信息查询-&gt;学生选课查询
     
                  <br />
    </span>
    <div style="margin-top:30px">
        <span style="margin-left:50px;color:#3D8031"> 请输入学生学号： </span><asp:TextBox ID="TextBox1" CssClass="form-control" style="display:inline;margin-right:50px" runat="server" Width="209px"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="查询" CssClass="btn"  OnClick="Button1_Click" />
        <br />
        <div class="insiedG" style="margin-top:30px;">

        </div>
        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-striped" ForeColor="Black" GridLines="Horizontal" Width="1000px">
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    </div>
</asp:Content>
