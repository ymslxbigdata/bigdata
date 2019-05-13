<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" class="background-color-0D1633">
		<vue-row class="first-class-title">
			<div class="padding-top-1">
				<span>全球跨境电商交易大数据</span>
			</div>
		</vue-row>

		<vue-row class="second-class-title">
			<div class="margin-left10 width-50" >
				<div class="filter-text">
					<span>统计时间:</span>
				</div>
				<div class="filter-item">
					<vue-select v-model="filterYear" clearable>
						<vue-option v-for="year in years" :key="year.text" :label="year.text" :value="year.text"></vue-option>
					</vue-select>
				</div>
				<div class="filter-item">
					<vue-select v-model="filterQuarter" clearable>
						<vue-option v-for="quarter in quarters" :key="quarter.index" :label="quarter.text" :value="quarter.index"></vue-option>
					</vue-select>
				</div>
				<div class="filter-item">
					<vue-select v-model="filterMonth" clearable>
						<vue-option v-for="month in months" :key="month.index" :label="month.text" :value="month.index"></vue-option>
					</vue-select>
				</div>
				<div class="filter-text">
					<span>产品类型:</span>
				</div>
				<div class="filter-item">
					<vue-select v-model="selectedFurnitureTypeId" clearable>
						<vue-option v-for="type in furnitureTypeList" :key="type.typeId" :label="type.typeNm" :value="type.typeId"></vue-option>
					</vue-select>
				</div>
			</div>
		</vue-row>

		<vue-row class="detail-area">
			<vue-col :span="12" class="height-100">
				<div id="worldMap" class="map-panel">
					<iframe class="map-frame" :src="mapUrl"></iframe>
				</div>
			</vue-col>

			<vue-col :span="12" class="data-panel-container">
				<div class="data-panel">
					<div class="table-headers">
						<span>热销产品各平台交易数据</span>
					</div>
					<vue-table :data="hotSellingOnPlatforms" :height="tableHeight" customTableBorder="0">
						<vue-table-column align="center" prop="productNm" label="热销产品"></vue-table-column>
						<vue-table-column align="center" prop="tradeAmazon" label="亚马逊"></vue-table-column>
						<vue-table-column align="center" prop="tradeEbay" label="eBay"></vue-table-column>
						<vue-table-column align="center" prop="tradeWish" label="wish"></vue-table-column>
						<vue-table-column align="center" prop="tradeAli" label="阿里巴巴"></vue-table-column>
						<vue-table-column align="center" prop="tradeOthers" label="其他"></vue-table-column>
						<vue-table-column align="center" prop="tradeVolume" label="总交易额"></vue-table-column>
					</vue-table>
					</iframe>
				</div>
				<div class="flex-1">
					<vue-col :span="12" class="height-100">
						<div class="data-panel">
							<div class="table-headers">
								<span>各类产品交易情况</span>
							</div>
<<<<<<< HEAD
							<vue-table :data="productTradingSituation" :height="tableHeight" customTableBorder="0">
								<vue-table-column align="center" prop="prodName" label="热销产品"></vue-table-column>
								<vue-table-column align="center" prop="turnover" label="交易额"></vue-table-column>
								<vue-table-column align="center" prop="territories" label="热销地"></vue-table-column>
								<vue-table-column align="center" prop="producingArea" label="主要产地"></vue-table-column>
=======
							<vue-table :data="productTradingSituation" :height="tableHeight">
								<vue-table-column align="center" prop="productNm" label="热销产品"></vue-table-column>
								<vue-table-column align="center" prop="tradeVolume" label="交易额"></vue-table-column>
								<vue-table-column align="center" prop="hotSalePlace" label="热销地"></vue-table-column>
								<vue-table-column align="center" prop="productPlace" label="主要产地"></vue-table-column>
>>>>>>> 0d70a114757506ee9dd37c10d4b8397a92d728a4
							</vue-table>
						</div>
					</vue-col>
					<vue-col :span="12" class="height-100">
						<div class="data-panel height-100-10">
							<div class="table-headers">
								<span>热销品牌排行</span>
							</div>
							<iframe id="hotBrandRanking" class="chart-frame" :src="hotBrandRanking"></iframe>
						</div>
					</vue-col>
				</div>
				<div class="data-panel">
					<div class="table-headers">
						<span>各地区跨境电商平台家具产品交易额(亿美元)</span>
					</div>
					<iframe id="areaPlatformFurnitureSales" class="chart-frame" :src="areaPlatformFurnitureSales"></iframe>
				</div>
			</vue-col>

		</vue-row>
	</div>
	<jsp:include page="furnitureTradeJs.jsp" />
</body>
</html>