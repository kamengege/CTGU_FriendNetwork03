<%@ page language="java" 
	contentType="text/html;charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" 
	uri="http://java.sun.com/jsp/jstl/core"%>  
<html>
	<head>
		<title>emplist</title>
		<meta http-equiv="content-type" content="../text/html;charset=utf-8"/>
		<link rel="stylesheet" type="text/css" href="../css/style.css" />
	</head>
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
						Welcome!${u.name}
					</h1>
					<table class="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
								Name
							</td>
							<td>
								Gendar
							</td>
							<td>
								Age
							</td>
							<td style="font-style: italic;">
							${err }
							</td>
						</tr>
						<!-- 使用标准标签库来进行迭代 -->
						<c:forEach items="${list}" var="user" varStatus="i">
						<tr class="row1">
							<td>
								${i.index+1 }
							</td>
							<td>
								${user.name }
							</td>
							<td>
								<c:if test="${user.gendar==0 }">女</c:if>
								<c:if test="${user.gendar==1 }">男</c:if>
							</td>
							
							
							<td>
								${user.age }
							</td>
							<td>
							    <c:if test="${user.id==u.id }">
							    	<a href="delete.do?id=${user.id}" 
							    	onclick="return confirm('确定删除该用户么');">删除</a>&nbsp;&nbsp;
							    	<a href="load.do?username=${user.username}">更新</a>&nbsp;&nbsp;
							    </c:if>
								<a href="userDetail.do?id=${user.id}">用户详情</a>
							</td>
						</tr>
						</c:forEach>
					</table>
					<p>
						<input type="button" class="button" value="后退"
							onclick="location='login.html'" />
					</p>
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
