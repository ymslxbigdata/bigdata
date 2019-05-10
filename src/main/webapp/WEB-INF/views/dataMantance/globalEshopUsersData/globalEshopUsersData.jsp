<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" style="height: 100%" v-cloak>
		<vue-form inline>
  			<vue-form-item label="电商平台">
    			<vue-select clearable filterable placeholder="请选择" v-model="eshop">
      				<vue-option v-for="(item,index) in eshopOptions" :label="item.eshopNm" :value="item.eshopNm"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="searchDataHandle()">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="globalEshopUsersData" border stripe show-foot >
  			<vue-table-column prop="eshopId" label="电商ID"  :visible=false></vue-table-column>
  			<vue-table-column prop="eshopNm" label="电商平台"  ></vue-table-column>
  			<vue-table-column prop="userNum" label="用户数量"  ></vue-table-column>
  			<vue-table-column prop="uerNumDevelop" label="用户数量(发展中国家)" ></vue-table-column>
  			<vue-table-column prop="userNumDeveloping" label="用户数量(发达国家)  " ></vue-table-column>
  			<vue-table-column  label="操作" width="120" align="center">
    			<template slot-scope="scope">
     				 <vue-button @click="" type="primary" size="small" icon="vue-icon-edit"></vue-button>
      				 <vue-button @click="" type="primary" size="small" icon="vue-icon-delete2"></vue-button>
    			</template>
  			</vue-table-column>
		</vue-table>
	</div>
	<jsp:include page="globalEshopUsersDataJs.jsp" />
</body>
</html>