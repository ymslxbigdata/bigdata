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
  			<vue-form-item label="年月">
  				<vue-date-picker v-model="month" type="month" format="yyyy-MM" placeholder="请选择" @change="changeCondition"></vue-date-picker>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="searchDataHandle()">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="globalEshopTradeData" :height="tableHeight" border stripe show-foot>
  			<vue-table-column prop="eshopId" label="电商ID" :visible=false show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="eshopNm" label="电商平台" width="120" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeDate" label="年月" width="90" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolume" label="交易额"  width="150" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeDeveloping" label="交易额-发展中国家"  width="150" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeDeveloped" label="交易额-发达国家"  width="150" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeAsia" label="交易额-亚洲" width="110" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeEurope" label="交易额-欧洲" width="110" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeAfrica" label="交易额-非洲" width="110" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeOceania" label="交易额-大洋洲" width="120" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeNAmerica" label="交易额-北美洲" width="120" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeSAmerica" label="交易额-南美洲" width="120" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolumeSChina" label="交易额-中国" width="110" show-overflow-tooltip></vue-table-column>
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
  				<vue-form-item prop="eshopId" label="电商ID" v-show="showAsideEshopId">
    				<vue-input v-model="currentData.eshopId"></vue-input>
 				 </vue-form-item>
  				 <vue-form-item prop="eshopNm" label="电商平台">
    				<vue-select clearable filterable placeholder="请选择" v-model="currentData.eshopId" @change="changeAsideConditon" :disabled="disabledAsideEshopNm">
      					<vue-option v-for="(item,index) in eshopOptions" :label="item.eshopNm" :value="item.eshopId"></vue-option>
    				</vue-select>
 				 </vue-form-item> 
 				 <vue-form-item prop="tradeDate" label="年月">
 				 	<vue-date-picker v-model="currentData.tradeDate" type="month" :disabled="disabledAsideTradeDate" format="yyyy-MM" placeholder="请选择" ></vue-date-picker>
 				 </vue-form-item>
 				 <vue-form-item label="交易额">
    				<vue-input v-model="currentData.tradeVolume" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(发展中国家)">
    				<vue-input v-model="currentData.tradeVolumeDeveloped" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(发达国家)">
    				<vue-input v-model="currentData.tradeVolumeDeveloping" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(亚洲)">
    				<vue-input v-model="currentData.tradeVolumeAsia" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(欧洲)">
    				<vue-input v-model="currentData.tradeVolumeEurope" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(非洲)">
    				<vue-input v-model="currentData.tradeVolumeAfrica" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(大洋洲)">
    				<vue-input v-model="currentData.tradeVolumeOceania" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(北美洲)">
    				<vue-input v-model="currentData.tradeVolumeNAmerica" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(南美洲)">
    				<vue-input v-model="currentData.tradeVolumeSAmerica" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
 				 </vue-form-item>
 				 <vue-form-item label="交易额(中国)">
    				<vue-input v-model="currentData.tradeVolumeSChina" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
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
	<jsp:include page="globalEshopTradeDataJs.jsp" />
</body>
</html>