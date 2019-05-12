<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" style="height: 100%" v-cloak>
		<vue-form inline>
  			<vue-form-item label="家具种类名">
    			<vue-select clearable filterable placeholder="请选择" v-model="typeNm">
      				<vue-option v-for="(item,index) in typeNmOptions" :key="index" :label="item.typeNm" :value="item.typeNm"></vue-option>
    			</vue-select>
  			</vue-form-item>
  			<vue-form-item>
    			<vue-button type="primary" @click="onRetrieve">查询</vue-button>
  			</vue-form-item>
			<vue-form-item>
    			<vue-button type="primary" @click="onAddFurnitureType">新增</vue-button>
  			</vue-form-item>
		</vue-form>
		<vue-table :data="furnitureTypesInfoData" border stripe show-foot >
		<vue-table-column type="index" width="64" align="center" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="typeId" label="种类ID" show-overflow-tooltip></vue-table-column>
  			<vue-table-column prop="typeNm" label="种类名"  show-overflow-tooltip></vue-table-column>
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
						<div align="left"> 家具种类详细信息</div>
					</vue-col>
					<vue-col :span="12">
						<span class="button-group">
							<vue-button type="primary" size="small" class="icon-ok" @click="onNewOrModifyFurnitureType('furnitureTypesDtform')">保存</vue-button>
						</span>
					</vue-col>
				</vue-row>	
			</div>
			<vue-form :model="furnitureTypesDtform" ref="furnitureTypesDtform" label-width="140px" style="padding: 15px">
				<vue-form-item prop="typeId" label="电商ID">
					<vue-input v-model="furnitureTypesDtform.typeId" ></vue-input>
				</vue-form-item>
				<vue-form-item prop="typeNm" label="种类名">
					<vue-input v-model="furnitureTypesDtform.typeNm" ></vue-input>
				</vue-form-item>
			</vue-form>
		</vue-aside>
	</div>
	<jsp:include page="furnitureTypesInfoJs.jsp" />
</body>
</html>