<%@ page language="java" 
	contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c"  
	uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>login</title>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
	</head>
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script>
		$(function(){
			//$("loginErr").css("display","none")
			//找到submit按钮
			$button=$("input:[name='mybutton']");
			$button.click(function(){
				//ajax 为空,不跳转,提示错误
				//正确,调用form标签的submit方法
				var username=
					$("input:[name='username']").val();
				var pwd=
					$("input:[name='pwd']").val();
				$.ajax({
					url:"login.do",
					data:
					 {"username": username,"pwd":pwd},
					dataType:"json",
					success:function(msg){
							alert(msg);
						if(!msg){
							$("#loginErr").html
							("用户名或者密码错误").css
							("color","red");
						}else{
							//跳转主界面
							$("#myform").submit();
						}
					}
				});
			});
			
			
			
		});
	</script>
	<body>
		<div id="wrap">
			<div id="top_content">
				<div id="header">
					<div id="rightheader">
						<p>
							2016/11/20
							<br />
						</p>
					</div>
					<div id="topheader">
						<h1 id="title">
							<a href="#">Main</a>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
					</h1>
					<form action="userList.jsp" method="post" id="myform">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									username:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="username" />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									password:
								</td>
								<td valign="middle" align="left">
									<input type="password" class="inputgri" name="pwd" />
								</td>
							</tr>
							
						</table>
						<p>
							<input type="button"  name="mybutton" class="button" value="Submit &raquo;" />
						</p>
						<span id="loginErr"></span>
					</form>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
					ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>
