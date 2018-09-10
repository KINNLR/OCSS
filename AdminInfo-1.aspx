<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainMaster.Master" AutoEventWireup="true" CodeBehind="AdminInfo-1.aspx.cs" Inherits="CSsystem.AdminInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 279px;
        }
        .auto-style4 {
            width: 71px;
        }
        .auto-style5 {
            width: 198px;
        }
        .auto-style6 {
            width: 238px
        }
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;信息查询-&gt;个人信息
     
                  <br />
    </span>
    <div style="margin-left:10px">
        <table class="table table-striped" style="text-align:center">
            <thead>
                 
                <tr>
                    <th class="auto-style6" style="text-align:center">管理员编号</th>
                    <th class="auto-style1" style="text-align:center">姓名</th>
                    <th class="auto-style4" style="text-align:center">性别</th>
                    <th class="auto-style5" style="text-align:center">密码</th>
                     <th class="auto-style5" style="text-align:center">权限</th>
                    
                </tr>
            </thead>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                </td>
                
            </tr>
        </table>

    </div>
</asp:Content>
