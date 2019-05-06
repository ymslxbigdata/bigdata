<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="title">Default JSP Error Page (used by ErrorController)</c:set>
<title>${title}</title>
</head>
<body>
  <h1>${title}</h1>
  <div>
    <dl>
      <dt>Status Code:</dt>
      <dd>${status} (${error})</dd>
      <dt>Message Code:</dt>
      <dd>${code}</dd>
<!--       <dt>Time:</dt> -->
<%--       <dd>${request.getAttribute("timestamp")}</dd> --%>
    </dl>
  </div>  
</body>
</html>
