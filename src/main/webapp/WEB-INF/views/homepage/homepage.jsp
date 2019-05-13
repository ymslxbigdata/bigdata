<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
</head>
<body>
	<div id="app">
		<vue-row id="menuHorizonId" class="menu-bar" type="flex" align="middle">
  			<vue-col class="menu-title" :span="6">
  				<div class="">跨境电商大数据平台</div>
  			</vue-col>
  			<vue-col :span="16">
  				<vue-menu theme="dark"  mode="horizontal" default-active="0" @select="onMenuItemClick">
  					<vue-menu-item v-for="(menuItem,index) in menuList" customFontSize="24" :index="index+''">{{menuItem.label}}</vue-menu-item>
  				</vue-menu>
  			</vue-col>
  			<vue-col :span="2">
  				<vue-button type="primary" size="large" @click="onDataMantanceClick">后台管理</vue-button>
  			</vue-col>
		</vue-row>
		<vue-row type="flex" justify="center" style="width:100%;background-color:#0d1633" >
			<div class="img-content" style="background-image:url(${pageContext.request.contextPath}/resources/images/homepage/u2.png)"></div>
		</vue-row>
		<vue-row type="flex" justify="center" style="width:100%;background-color:#141414">
			<div class="img-content" style="background-image:url(${pageContext.request.contextPath}/resources/images/homepage/u4.png)"></div>
		</vue-row>
		<vue-row type="flex" justify="center" style="width:100%;background-color:#0d1633">
			<div class="img-content"style="background-image:url(${pageContext.request.contextPath}/resources/images/homepage/u0.png)"></div>
		</vue-row>
	</div>
	<jsp:include page="homepageJs.jsp" />
</body>
</html>