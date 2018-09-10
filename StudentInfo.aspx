<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMainMaster.Master" AutoEventWireup="true" CodeBehind="StudentInfo.aspx.cs" Inherits="CSsystem.StudentInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                  <%--<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Test" />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
    <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;个人中心
     
                   
                  <br />
     
                  <br />
    </span>
    <br />
    <div style="margin-left:10px">
        <asp:GridView ID="GridView1" runat="server" Width="1000px" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table table-striped" ForeColor="Black" GridLines="Horizontal" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:BoundField DataField="sno" HeaderText="学号" ReadOnly="True" />
                <asp:BoundField DataField="sname" HeaderText="姓名" />
                <asp:BoundField DataField="ssex" HeaderText="性别" ReadOnly="True" />
                <asp:BoundField DataField="sbirth" HeaderText="出生日期" />
                <asp:BoundField DataField="mname" HeaderText="专业" ReadOnly="True" />
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
    </div>
</asp:Content>
