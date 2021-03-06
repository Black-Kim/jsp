<%@page import="kr.or.ddit.user.model.UserVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>allUser</title>
<%@ include file="/common/common_lib.jsp" %>
<link href="${cp}/css/dashboard.css" rel="stylesheet">
<link href="${cp}/css/blog.css" rel="stylesheet">

</head>

<body>

	
<%@include file="/common/header.jsp" %>
<div class="container-fluid">
		<div class="row">
			
<div class="col-sm-3 col-md-2 sidebar">
<%@ include file="/common/left.jsp" %>
</div><div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				

<div class="row">
	<div class="col-sm-8 blog-main">
		<h2 class="sub-header">사용자</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<tr>
					<th>사용자 아이디</th>
					<th>사용자 이름</th>
					<th>사용자 별명</th>
					<th>등록일시</th>
				</tr>
				<c:forEach items="${userList}" var="user">
					<tr>
						<td>${user.userid}</td>
						<td>${user.usernm}</td>
						<td>${user.alias}</td>
						<td><fmt:formatDate value="${user.reg_dt}" pattern="yyyy.MM.dd"/></td>
					</tr>
				</c:forEach>
				<%-- <%	List<UserVo> list = (List<UserVo>)request.getAttribute("userList");
					for(UserVo vo : list){
						%>
						<tr>
							<td><%=vo.getUserid()%></td>
							<td><%=vo.getUsernm()%></td>
							<td><%=vo.getAlias()%></td>
							<td><%=vo.getReg_dt_fmt() %></td>
						</tr>
					<%}%> --%>
			</table>
		</div>

		<a class="btn btn-default pull-right" href="./user/registUser.jsp">사용자 등록</a>

		<div class="text-center">
			<ul class="pagination">
				<li><a href="${cp}/pagingUser?page=1">1</a></li>
				<li><a href="${cp}/pagingUser?page=2">2</a></li>
				<li><a href="${cp}/pagingUser?page=3">3</a></li>
				<li><a href="${cp}/pagingUser?page=4">4</a></li>
				<li><a href="${cp}/pagingUser?page=5">5</a></li>
			</ul>
		</div>
	</div>
</div>
	</div>
		</div>
	</div>
</body>
</html>
