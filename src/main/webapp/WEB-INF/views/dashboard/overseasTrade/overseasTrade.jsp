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
			<span>全球跨境电商海外仓大数据</span>
		</div>
	</vue-row>

	<vue-row class="second-class-title">
		<div class="margin-left10 width-50" >
			<div class="filter-text">
				<span>电商平台:</span>
			</div>
			<div class="filter-item">
				<vue-select customBgColor='blue' v-model="filterPlatForm" placeholder="全部" clearable>
					<vue-option v-for="platForm in platFormList" :key="platForm.eshopId" :label="platForm.eshopNm" :value="platForm.eshopId" ></vue-option>
				</vue-select>
			</div>
		</div>
	</vue-row>

	<vue-row class="detail-area">
		<vue-col :span="16" class="height-100">
			<div id="worldMap" class="map-panel">
				<iframe class="map-frame" :src="mapUrl"></iframe>
			</div>
		</vue-col>
		<vue-col :span="8" class="data-panel-container">
			<div class="flex-1 background-color-1A2960 margin5 large-div-title border-1px-solid-black">
				<span id="warehouse-cnt-span-id">海外仓个数: {{ warehouseCnt }}</span>
			</div>
			<div id="ware-house-data-div" class="data-panel flex-5">
				<vue-table :data="wareHouseData" :height="tableHeight" stripe customTableBorder="0">
					<vue-table-column align="center" prop="eshopNm" label="所属平台"></vue-table-column>
					<vue-table-column align="center" prop="overseasRepo" label="海外仓"></vue-table-column>
					<vue-table-column align="center" prop="capacity" label="容量(立方)"></vue-table-column>
					<vue-table-column align="center" prop="totalStock" label="库存"></vue-table-column>
					<vue-table-column align="center" prop="useabelStock" label="可用库存"></vue-table-column>
				</vue-table>
			</div>
		</vue-col>
	</vue-row>
</div>
<jsp:include page="overseasTradeJs.jsp" />
</body>
</html>