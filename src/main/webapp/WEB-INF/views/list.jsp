<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta HTTP-EQUIV="pragma" CONTENT="no-cache">
	<meta HTTP-EQUIV="Cache-Control" CONTENT="no-store, no-cache, must-revalidate">
	<meta HTTP-EQUIV="expires" CONTENT="-1">
	<meta http-equiv="Cache" content="no-cache">
	<title>Staff list</title>
	<% pageContext.setAttribute("APP_PATH", request.getContextPath()); %>
	<spring:url value="/js/jquery-3.4.1.min.js" var="jqueryJS" />
	<spring:url value="/bootstrap/js/bootstrap3.min.js" var="bootstrapJS" />
	<spring:url value="/bootstrap/css/bootstrap3.min.css" var="bootstrapCSS" />
	<script type="text/javascript" src="${jqueryJS}"></script>
	<link rel="stylesheet" type="text/css" href="${bootstrapCSS }">
	<script type="text/javascript" src="${bootstrapJS}"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>SSM-CRUD</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary">New</button>
				<button class="btn btn-danger">Delete</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12">
				<table class="table table-hover">
					<tr>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>email</th>
						<th>deptName</th>
						<th>Actions</th>
					</tr>
					<c:forEach items="${pageInfo.list }" var="emp">
						<tr>
							<th>${emp.empId }</th>
							<th>${emp.empName }</th>
							<th>${emp.gender=="M"?"Male":"Female" }</th>
							<th>${emp.email }</th>
							<th>${emp.department.deptName }</th>
							<th>
								<button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit</button>
								<button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete</button>
							</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">The ${pageInfo.pageNum } Page, ${pageInfo.pages } pages, ${pageInfo.total } Records</div>
			<div class="col-md-6">
				<nav aria-label="Page navigation">
				<ul class="pagination">
					<li><a href="${APP_PATH }/emps?pn=1">First</a></li>
					<c:if test="${pageInfo.hasPreviousPage }">
						<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous"> <span aria-hidden="true">&laquo;</span></a></li>
					</c:if>
					<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
						<c:if test="${page_Num == pageInfo.pageNum }">
							<li class="active"><a href="#">${page_Num }</a></li>
						</c:if>
						<c:if test="${page_Num != pageInfo.pageNum }">
							<li><a href="${APP_PATH }/emps?pn=${page_Num }">${page_Num }</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${pageInfo.hasNextPage }">
						<li><a href="${APP_PATH }/emps?pn=${pageInfo.pageNum+1 }" aria-label="Next"> <span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					<li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">Last</a></li>
				</ul>
				</nav>
			</div>
		</div>
	</div>
</body>
</html>