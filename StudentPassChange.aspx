<%@ Page Title="" Language="C#" MasterPageFile="~/StudentMainMaster.Master" AutoEventWireup="true" CodeBehind="StudentPassChange.aspx.cs" Inherits="CSsystem.StudentPassChange" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;修改密码
    </span>
    <div class="changepass" style="margin-left:200px;margin-top:50px;padding:auto;">

       <%-- <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
        <span>
        <br />
        请输入原密码：<asp:TextBox  ID="TextBox1" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
        <br />
        请输入新密码：<asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Width="200px"></asp:TextBox>
        <br />
        </span> 
        <asp:Button ID="ChangePassBut" runat="server" CssClass="btn" Text="提交" OnClick="ChangePassBut_Click" Width="200px" />
    </div>
</asp:Content>
