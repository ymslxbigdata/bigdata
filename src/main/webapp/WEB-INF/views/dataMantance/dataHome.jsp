<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app">
		<vue-row class="menu-bar" type="flex" align="middle">
			<vue-col :span=24 class="menu-title">跨境电商数据管理中心</vue-col>
		</vue-row>
		<vue-row>
			<vue-col id="leftNavId" class="background-color-324157" :xs="4" :sm="4" :md="4" :lg="4">
				<vue-menu theme="dark" default-active="0" @select="navMenuSelect" :default-openeds="openItem">
					<vue-submenu index="1">
						<template slot="title"><i class="vue-icon-message"></i>后台数据维护</template>
						<vue-menu-item index="1-1">
							<div @click="addTab(tabs['globalEshopInfo'])">
								<i class="fa fa-building-o" aria-hidden="true"></i>
								全球跨境电商平台信息
							</div>
						</vue-menu-item>
						
						<vue-menu-item index="1-2">
							<div @click="addTab(tabs['globalEshopUsersData'])">
								<i class="fa fa-list-alt" aria-hidden="true"></i> 
								全球跨境电商平台用户数据
							</div>
						</vue-menu-item>
						
						<vue-menu-item index="1-3">
							<div @click="addTab(tabs['globalEshopTradeData'])">
								<i class="fa fa-users" aria-hidden="true"></i>
								全球跨境电商平台交易数据
							</div>
						</vue-menu-item>
					<vue-col v-if="setAuthority(item.menuId)" :xs="4" :sm="4" :md="4" :lg="4" v-for="(item, index) in navMenuList" :key="index">
					<div :class="['text-align-center', 'cursor-pointer', item.menuCode == iframeName ? 'font-color-25FFFC' : '']" @click="navMenuClick(item)">
						<%-- <img width="40" height="40" :src="'${pageContext.request.contextPath}'+item.imageUrl"/> --%>
						<i :class="['fa', item.menuIcon, 'fa-2x']"></i>
						<span class="display-block">{{item.menuName}}</span>
					</div>
				</vue-col>
				</vue-menu>
			</vue-col>
			<vue-col :span="20" style="background-color:white;">
				<div id="contentBodyId" style="border:0px;width:100%;height:100%;margin:0px;padding:0px;padding:10px;">
					<vue-tabs v-model="editableTabsValue" type="card" closable @tab-remove="removeTab" style="width:100%;height:100%;border: 0">
						<vue-tab-pane v-for="(item, index) in editableTabs" :key="index" :label="item.title" :name="item.name" style="width:100%;height:100%;border: 0">
							{{ item.content }}
							<iframe :src="item.url" style="width:100%;height:100%;border: 0"></iframe>
						</vue-tab-pane>
					</vue-tabs>
				</div>
			</vue-col>
		</vue-row>
	</div>
	<jsp:include page="dataHomeJs.jsp" />
</body>
</html>