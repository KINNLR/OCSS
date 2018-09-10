<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainMaster.Master" AutoEventWireup="true" CodeBehind="AdminInfo-7.aspx.cs" Inherits="CSsystem.AdminInfo_71" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;信息录入-&gt;教师信息
     
                   
    <br />
     
                  <br />
    </span>
    <div style="margin-left:10px">
        <table class="table table-striped" style="text-align:center">
            <thead>
                 
                <tr>
                    <th class="auto-style6" >教师编号</th>
                    <th class="auto-style1" >系别编号</th>
                    <th class="auto-style4" >教师姓名</th>
                   <th class="auto-style4" >教师性别</th>
                </tr>
            </thead>
            <tr>
                <td class="auto-style6" style="text-align:center">
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Height="30px" Width="96px"></asp:TextBox>
                </td>
                <td class="auto-style1" style="text-align:center">
                   <asp:TextBox ID="TextBox2" CssClass="form-control" runat="server" Height="30px" Width="96px"></asp:TextBox>
                </td>
                <td class="auto-style4">
                   <asp:TextBox ID="TextBox3" CssClass="form-control" runat="server" Height="30px" Width="96px"></asp:TextBox>
                </td> 
                <td class="auto-style4">
                   <asp:TextBox ID="TextBox4" CssClass="form-control" runat="server" Height="30px" Width="96px"></asp:TextBox>
                </td>
              
              
                
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" CssClass="btn"  Text="提交" OnClick="Button1_Click" Width="161px" />
        <span style="margin-left:50px"></span>
         <asp:Button ID="Button2" runat="server" CssClass="btn"  Text="查看教师信息" OnClick="Button2_Click" Width="161px" />
        </div>
</asp:Content>
