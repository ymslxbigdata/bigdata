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
    			<vue-select clearable filterable placeholder="请选择" v-model="eshopId" @change="changeCondition">
      				<vue-option v-for="(item,index) in eshopOptions" :label="item.eshopNm" :value="item.eshopId"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="searchDataHandle()">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="globalEshopOverseasRepoData" border stripe height="715">
  			<vue-table-column prop="eshopId" label="电商ID"  :visible=false></vue-table-column>
  			<vue-table-column prop="eshopNm" label="电商平台"></vue-table-column>
  			<vue-table-column prop="overseasRepo" label="海外仓"></vue-table-column>
  			<vue-table-column prop="repoLocationX" label="地理位置(经度)" ></vue-table-column>
  			<vue-table-column prop="repoLocationY" label="地理位置(纬度)" ></vue-table-column>
  			<vue-table-column prop="capacity" label="容量" ></vue-table-column>
  			<vue-table-column prop="totalStock" label="库存"  ></vue-table-column>
  			<vue-table-column prop="useabelStock" label="可用库存"></vue-table-column>
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
				<vue-button type="primary" @click="importHandle" >导入</vue-button>
				<vue-button type="primary" @click="exportHandle" >导出</vue-button>
			</vue-form-item>
		</vue-form>
		<vue-aside v-model="showAside" position="right" title="编辑数据" close-on-click-modal>
  			<vue-form :model="currentData" label-width="150px">
  				<vue-form-item label="电商ID" v-show="showAsideEshopId">
    				<vue-input v-model="currentData.eshopId"></vue-input>
 				 </vue-form-item>
  				 <vue-form-item label="电商平台">
    				<vue-select clearable filterable placeholder="请选择" v-model="currentData.eshopId" @change="changeAsideConditon" :disabled="disabledAsideEshopNm">
      					<vue-option v-for="(item,index) in eshopOptions" :label="item.eshopNm" :value="item.eshopId"></vue-option>
    				</vue-select>
 				 </vue-form-item> 
 				 <vue-form-item label="海外仓">
    				<vue-input v-model="currentData.overseasRepo"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="地理位置(经度)">
    				<vue-input v-model="currentData.repoLocationX"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="地理位置(纬度)">
    				<vue-input v-model="currentData.repoLocationY"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="容量">
    				<vue-input v-model="currentData.capacity"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="库存">
    				<vue-input v-model="currentData.totalStock"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="可用库存">
    				<vue-input v-model="currentData.useabelStock"></vue-input>
 				 </vue-form-item>
  			</vue-form>
  			<span slot="footer">
    			<vue-button @click="showAside = false">取消</vue-button>
    			<vue-button type="primary" @click="editInsertSaveHandle">保存</vue-button>
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
	<jsp:include page="globalEshopOverseasRepoJs.jsp" />
</body>
</html>