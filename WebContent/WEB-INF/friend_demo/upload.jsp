<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style type="text/css">
  .mydiv{
	 position: absolute;
	 top: 50%;
	 left:50%;
	 margin: -200px 0 0 -200px;
	 width: 400px;
	 height: 400px;
	 text-align: center;
 }
  
</style>
</head>
<body>
	<div class="mydiv">
		<form action="update.do" method="post">
			<table border="1">
				<tr>
					<td>id</td>
					<td><input type="hidden" name="id" value="${user1.id}"/></td>
				</tr>
				<tr>
					<td>username</td>
					<td><input  readonly="readonly" name="username" value="${user1.username}"/></td>
				</tr>
				<tr>
					<td>name</td>
					<td><input name="name" value="${user1.name}"/></td>
				</tr>
				<tr>
					<td>gendar</td>
					<td><input name="gendar" value="${user1.gendar}"/></td>
				</tr>
				<tr>
					<td>age</td>
					<td><input name="age" value="${user1.age}"/></td>
				</tr>
				<tr>
					<td>phone</td>
					<td><input name="phone" value="${user1.phone}
					"/></td>
				</tr>
				<tr>
					<td>password</td>
					<td><input name="pwd" value="${user1.password}"/></td>
				</tr>
				<tr>
				  <td>更新信息</td>
				  <td><input type="submit" value="提交"
				   style="margin-left:60px; "></td>
				</tr>
			</table>
			
		</form>
	</div>
</body>
</html>