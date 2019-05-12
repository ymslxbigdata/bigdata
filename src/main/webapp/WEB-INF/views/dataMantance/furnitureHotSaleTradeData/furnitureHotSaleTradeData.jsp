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
    			<vue-select clearable filterable placeholder="请选择" v-model="typeNm">
      				<vue-option v-for="(item,index) in typeNmOptions" :key="index" :label="item.typeNm" :value="item.typeNm"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item label="产品名称">
				<vue-input v-model="productNm" ></vue-input>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="onRetrieve">查询</vue-button>
  			</vue-form-item>
			<vue-form-item>
    			<vue-button type="primary" @click="onAddFurnitureHotSaleTradeData">新增</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="furnitureHotSaleTradeData" border stripe show-foot >
		<vue-table-column type="index" width="64" align="center" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="saleTradeId" label="热销交易ID" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="typeId" label="种类ID"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="typeNm" label="种类名"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="productId" label="产品ID"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="productNm" label="产品名称"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="hotSalePlace" label="热销地"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="productPlace" label="主要产地"  show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="tradeDate" label="年月"  show-overflow-tooltip></vue-table-column>
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
		<vue-aside v-model="aside_dig" id="aside_id" close-on-click-modal>
			<!-- title area -->
			<div class="aside-note">
				<vue-row>
					<vue-col :span="12">
						<div align="left">家具热销种类交易数据详细信息</div>
					</vue-col>
					<vue-col :span="12">
						<span class="button-group">
							<vue-button type="primary" size="small" class="icon-ok" @click="onNewOrModifyFurnitureHotSaleTradeData('furnitureHotSaleTradeDataDtform')">保存</vue-button>
						</span>
					</vue-col>
				</vue-row>	
			</div>
			<vue-form :model="furnitureHotSaleTradeDataDtform" ref="furnitureHotSaleTradeDataDtform" label-width="140px" style="padding: 15px">
				<vue-form-item prop="saleTradeId" label="热销交易ID">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.saleTradeId" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="typeId" label="种类ID">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.typeId" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="typeNm" label="种类名">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.typeNm" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="productId" label="产品ID">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.productId" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="productNm" label="产品名称">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.productNm" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="hotSalePlace" label="热销地">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.hotSalePlace" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="productPlace" label="主要产地">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.productPlace" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeDate" label="年月">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeDate" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeVolume" label="交易额">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeVolume" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeAmazon" label="交易额-亚马逊">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeAmazon" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeAli" label="交易额-阿里">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeAli" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeWish" label="交易额-wish">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeWish" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeEbay" label="交易额-ebay">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeEbay" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="tradeOthers" label="交易额-其他">
					<vue-input v-model="furnitureHotSaleTradeDataDtform.tradeOthers" ></vue-input>
				</vue-form-item>
			</vue-form>
		</vue-aside>
	</div>
	<jsp:include page="furnitureHotSaleTradeDataJs.jsp" />
</body>
</html>