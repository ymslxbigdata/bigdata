<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" class="background-color-0D1633" v-cloak>
		<vue-row class="first-class-title">
			<div class="padding-top-1">
				<span>中国南康家具全球跨境电商交易大数据</span>
			</div>
		</vue-row>
		<vue-row class="second-class-title">
			<div class="margin-left10 width-100-10" >
				<div class="filter-text">
					<span>统计时间:</span>
				</div>
				<div class="filter-item">
					<vue-select customBgColor='blue' v-model="filterYear">
						<vue-option v-for="year in years" :key="year.text" :label="year.text" :value="year.text"></vue-option>
					</vue-select>
				</div>
				<div class="filter-item">
					<vue-input customBgColor='blue' v-model="filterQuarter" readonly></vue-input>
				</div>
				<div class="filter-item">
					<vue-select v-model="filterMonth" customBgColor='blue'>
						<vue-option v-for="month in months" :key="month.index" :label="month.text" :value="month.index"></vue-option>
					</vue-select>
				</div>
				<div class="time-panel"> {{curDate}} {{curTime}}</div>
			</div>
		</vue-row>
		<vue-row class="detail-area">
			<vue-col :span="6" class="data-panel-container">
				<div class="data-panel">
                    <div class="table-headers">
                        <span>发展中国家</span>
                    </div>
					<vue-table :data="developingCountryData" class="width-100" stripe :height="tableHeight" customTableBorder="0">
						<vue-table-column align="center" prop="platForm" label="平台"></vue-table-column>
						<vue-table-column align="center" prop="userCnt" align="right" label="用户数"></vue-table-column>
						<vue-table-column align="center" prop="totalSales" align="right" label="总交易额"></vue-table-column>
					</vue-table>
				</div>
				<div class="data-panel">
                    <div class="table-headers">
                        <span>发达国家</span>
                    </div>
                    <vue-table :data="developedCountryData" class="width-100" stripe :height="tableHeight" customTableBorder="0">
                        <vue-table-column align="center" prop="platForm" label="平台"></vue-table-column>
                        <vue-table-column align="center" prop="userCnt" align="right" label="用户数"></vue-table-column>
                        <vue-table-column align="center" prop="totalSales" align="right" label="总交易额"></vue-table-column>
                    </vue-table>
                </div>
			</vue-col>
			<vue-col :span="12" class="height-100">
				<div id="worldMap" class="map-panel">
					<div id="map-statistics">
						<p>
							跨境电商平台用户数:&nbsp;
							<span>{{ eshopUserCnt }}</span>
							&nbsp;&nbsp;
							跨境电商平台交易总额:&nbsp;
							<span>{{ eshopTotalSales }}&nbsp;美元</span>
						</p>
					</div>
					<iframe class="map-frame" :src="mapUrl"></iframe>
				</div>
			</vue-col>
			<vue-col :span="6" class="data-panel-container">
				<div class="data-panel">
					<div class="table-headers">
						<span>各区域跨境电商平台交易额(美元)</span>
					</div>
					<iframe id="xBorderTotalSales" class="chart-frame" :src="xBorderTotalSalesUrl"></iframe>
				</div>
				<div class="data-panel">
					<div class="table-headers">
						<span>主流跨境电商平台交易额(美元)</span>
					</div>
					<iframe id="mainStreamTotalSales" class="chart-frame" :src="mainStreamTotalSalesUrl"></iframe>
				</div>
				<div class="data-panel">
					<div class="table-headers">
						<span>主流跨境电商平台用户数(万)</span>
					</div>
					<iframe id="mainStreamUserCnt" class="chart-frame" :src="mainStreamUserCntUrl"></iframe>
				</div>
			</vue-col>
		</vue-row>
	</div>
	<jsp:include page="globalTradeJs.jsp" />
</body>
</html>