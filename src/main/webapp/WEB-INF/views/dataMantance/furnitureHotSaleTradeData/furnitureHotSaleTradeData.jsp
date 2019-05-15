<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" style="height: 100%" v-cloak>
		<vue-form inline>
  			<vue-form-item label="种类名">
    			<vue-select clearable filterable placeholder="请选择" v-model="typeNm" @change="changeCondition">
      				<vue-option v-for="(item,index) in typeNmOptions" :key="index" :label="item.typeNm" :value="item.typeNm"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item label="产品名称">
				<vue-input v-model="productNm" :maxlength="32" @change="changeCondition"></vue-input>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="onRetrieve">查询</vue-button>
		</vue-form>
		<vue-table :data="furnitureHotSaleTradeData" :height="tableHeight" border stripe show-foot >
			<vue-table-column type="index" width="64" align="center" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="saleTradeId" label="热销交易ID" :visible=false show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="typeId" label="种类ID"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="typeNm" label="种类名"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="productId" label="产品ID"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="productNm" label="产品名称"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="hotSalePlace" label="热销地"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="productPlace" label="主要产地"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeDate" label="年月" align="center" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeVolume" label="交易额"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeAmazon" label="交易额-亚马逊"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeAli" label="交易额-阿里"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeWish" label="交易额-wish"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeEbay" label="交易额-ebay"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeOthers" label="交易额-其他"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column  label="操作" width="120" align="center">
    			<template slot-scope="props">
     				 <vue-button @click="onEditRow(props.row)" type="primary" size="small" icon="vue-icon-edit"></vue-button>
      				 <vue-button @click="onDelRow(props.row)" type="primary" size="small" icon="vue-icon-delete2"></vue-button>
    			</template>
  			</vue-table-column>
		</vue-table>
		<vue-form inline style="margin-top:10px">
			<vue-form-item>
				<vue-button type="primary" @click="onAddFurnitureHotSaleTradeData" >添加</vue-button>
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
			<vue-form :model="furnitureHotSaleTradeDataDtform" ref="furnitureHotSaleTradeDataDtform" :rules="furnitureHotSaleTradeDataDtformRules" label-width="140px" style="padding: 15px">
				<vue-form-item prop="saleTradeId" label="热销交易ID" v-show="false">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.saleTradeId" :maxlength="64" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="typeId" label="种类ID">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.typeId" :disabled="true"></vue-input>
				</vue-form-item>
				<vue-form-item prop="typeNm" label="种类名">
					<vue-select clearable filterable placeholder="请选择" v-model="furnitureHotSaleTradeDataDtform.typeNm" @change="changeAsideConditon"  :disabled="disabledAsideKey">
      					<vue-option v-for="(item,index) in typeNmOptions" :key="index" :label="item.typeNm" :value="item.typeNm"></vue-option>
    				</vue-select>
				</vue-form-item>
				<vue-form-item prop="productId" label="产品ID">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.productId" :maxlength="32"></vue-input>
				</vue-form-item>
				<vue-form-item prop="productNm" label="产品名称">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.productNm" :maxlength="32"></vue-input>
				</vue-form-item>
				<vue-form-item prop="hotSalePlace" label="热销地">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.hotSalePlace" :maxlength="24"></vue-input>
				</vue-form-item>
				<vue-form-item prop="productPlace" label="主要产地">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.productPlace" :maxlength="24"></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeDate" label="年月">
					<vue-date-picker v-model="furnitureHotSaleTradeDataDtform.tradeDate" type="month" format="yyyy-MM" placeholder="请选择" :maxlength="7"></vue-date-picker>
				</vue-form-item>
				<vue-form-item prop="tradeVolume" label="交易额">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeVolume" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeAmazon" label="交易额-亚马逊">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeAmazon" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeAli" label="交易额-阿里">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeAli" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeWish" label="交易额-wish">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeWish" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeEbay" label="交易额-ebay">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeEbay" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeOthers" label="交易额-其他">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeOthers" :cleave="{numeral:true,}" :maxlength="12"></vue-input>
				</vue-form-item>
			</vue-form>
			<span slot="footer">
    			<vue-button @click="aside_dig = false">取消</vue-button>
    			<vue-button type="primary" @click="onNewOrModifyFurnitureHotSaleTradeData('furnitureHotSaleTradeDataDtform')">确认</vue-button>
  			</span>
		</vue-aside>
	</div>
	<jsp:include page="furnitureHotSaleTradeDataJs.jsp" />
</body>
</html>