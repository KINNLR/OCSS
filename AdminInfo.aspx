<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMainMaster.Master" AutoEventWireup="true" CodeBehind="AdminInfo.aspx.cs" Inherits="CSsystem.AdminInfo1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <span class="posite" style="color:#3D8031;cursor:default">
        当前位置-&gt;信息查询
     
                  <br />
   
    </span>
    <div class="ChooseEnterSearch" style="margin-top:100px;margin-left:150px">
       <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ForeColor="#3D8031">个人信息查询</asp:LinkButton>
        <span class="blankSearch" style="margin-left:50px;margin-right:50px   ;border-left:1px solid black" ></span>
    <asp:LinkButton ID="LinkButton2" runat="server" ForeColor="#3D8031" OnClick="LinkButton2_Click">学生选课信息查询</asp:LinkButton>
  <span class="blankSearch" style="margin-left:50px;margin-right:50px   ;border-left:1px solid black"></span>
    <asp:LinkButton ID="LinkButton3" runat="server" ForeColor="#3D8031" OnClick="LinkButton3_Click">教师信息查询</asp:LinkButton>
    <span class="blankSearch" style="margin-left:50px;margin-right:50px   ;border-left:1px solid black"></span>
        <asp:LinkButton ID="LinkButton4" runat="server" ForeColor="#3D8031" OnClick="LinkButton4_Click">专业信息查询</asp:LinkButton>
        <br />
   <div style="margin-top:10px"></div>
        <asp:LinkButton ID="LinkButton5" runat="server" ForeColor="#3D8031" OnClick="LinkButton5_Click">学生信息录入</asp:LinkButton>

         <span class="blankSearch" style="margin-left:50px;margin-right:50px   ;border-left:1px solid black"></span>
        <asp:LinkButton ID="LinkButton6" runat="server" ForeColor="#3D8031" OnClick="LinkButton6_Click">课程信息录入</asp:LinkButton>
           
          <span class="blankSearch" style="margin-left:80px;margin-right:50px   ;border-left:1px solid black"></span>
        <asp:LinkButton ID="LinkButton8" runat="server" ForeColor="#3D8031" OnClick="LinkButton7_Click">教师信息录入</asp:LinkButton>

         <span class="blankSearch" style="margin-left:50px;margin-right:50px   ;border-left:1px solid black"></span>
        <asp:LinkButton ID="LinkButton7" runat="server" ForeColor="#3D8031" OnClick="LinkButton8_Click">增加管理员</asp:LinkButton>
    
    
    </div>
   
  
</asp:Content>
