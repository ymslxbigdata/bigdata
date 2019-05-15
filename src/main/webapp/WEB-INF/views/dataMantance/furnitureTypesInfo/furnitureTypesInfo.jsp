<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" style="height: 100%" v-cloak>
		<vue-form inline>
  			<vue-form-item label="家具种类名">
    			<vue-select clearable filterable placeholder="请选择" v-model="typeNm" @change="changeCondition">
      				<vue-option v-for="(item,index) in typeNmOptions" :key="index" :label="item.typeNm" :value="item.typeNm"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="onRetrieve">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="furnitureTypesInfoData" :height="tableHeight" border stripe show-foot >
		<vue-table-column type="index" width="64" align="center" ></vue-table-column>
  			<vue-table-column prop="typeId" label="种类ID" ></vue-table-column>
  			<vue-table-column prop="typeNm" label="种类名" ></vue-table-column>
  			<vue-table-column  label="操作" width="120" align="center">
    			<template slot-scope="props">
     				 <vue-button @click="onEditRow(props.row)" type="primary" size="small" icon="vue-icon-edit"></vue-button>
      				 <vue-button @click="onDelRow(props.row)" type="primary" size="small" icon="vue-icon-delete2"></vue-button>
    			</template>
  			</vue-table-column>
		</vue-table>
		<vue-form inline style="margin-top:10px">
			<vue-form-item>
				<vue-button type="primary" @click="onAddFurnitureType" >添加</vue-button>
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
			<vue-form :model="furnitureTypesDtform" ref="furnitureTypesDtform" :rules="furnitureTypesDtformRules" label-width="140px" style="padding: 15px">
				<vue-form-item prop="typeId" label="电商ID">
					<vue-input v-model="furnitureTypesDtform.typeId" :maxlength="32" :disabled="disabledAsideKey"></vue-input>
				</vue-form-item>
				<vue-form-item prop="typeNm" label="种类名">
					<vue-input v-model="furnitureTypesDtform.typeNm" :maxlength="32"></vue-input>
				</vue-form-item>
			</vue-form>
			<span slot="footer">
    			<vue-button @click="aside_dig = false">取消</vue-button>
    			<vue-button type="primary" @click="onNewOrModifyFurnitureType('furnitureTypesDtform')">确认</vue-button>
  			</span>
		</vue-aside>
	</div>
	<jsp:include page="furnitureTypesInfoJs.jsp" />
</body>
</html>