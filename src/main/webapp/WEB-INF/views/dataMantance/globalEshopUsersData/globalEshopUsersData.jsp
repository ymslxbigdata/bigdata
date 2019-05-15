<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" style="height: 100%" v-cloak>
		<vue-form inline>
  			<vue-form-item label="电商名称">
    			<vue-select clearable filterable placeholder="请选择" v-model="eshop" @change="changeCondition">
      				<vue-option v-for="(item,index) in eshopOptions" :key="index" :label="item.eshopNm" :value="item.eshopNm"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="onRetrieve">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="globalEshopUsersData" border stripe show-foot :height="tableHeight" >
		<vue-table-column type="index" width="64" align="center" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="eshopId" label="电商ID"></vue-table-column>
  			<vue-table-column prop="eshopNm" label="电商名称" ></vue-table-column>
  			<vue-table-column prop="userNum" label="用户数量" sortable></vue-table-column>
  			<vue-table-column prop="uerNumDevelop" label="用户数量(发展中国家)" sortable></vue-table-column>
  			<vue-table-column prop="userNumDeveloping" label="用户数量(发达国家)" sortable></vue-table-column>
  			<vue-table-column  label="操作" width="120" align="center">
    			<template slot-scope="props">
     				 <vue-button @click="onEditRow(props.row)" type="primary" size="small" icon="vue-icon-edit"></vue-button>
      				 <vue-button @click="onDelRow(props.row)" type="primary" size="small" icon="vue-icon-delete2"></vue-button>
    			</template>
  			</vue-table-column>
		</vue-table>
		<vue-form inline style="margin-top:10px">
			<vue-form-item>
				<vue-button type="primary" @click="onAddEshopUser" >添加</vue-button>
			</vue-form-item>
			<vue-form-item>
				<vue-button type="primary" ><a :href ="downloadUrl">导出</a></vue-button>
			</vue-form-item>
			<vue-form-item>
				<vue-upload inline :action="uploadUrl" :before-upload="beforeAvatarUpload" :show-file-list="false" :on-success="uploadSuccessHandle" :on-error="uploadErrorHandle">
					<vue-button type="primary">导入</vue-button>
				</vue-upload>
			</vue-form-item>
		</vue-form>
		<vue-aside v-model="aside_dig" id="aside_id" title="编辑数据" close-on-click-modal>
			<vue-form :model="eshopUserdtform" ref="eshopUserdtform" :rules="eshopUserdtformRules" label-width="150px" style="padding: 15px">
				<vue-form-item prop="eshopId" label="电商ID" >
					<vue-input v-model="eshopUserdtform.eshopId" :disabled="true"></vue-input>
				</vue-form-item>
				<vue-form-item prop="eshopNm" label="电商名称">
					<vue-select clearable filterable placeholder="请选择" v-model="eshopUserdtform.eshopNm" @change="changeAsideConditon" :disabled="disabledAsideKey">
      					<vue-option v-for="(item,index) in eshopOptions" :key="index" :label="item.eshopNm" :value="item.eshopNm"></vue-option>
    				</vue-select>
				</vue-form-item>
				<vue-form-item prop="userNum" label="用户数量">
					<vue-input v-model="eshopUserdtform.userNum" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>
				<vue-form-item prop="uerNumDevelop" label="用户数量(发展中国家)">
					<vue-input v-model="eshopUserdtform.uerNumDevelop" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>
				<vue-form-item prop="userNumDeveloping" label="用户数量(发达国家)">
				<vue-input v-model="eshopUserdtform.userNumDeveloping" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>	
			</vue-form>
			<span slot="footer">
    			<vue-button @click="aside_dig = false">取消</vue-button>
    			<vue-button type="primary" @click="onNewOrModifyEshopUser('eshopUserdtform')">确认</vue-button>
  			</span>
		</vue-aside>
	</div>
	<jsp:include page="globalEshopUsersDataJs.jsp" />
</body>
</html>