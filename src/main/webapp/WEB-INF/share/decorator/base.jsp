<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh" class="no-js">
	<head>
		<title>
			<sitemesh:write property="title" />
		</title>
		
		<jsp:include page="/WEB-INF/share/includes/head.jsp" />
		<sitemesh:write property="head"/>
		<jsp:include page="/WEB-INF/share/includes/base.jsp" />
		<script src='<c:url value="/resources/js/pjcommon-vue.js"/>'></script>
	</head>
		
	<body class="bodyScroll margin0">
		<sitemesh:write property="body"/>
	</body>
</html>
