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
				<vue-menu theme="dark" default-active="0" :default-openeds="openItem">
					<vue-submenu v-for="(mainMenu, index) in navMenuList" :index="mainMenu.mainIndex" :key="index">
						<template slot="title"><i class="vue-icon-message"></i>{{mainMenu.mainMenu}}</template>
						<vue-menu-item v-for="(subMenu,index) in mainMenu.subMenu" :index="subMenu.subIndex" :key="index">
							<div @click="addTab(subMenu)">
								<i class="fa fa-building-o" aria-hidden="true"> {{subMenu.title}}</i>
							</div>
						</vue-menu-item>
					</vue-submenu>
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