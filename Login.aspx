<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CSsystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>选课系统</title>
		<link rel="stylesheet" href="css/mainpage.css" />
		<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>

    <div class="header">
			<div class="header logo">
				<a id="headera" href="Login.aspx">
					<img src="img/logo.png" />
				
				<p id="logopara"> 学生选课系统</p>
</a>
			</div>
		</div>
    <div class="maincontent">
			<div class="maincontent left">
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					
					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img src="img/main3.jpg" alt="大门">
							
						</div>
						<div class="item">
							<img src="img/main1.jpg" alt="图书馆">
							
						</div>
						<div class="item">
							<img src="img/main2.jpg" alt="图书馆2">
							
						</div>
					</div>

					<!-- Controls -->
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		
			<div class="maincontent right">
				 <form id="form1" runat="server">
					<div class="form-group" style="margin-bottom:1px">
						<label for="exampleInputEmail1">编号</label> 
                        <asp:TextBox id="Textbox1"  class="form-control" runat="server" placeholder="编号"></asp:TextBox> &nbsp;&nbsp;&nbsp; &nbsp<%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请填写学号" ControlToValidate="Textbox1" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                        <%--<input type="text" class="form-control" id="textforId" placeholder="学号">--%>
					</div>
					<div class="form-group" style="margin-bottom:1px">
						<label for="exampleInputPassword1">密码</label>  
                        <asp:TextBox type="password" id="Textbox2"  class="form-control" runat="server" placeholder="密码"></asp:TextBox> &nbsp&nbsp;&nbsp; <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="请填写密码" ControlToValidate="Textbox2" ForeColor="Red"></asp:RequiredFieldValidator> --%>
					</div>
                     <span class="blank_login" style="margin-left:40px"></span>
	 <asp:RadioButton ID="RadioButton1" runat="server" Text="学生" GroupName="userType" />
                     <span class="blank_login" style="margin-left:40px"></span>
         <asp:RadioButton ID="RadioButton2" runat="server" Text="管理员" GroupName="userType" />
                     <span class="blank_login" style="margin-left:40px"></span>
                      <asp:RadioButton ID="RadioButton3" runat="server" Text="教师" GroupName="userType" />
                
                    
                     <%--<asp:Button ID="Button1" runat="server" Text="Button" />
                     <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
                     <asp:Button ID="LoginButton" class="btn btn-default" runat="server" Text="登录" OnClick="LoginButton_Click" />
					<asp:Button ID="Button2"  class="btn btn-default" runat="server" Text="重置" OnClick="Button2_Click" />
				</form>

			</div>
		</div>
		<div class="bottom">
			<p id="bottomp"> ©2018-2019 KINN. All rights reserved</p>
		</div>
	</body>

</body>
</html>
