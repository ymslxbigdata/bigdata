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
				<div class="time-filter-text">
					<span>统计时间:</span>
				</div>
				<div class="time-filter-item">
					<vue-input :placeholder="'2018'" size="200"></vue-input>
				</div>
				<div class="time-filter-item">
					<vue-input :placeholder="'第一季度'"></vue-input>
				</div>
				<div class="time-filter-item">
					<vue-input :placeholder="'一月份'"></vue-input>
				</div>
			</div>
		</vue-row>

		<vue-row class="detail-area">
			<vue-col :span="6" class="data-panel-container">

				<div class="data-panel">
                    <div class="table-headers">
                        <span>发展中国家</span>
                    </div>
					<vue-table :data="developingCountry" class="width-100" :height="tableHeight">
						<vue-table-column prop="platForm" label="平台"></vue-table-column>
						<vue-table-column prop="userCnt" align="right" label="用户数"></vue-table-column>
						<vue-table-column prop="totalSales" align="right" label="总销售额"></vue-table-column>
					</vue-table>
				</div>

				<div class="data-panel">
                    <div class="table-headers">
                        <span>发达国家</span>
                    </div>
                    <vue-table :data="developedCountry" class="width-100" :height="tableHeight">
                        <vue-table-column prop="platForm" label="平台"></vue-table-column>
                        <vue-table-column prop="userCnt" align="right" label="用户数"></vue-table-column>
                        <vue-table-column prop="totalSales" align="right" label="总销售额"></vue-table-column>
                    </vue-table>
                </div>
			</vue-col>

			<vue-col :span="12" class="height-100">
				<div id="wordMap" class="map-panel">
					<iframe class="map-frame" :src="mapUrl"></iframe>
				</div>
			</vue-col>

			<vue-col :span="6" class="data-panel-container">
				<div class="data-panel">
					<div class="table-headers">
						<span>各区域跨境电商平台交易额(亿美元)</span>
					</div>
					<iframe class="chart-frame" :src="xBorderTotalSalesUrl">
					</iframe>
				</div>
				<div class="data-panel">
					<div class="table-headers">
						<span>主流跨境电商平台交易额(亿美元)</span>
					</div>
					<iframe class="chart-frame" :src="mainStreamTotalSalesUrl"></iframe>

				</div>
				<div class="data-panel">
					<div class="table-headers">
						<span>主流跨境电商平台用户数(万)</span>
					</div>
						<iframe class="chart-frame" :src="mainStreamUserCnt"></iframe>
				</div>
			</vue-col>

		</vue-row>


	</div>
	<jsp:include page="globalTradeJs.jsp" />
</body>
</html>