﻿<%@ Page Title="" Language="C#" MasterPageFile="~/TeacherMainMaster.Master" AutoEventWireup="true" CodeBehind="TeacherMainPage.aspx.cs" Inherits="CSsystem.TeacherMain1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;首页
    </span>
    <br />
    <div class="welcomemessage" style="padding:50px 150px 0 0;">
           <strong> 欢迎来到学生选课系统，<asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>教师,
           现在时间是： <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></strong>
    </div>
</asp:Content>
