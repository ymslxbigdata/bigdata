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
  			<vue-form-item label="月份">
    			<vue-select clearable filterable placeholder="选择" v-model="month" @change="changeCondition">
      				<vue-option v-for="(item,index) in monthOptions" :label="item.label" :value="item.value"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="searchDataHandle()">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="globalEshopTradeData" border stripe height="715">
  			<vue-table-column prop="eshopId" label="电商ID"  :visible=false></vue-table-column>
  			<vue-table-column prop="eshopNm" label="电商平台"  width="120"></vue-table-column>
  			<vue-table-column prop="tradeMonth" label="月份"  width="60"></vue-table-column>
  			<vue-table-column prop="tradeVolume" label="交易额" ></vue-table-column>
  			<vue-table-column prop="tradeVolumeDeveloped" label="交易额(发展中国家)"  width="155"></vue-table-column>
  			<vue-table-column prop="tradeVolumeDeveloping" label="交易额(发达国家)"  width="150"></vue-table-column>
  			<vue-table-column prop="tradeVolumeAsia" label="交易额(亚洲)" width="115"></vue-table-column>
  			<vue-table-column prop="tradeVolumeEurope" label="交易额(欧洲)" width="115"></vue-table-column>
  			<vue-table-column prop="tradeVolumeAfrica" label="交易额(非洲)" width="115"></vue-table-column>
  			<vue-table-column prop="tradeVolumeOceania" label="交易额(大洋洲)" width="140"></vue-table-column>
  			<vue-table-column prop="tradeVolumeNAmerica" label="交易额(北美洲)" width="140"></vue-table-column>
  			<vue-table-column prop="tradeVolumeSAmerica" label="交易额(南美洲)" width="140"></vue-table-column>
  			<vue-table-column prop="tradeVolumeSChina" label="交易额(中国)" width="115"></vue-table-column>
  			<vue-table-column  label="操作" width="120" align="center">
    			<template slot-scope="scope">
     				 <vue-button @click="editInsertHandle(scope.row,'edit')" type="primary" size="small" icon="vue-icon-edit"></vue-button>
      				 <vue-button @click="deleteSaveHandle(scope.row)" type="primary" size="small" icon="vue-icon-delete2"></vue-button>
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
    				<vue-input v-model="currentData.eshopNm" :disabled="disabledAsideEshopNm"></vue-input>
 				 </vue-form-item> 
 				 <vue-form-item label="月份">
    				<vue-input v-model="currentData.tradeMonth" :disabled="disabledAsideTradeMonth"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额">
    				<vue-input v-model="currentData.tradeVolume"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(发展中国家)">
    				<vue-input v-model="currentData.tradeVolumeDeveloped"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(发达国家)">
    				<vue-input v-model="currentData.tradeVolumeDeveloping"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(亚洲)">
    				<vue-input v-model="currentData.tradeVolumeAsia"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(欧洲)">
    				<vue-input v-model="currentData.tradeVolumeEurope"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(非洲)">
    				<vue-input v-model="currentData.tradeVolumeAfrica"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(大洋洲)">
    				<vue-input v-model="currentData.tradeVolumeOceania"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(北美洲)">
    				<vue-input v-model="currentData.tradeVolumeNAmerica"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(南美洲)">
    				<vue-input v-model="currentData.tradeVolumeSAmerica"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(中国)">
    				<vue-input v-model="currentData.tradeVolumeSChina"></vue-input>
 				 </vue-form-item>
  			</vue-form>
  			<span slot="footer">
    			<vue-button @click="showAside = false">取消</vue-button>
    			<vue-button type="primary" @click="editInsertSaveHandle">保存</vue-button>
  			</span>
		</vue-aside>
	</div>
	<jsp:include page="globalEshopTradeDataJs.jsp" />
</body>
</html>