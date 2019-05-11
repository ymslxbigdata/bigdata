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
				<vue-input :placeholder="'2018'" size="200"></vue-input>
			</div>
			<div class="filter-item">
				<vue-input :placeholder="'第一季度'"></vue-input>
			</div>
			<div class="filter-item">
				<vue-input :placeholder="'一月份'"></vue-input>
			</div>
			<div class="filter-text">
				<span>产品类型:</span>
			</div>
			<div class="filter-item">
				<vue-select></vue-select>
			</div>
		</div>
	</vue-row>

	<vue-row class="detail-area">
		<vue-col :span="16" class="height-100">
			<div id="wordMap" class="map-panel">
				<iframe class="map-frame" :src="mapUrl"></iframe>
			</div>
		</vue-col>
		<vue-col :span="8" class="data-panel-container">
			<div class="flex-1 background-color-1A2960 margin5 large-div-title">
				<span id="warehouse-cnt-span-id">海外仓个数: {{ warehouseCnt }}</span>
			</div>
			<div class="flex-5 background-color-1A2960 margin5">
				<vue-table :data="wareHouseData" :height="tableHeight">
					<vue-table-column prop="" label=""></vue-table-column>

				</vue-table>
			</div>
		</vue-col>
	</vue-row>
</div>
<jsp:include page="overseasTradeJs.jsp" />
</body>
</html>