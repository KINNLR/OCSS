<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainMaster.Master" AutoEventWireup="true" CodeBehind="PassManage.aspx.cs" Inherits="CSsystem.PassManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;密码管理
     
                  <br />
    <br />
    </span>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table table-striped" DataKeyNames="ano" DataSourceID="SqlDataSource1" Width="1000px" OnSelectedIndexChanging="GridView1_SelectedIndexChanging" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="ano" HeaderText="管理员编号" ReadOnly="True" SortExpression="ano" />
            <asp:BoundField DataField="aname" HeaderText="管理员姓名" SortExpression="aname" />
            <asp:BoundField DataField="apass" HeaderText="管理员密码" SortExpression="apass" />
            <asp:BoundField DataField="asex" HeaderText="管理员性别" SortExpression="asex" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#3D8031" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
     </asp:GridView>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CSsystemConnectionString %>" SelectCommand="SELECT [ano], [aname], [apass], [asex] FROM [tb_admin]" DeleteCommand="DELETE FROM [tb_admin] WHERE [ano] = @ano" InsertCommand="INSERT INTO [tb_admin] ([ano], [aname], [apass], [asex]) VALUES (@ano, @aname, @apass, @asex)" UpdateCommand="UPDATE [tb_admin] SET [aname] = @aname, [apass] = @apass, [asex] = @asex WHERE [ano] = @ano">
         <DeleteParameters>
             <asp:Parameter Name="ano" Type="String" />
         </DeleteParameters>
         <InsertParameters>
             <asp:Parameter Name="ano" Type="String" />
             <asp:Parameter Name="aname" Type="String" />
             <asp:Parameter Name="apass" Type="String" />
             <asp:Parameter Name="asex" Type="String" />
         </InsertParameters>
         <UpdateParameters>
             <asp:Parameter Name="aname" Type="String" />
             <asp:Parameter Name="apass" Type="String" />
             <asp:Parameter Name="asex" Type="String" />
             <asp:Parameter Name="ano" Type="String" />
         </UpdateParameters>
     </asp:SqlDataSource>
     <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateEditButton="True" AutoGenerateRows="False" CellPadding="4" CssClass="table table-striped" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" Height="66px" Width="890px" DataKeyNames="ano" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">
         <EditRowStyle BackColor="#3D8031" Font-Bold="True" ForeColor="Black" />
         <Fields>
             <asp:BoundField DataField="ano" HeaderText="管理员编号" ReadOnly="True" SortExpression="ano" />
             <asp:BoundField DataField="aname" HeaderText="管理员姓名" SortExpression="aname" ReadOnly="True" />
             <asp:BoundField DataField="apass" HeaderText="管理员密码" SortExpression="apass" />
         </Fields>
         <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
         <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
         <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
     </asp:DetailsView>
     
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CSsystemConnectionString %>"
            SelectCommand="SELECT ano, aname, apass FROM tb_admin WHERE (ano = @ano)" UpdateCommand="UPDATE [tb_admin] SET [apass] = @apass WHERE [ano] = @ano">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ano" PropertyName="SelectedValue"  Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

     <br />
     <br />
     </asp:Content>

