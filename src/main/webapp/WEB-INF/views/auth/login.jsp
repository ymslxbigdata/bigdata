<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> --%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%-- <%@ taglib uri="http://www.yamaha_motor.co.jp/yna2/functions" prefix="f"%> --%>
<%-- <%@ taglib uri="http://www.yamaha_motor.co.jp/yna2/tags/ui" prefix="ui"%> --%>
<!DOCTYPE html>
<html>
<head>
  	<title>Login</title>
</head>
<body>
	<div id="login-form">
		<c:url value="/login" var="loginUrl" />
    	<form:form id="loginForm" action="${loginUrl}">
    		<div>
	        	<label for="sitecode">Sitecode:</label>
	        	<input type="text"  id="siteCode" name="siteCode" value="00" placeholder="Sitecode" />
	      	</div>
	      	<div>
	        	<label for="username">Username:</label>
	        	<input type="text"  id="username" name="username" value="" placeholder="Username" />
	      	</div>
	      	<div>
	       		<label for="password">Password TEST:</label>
	        	<input type="password" id="password" name="password" placeholder="Password" />
	      	</div>
	        <ul class="form-messages">
	        	<c:if test="${param.error != null}">
	          		<li class="ui-state-error-text">Invalid username and password.</li>
	        	</c:if>
	        </ul>
		 	<div>
		    	<input id="submit-button" type="submit" value="Log in"/>
			</div>
    	</form:form>
	</div>
</body>
</html>
