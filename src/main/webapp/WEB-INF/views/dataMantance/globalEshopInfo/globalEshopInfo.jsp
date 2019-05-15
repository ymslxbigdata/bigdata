<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" style="height: 100%" v-cloak>
		<vue-form inline>
  			<vue-form-item label="电商ID">
    			<vue-input v-model="eshopId" :maxlength="24" @change="changeCondition"></vue-input>
  			</vue-form-item>
  			<vue-form-item label="电商名称">
    			<vue-input v-model="eshopNm" :maxlength="32" @change="changeCondition"></vue-input>
  			</vue-form-item>
  			<vue-form-item label="所属国家">
    			<vue-select clearable filterable placeholder="请选择" v-model="countryNm" @change="changeCondition">
      				<vue-option v-for="(item,index) in countryOptions" :label="item.countryNm" :value="item.countryNm" :key="index"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="onRetrieve">查询</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="globalEshopInfoData" :height="tableHeight" border stripe show-foot>
			<vue-table-column type="index" width="64" align="center" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="eshopId" label="电商ID" width="100" show-overflow-tooltip></vue-table-column> 
			<vue-table-column prop="eshopNm" label="电商名称" width="120" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="countryNm" label="所属国家" width="120" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="address" label="公司地点" width="180" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="locationX" label="经度" width="100" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="locationY" label="纬度" width="100" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="establishedDate" label="成立时间" width="145" align="center" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="briefIntroduction" label="公司简介" width="150" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="detailsIntroduction" label="公司详情" width="200" show-overflow-tooltip></vue-table-column>
			<vue-table-column prop="isMainEshop" label="是否主流电商平台" width="150" align="center" show-overflow-tooltip :formatter="formateBooleanData"></vue-table-column>
			<vue-table-column label="操作" fixed="right" align="center" width="130">
				<template slot-scope="props">
					<vue-button @click="onEditRow(props.row)" type="text" icon="vue-icon-edit" title="编辑" ></vue-button>
					<vue-button @click="onDelRow(props.row)" type="text" icon="vue-icon-delete" title="删除"></vue-button>
				</template>
			</vue-table-column>
		</vue-table>
		<vue-form inline style="margin-top:10px">
			<vue-form-item>
				<vue-button type="primary" @click="onAddEshop" >添加</vue-button>
			</vue-form-item>
		</vue-form>
		<vue-aside v-model="aside_dig" id="aside_id" title="编辑数据" close-on-click-modal>
			<vue-form :model="eshopdtform" ref="eshopdtform" :rules="eshopdtformRules" label-width="130px" style="padding: 15px">
				<vue-form-item prop="eshopId" label="电商ID" >
					<vue-input v-model="eshopdtform.eshopId" :maxlength="24" :disabled="disabledAsideKey"></vue-input>
				</vue-form-item>
				<vue-form-item prop="eshopNm" label="电商名称" >
					<vue-input v-model="eshopdtform.eshopNm" :maxlength="32" :disabled="disabledAsideKey"></vue-input>
				</vue-form-item>
				<vue-form-item prop="countryNm" label="所属国家" >
						<vue-select clearable filterable placeholder="请选择" v-model="eshopdtform.countryNm">
      				<vue-option v-for="(item,index) in countryOptions" :label="item.countryNm" :value="item.countryNm" :key="index"></vue-option>
    			</vue-select>
				</vue-form-item>
				<vue-form-item prop="address" label="公司地点">
					<vue-input v-model="eshopdtform.address" :maxlength="64"></vue-input>
				</vue-form-item>
				<vue-form-item prop="locationX" label="经度">
					<vue-input v-model="eshopdtform.locationX" :maxlength="9"></vue-input>
				</vue-form-item>
				<vue-form-item prop="locationY" label="纬度">
					<vue-input v-model="eshopdtform.locationY" :maxlength="9"></vue-input>
				</vue-form-item>
				<vue-form-item prop="establishedDate" label="成立时间">
				<vue-date-picker v-model="eshopdtform.establishedDate" type="date" placeholder="请选择时间" :picker-options="establishedDatepickerOptions"></vue-date-picker>
				</vue-form-item>
				<vue-form-item prop="briefIntroduction" label="公司简介">
					<vue-input v-model="eshopdtform.briefIntroduction" :maxlength="200"></vue-input>
				</vue-form-item>
				<vue-form-item prop="detailsIntroduction" label="公司详情">
					<vue-input v-model="eshopdtform.detailsIntroduction" :maxlength="200"></vue-input>
				</vue-form-item>
				<vue-form-item prop="isMainEshop" label="是否主流电商平台">
				<vue-switch v-model="eshopdtform.isMainEshop" on-text="Open" off-text="off" :width="70" ></vue-switch>
				</vue-form-item>
			</vue-form>
			<span slot="footer">
    			<vue-button @click="aside_dig = false">取消</vue-button>
    			<vue-button type="primary" @click="onNewOrModifyEshop('eshopdtform')">确认</vue-button>
  			</span>
		</vue-aside>
	</div>
	<jsp:include page="globalEshopInfoJs.jsp"/>
</body>
</html>