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
      				<vue-option v-for="(item,index) in eshopOptions" :key="index" :label="item.eshopNm" :value="item.eshopNm"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="onRetrieve">查询</vue-button>
  			</vue-form-item>
			<vue-form-item>
    			<vue-button type="primary" @click="onAddEshopUser">新增</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="globalEshopUsersData" border stripe show-foot >
		<vue-table-column type="index" width="64" align="center" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="eshopId" label="电商ID"  :visible=false></vue-table-column>
  			<vue-table-column prop="eshopNm" label="电商平台"  ></vue-table-column>
  			<vue-table-column prop="userNum" label="用户数量"  ></vue-table-column>
  			<vue-table-column prop="uerNumDevelop" label="用户数量(发展中国家)" ></vue-table-column>
  			<vue-table-column prop="userNumDeveloping" label="用户数量(发达国家)  " ></vue-table-column>
  			<vue-table-column  label="操作" width="120" align="center">
    			<template slot-scope="props">
     				 <vue-button @click="onEditRow(props.row)" type="primary" size="small" icon="vue-icon-edit"></vue-button>
      				 <vue-button @click="onDelRow(props.row)" type="primary" size="small" icon="vue-icon-delete2"></vue-button>
    			</template>
  			</vue-table-column>
		</vue-table>
		<vue-aside v-model="aside_dig" id="aside_id" close-on-click-modal>
			<!-- title area -->
			<div class="aside-note">
				<vue-row>
					<vue-col :span="12">
						<div align="left"> 跨境电商平台用户详细信息</div>
					</vue-col>
					<vue-col :span="12">
						<span class="button-group">
							<vue-button type="primary" size="small" class="icon-ok" @click="onNewOrModifyEshop('eshopUserdtform')">保存</vue-button>
						</span>
					</vue-col>
				</vue-row>
						
			</div>
			<vue-form :model="eshopUserdtform" ref="eshopUserdtform" label-width="140px" style="padding: 15px">
				<vue-form-item prop="eshopId" label="电商ID">
					<vue-input v-model="eshopUserdtform.eshopId" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="eshopNm" label="电商名称">
					<vue-input v-model="eshopUserdtform.eshopNm" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="userNum" label="用户数量">
					<vue-input v-model="eshopUserdtform.userNum" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="uerNumDevelop" label="用户数量(发展中国家)">
					<vue-input v-model="eshopUserdtform.uerNumDevelop" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="userNumDeveloping" label="用户数量(发达国家)">
				<vue-input v-model="eshopUserdtform.userNumDeveloping" ></vue-input>
				</vue-form-item>	
			</vue-form>
		</vue-aside>
	</div>
	<jsp:include page="globalEshopUsersDataJs.jsp" />
</body>
</html>