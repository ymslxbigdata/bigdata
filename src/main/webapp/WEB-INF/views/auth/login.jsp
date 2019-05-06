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
  	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/> 
</head>
<body>
	<div style=" position: fixed;float: left;width: 100%;height: 100%;background: url(${pageContext.request.contextPath}/resources/images/login-background.jpg) no-repeat center fixed;background-size: cover; "></div> 
	<div style=" position: fixed;float: left;width: 100%;height: 100%;background-color: rgba(87, 99, 109, 0.73);"></div> 
	<div id="login" v-cloak >  
		<vue-row  type="flex" justify="center" > 
			<div class='main-container bg-overlay'> 
				<vue-row  type="flex" justify="center"  >
					<vue-col :span="24" > 
						<vue-card >
							<c:url value="/login" var="loginUrl"/>
							<vue-form :model='loginForm' :rules="rules" ref='loginForm' id="loginForm" action="${pageContext.request.contextPath}/login" method="post">
								<strong class="no-margins" style="font-size: 30px;">Welcome</strong>
								<p class=""></p>
								<vue-form-item prop="siteCode" v-show="false">
									<label>Sitecode:</label>
				        			<vue-input name="siteCode" v-model="loginForm.siteCode"></vue-input>
				      			</vue-form-item>
								<vue-form-item  prop="username" label="UserName">
									<vue-input v-model='loginForm.username' placeholder="用户名" name='username' icon='icon-user'></vue-input>
								</vue-form-item>
								<vue-form-item  prop="password" label="Password">
									<vue-input v-model='loginForm.password' placeholder="密码" type='password' name='password' icon='icon-lock'></vue-input>
								</vue-form-item>  
								<div class="margin-top20 font-color-red" v-if="${param.error != null}">用户名或密码错误！</div>
								<p class=""></p>
								<vue-button circle class='submit-button' type="success" @click="onSubmit('loginForm')" >登&nbsp;&nbsp;&nbsp;录</vue-button>
								
									<input type="hidden" name="_csrf" value="" id="csrfField"/>
							</vue-form>
						</vue-card>
					</vue-col>
				</vue-row> 
				<vue-row  type="flex" justify="center">
					<vue-col :span="24" > 
						<div class="signup-footer">
							<div class="pull-left">
								&copy; 2019 All Rights Reserved.
							</div>
						</div>
					</vue-col>
				</vue-row> 
			</div>  
		</vue-row> 
	</div>
	<jsp:include page="loginJs.jsp" />
</body>
</html>
