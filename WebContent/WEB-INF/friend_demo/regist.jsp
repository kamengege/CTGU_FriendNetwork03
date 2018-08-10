<%@ page language="java" 
	contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<title>regist</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<link rel="stylesheet" type="text/css" href="../css/style.css" />
</head>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	function changeCode(){
		//获得节点对象
		var img=document.getElementById("num");
		img.src="verify?"+new Date();
		alert($("input:[name='username']"));
	}
	//注册验证
	var flag1=false;//用户名
	var flag2=false;//真实姓名
	var flag3=false;//验证码
	
	$(function(){
		//验证码
		var $checkCode=$("input:[name='checkCode']");
		$checkCode.blur(function(){
			var checkCode=$checkCode.val();
			var $checkErr=$("#checkErr");
			if(checkCode==null||checkCode==""){
				$checkErr.html("不能为空").
				css("color","red");
				flag3=false;
			}else{
				//判定输入是否正确,ajax
				$.ajax({
					url:"checkCode.do",
					data:{"code":checkCode},
					dataType:"json",
					success:function(msg){
						if(msg==1){
							flag3=true;
							$checkErr.html("输入正确").
							css("color","green");
						}else{
							flag3=false;
							$checkErr.html("输入不一致").
							css("color","red");
						}
					}
				});
			}
		});
		//username
		var $username=$("input:[name='username']");
		$username.blur( function () { 
			var usernameVal=$username.val();
			if(usernameVal==null||usernameVal==""){
				//提醒
				flag1=false;
				$("#usernameErr").html("输入不能为空!"
						).css("color","red");
				return;
			}
			$.ajax({
				url:"findByName.do",
				data:{"username":usernameVal},
				dataType:"json",
				success:function(msg){
					if(!msg){
						flag1=false;
						$("#usernameErr").html("用户名被占用!"
						).css("color","red");
					}else{
						flag1=true;
						$("#usernameErr").html("可以使用!"
						).css("color","green");
					}
				}
			});
			
		});
		
		//验证真实姓名
		var patrn=/^([\u0000-\uffff]{2,5})|([a-zA-Z]{1}[a-zA-Z0-9]{4,15})$/;
		var r = new RegExp(patrn);
		var $name=$("input:[name='name']");
		//判定:不能为空,必须满足格式
		$name.blur(function(){
			var name=$name.val();
			if(name==null||name==""){
				flag2=false;
				$("#nameErr").html("不能为空!"
						).css("color","red");
			}else{
				var f=r.test(name);//检测是否匹配
				if(f){
					flag2=true;
					$("#nameErr").html("可以使用!"
					).css("color","green");
				}else{
					flag2=false;
					$("#nameErr").html("格式错误!"
					).css("color","red");
				}
			}
		});
		
	});
	
	
	function mysubmit(){
		return flag1&&flag2&&flag3;
	}
	</script>
<body>
	<div id="wrap">
		<div id="top_content">
			<div id="header">
				<div id="rightheader">
					<p>
						2016/11/20 <br />
					</p>
				</div>
				<div id="topheader">
					<h1 id="title">
						<a href="#">Main</a>
					</h1>
				</div>
				<div id="navigation"></div>
			</div>

			<div id="content">
				<p id="whereami"></p>
				<h1>注册</h1>
				<form action="regist.do" method="post" onsubmit="return mysubmit();">
					<table cellpadding="0" cellspacing="0" border="0"
						class="form_table">
						<tr>
							<td valign="middle" align="right">用户名:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="username" /><span id="usernameErr"></span></td>
						</tr>
						<tr>
							<td valign="middle" align="right">真实姓名:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="name" /><span id="nameErr"></span></td>
						</tr>
						<tr>
							<td valign="middle" align="right">密码:</td>
							<td valign="middle" align="left"><input type="password"
								class="inputgri" name="pwd" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">年龄:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="age" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">性别:</td>
							<td valign="middle" align="left">男 <input type="radio"
								class="inputgri" name="gendar" value="1" checked="checked" /> 女
								<input type="radio" class="inputgri" name="gendar" value="0" />
							</td>
						</tr>
						<tr>
							<td valign="middle" align="right">电话:</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="phone" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">验证码: <img id="num" 
								src="verify" /> <a href="javascript:;" onclick="changeCode()">换一张</a>
							</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="checkCode" />
								<span id="checkErr"></span></td>
						</tr>
					</table>
					<p>
						<input type="submit" class="button" value="Submit &raquo;" />
					</p>
				</form>
			</div>
		</div>
		<div id="footer">
			<div id="footer_bg">ABC@126.com</div>
		</div>
	</div>
</body>
</html>
