<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" style="height: 100%" v-cloak>
		<vue-form inline>
  			<vue-form-item label="品牌ID">
    			<vue-input  v-model="brandId" :maxlength="32" @change="changeCondition"></vue-input>
  			</vue-form-item>
  			<vue-form-item label="品牌名称">
    			<vue-input v-model="brandNm" :maxlength="32" @change="changeCondition"></vue-input>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="searchDataHandle()">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="furnitureHotSaleProductData" :height="tableHeight" border stripe show-foot>
  			<vue-table-column prop="brandId" label="品牌ID"></vue-table-column>
  			<vue-table-column prop="brandNm" label="品牌名称"></vue-table-column>
  			<vue-table-column prop="ratio" label="市场占比"></vue-table-column>
  			<vue-table-column  label="操作" width="110" align="center">
    			<template slot-scope="scope">
     				 <vue-button @click="editInsertHandle(scope.row,'edit')" type="primary" size="small" icon="vue-icon-edit"></vue-button>
      				 <vue-button @click="deleteHandle(scope.row)" type="primary" size="small" icon="vue-icon-delete2"></vue-button>
    			</template>
  			</vue-table-column>
		</vue-table>
		<vue-form inline style="margin-top:10px">
			<vue-form-item>
				<vue-button type="primary" @click="editInsertHandle('','insert')" >添加</vue-button>
				</vue-upload>
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
		<vue-aside v-model="showAside" position="right" title="编辑数据" close-on-click-modal>
  			<vue-form :model="currentData" ref="currentData" :rules="currentDataRules" label-width="150px">
  				<vue-form-item prop="brandId" label="品牌ID">
    				<vue-input v-model="currentData.brandId" :disabled="disabledAsideBrandId"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item prop="brandNm" label="品牌名称">
    				<vue-input v-model="currentData.brandNm" :disabled="disabledAsideBrandNm"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="市场占比">
    				<vue-input v-model="currentData.ratio" :cleave="{numeral:true,}" :maxlength="3"></vue-input>
 				 </vue-form-item>
  			</vue-form>
  			<span slot="footer">
    			<vue-button @click="showAside = false">取消</vue-button>
    			<vue-button type="primary" @click="editInsertSaveHandle('currentData')">保存</vue-button>
  			</span>
		</vue-aside>
		<vue-dialog v-model="showDialog" size="tiny">
			<span>是否确认删除该笔数据</span>
			<span slot="footer" class="dialog-footer">
    			<vue-button @click="showDialog = false">取消</vue-button>
    			<vue-button type="primary" @click="deleteSaveHandle">确认</vue-button>
  			</span>
		</vue-dialog>
	</div>
	<jsp:include page="furnitureHotSaleProductDataJs.jsp" />
</body>
</html>