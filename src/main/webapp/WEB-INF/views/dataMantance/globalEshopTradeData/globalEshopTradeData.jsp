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
    			<vue-select clearable filterable placeholder="请选择" v-model="eshop">
      				<vue-option v-for="(item,index) in eshopOptions" :label="item.eshopNm" :value="item.eshopNm"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item label="月份">
    			<vue-select clearable filterable placeholder="选择" v-model="month">
      				<vue-option v-for="(item,index) in monthOptions" :label="item.label" :value="item.value"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="searchDataHandle()">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="globalEshopTradeData" border stripe show-foot >
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
     				 <vue-button @click="" type="primary" size="small" icon="vue-icon-edit"></vue-button>
      				 <vue-button @click="" type="primary" size="small" icon="vue-icon-delete2"></vue-button>
    			</template>
  			</vue-table-column>
		</vue-table>
	</div>
	<jsp:include page="globalEshopTradeDataJs.jsp" />
</body>
</html>