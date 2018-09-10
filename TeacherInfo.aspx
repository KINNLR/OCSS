<%@ Page Title="" Language="C#" MasterPageFile="~/TeacherMainMaster.Master" AutoEventWireup="true" CodeBehind="TeacherInfo.aspx.cs" Inherits="CSsystem.TeacherInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;个人中心
     
                   
                  <br />
     
                  <br />
    </span>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-striped" ForeColor="Black" GridLines="Horizontal" Width="994px" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:BoundField DataField="tno" HeaderText="教师编号" ReadOnly="True" />
            <asp:BoundField DataField="dno" HeaderText="系别编号" ReadOnly="True" />
            <asp:BoundField DataField="tname" HeaderText="教师姓名" />
            <asp:BoundField DataField="tsex" HeaderText="教师性别" ReadOnly="True" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
</asp:GridView>
</asp:Content>

