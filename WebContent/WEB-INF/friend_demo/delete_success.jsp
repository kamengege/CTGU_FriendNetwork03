<%@ page language="java" 
    contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
 $(document).ready(function(){
	 var code=5;
	 setInterval(function(){
		 code--;
		 $("#time").html(code);
		 if(code==0){
			 window.location.href=
			"login.html";
			 return false;
		 }
	 }, 1000);
//clearIntervar(i)  清除定时任务,i是其他定时任务的返回值
//setTimeout(fn,m);  直到m以后才执行fn


 });
</script>
</head>
<body>
 <p>该用户删除成功!</p>
 <span id="time" style="color:red;">5</span>秒后自动跳转!
 
 <a 
 href="${pageContext.request.contextPath}/friend_demo/login.html">
  请重新登录</a>
</body>
</html>