<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	typeNm:'',
        	typeNmOptions:[],
        	furnitureTypesInfoData:[],
        	aside_dig: false,
        	furnitureTypesDtform: {
        		typeId: '',
        		typeNm: '',
			},
        }
    },
    methods: {
    	
    	// 获取家具种类下拉框选项
    	getTypeNmList: function() {
    		
    		var self = this;
			this.$http.post(contextPath + '/dataMantance/furnitureTypesInfo/getTypeNmOptions', {}).then(function(response) {
				self.typeNmOptions = response.body;
			}, function(response) {
				console.log(response.body.reason);
			});
    	},
    	
    	getTableList: function() {
    		var self = this;
			self.$http.post(contextPath + '/dataMantance/furnitureTypesInfo/getFurnitureTypesInfoData', {
				"typeNm":self.typeNm
			}).then(function(response) {
				self.furnitureTypesInfoData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	}, 
    	
    	onRetrieve: function() {
    		this.getTableList();
    	},
    	
    	// 新增按钮
		onAddFurnitureType: function() {
			var self = this;
			self.aside_dig = true;
			self.$refs.furnitureTypesDtform.resetFields();
		},
		
		onNewOrModifyFurnitureType: function(eshopdtform) {
			var self = this;
			self.confirmNewOrModifyFurnitureType(self);
		},
		
		confirmNewOrModifyFurnitureType: function(self) {
			debugger
			var form = self.furnitureTypesDtform;
			self.$http.post(contextPath + "/dataMantance/furnitureTypesInfo/newOrModifyFurnitureType" , {
				 "typeId": form.typeId
			   , "typeNm":form.typeNm
			}).then(function(response) {
// 				if (typeof(onAfterSaveUserCallback) != "undefined") {
// 					var actionType = self.userdtlform.userId != null && self.userdtlform.userId.trim() != "" ? "update" : "insert";
// 					onAfterSaveUserCallback({
// 						  "actionType": actionType
// 						, "userData": JSON.stringify(self.userdtlform)
// 						, "userRoleData":JSON.stringify(self.userdtlform.userRoleData)
// 						, "extendList": JSON.stringify(self.userdtlform.extendList)
// 						, "newExtendProps": JSON.stringify(self.newExtendProps)
// 					});
// 				}
				self.aside_dig = false;
				setTimeout(function() {
					self.onRetrieve();
				}, 500);
			},function(e){
				unlock(self);
			});

		},
		
    	// 修改行数据
		onEditRow: function(row) {
			var self = this;
			debugger
			self.$http.post(contextPath + "/dataMantance/furnitureTypesInfo/getFurnitureTypesDetail", {
				"typeId": row.typeId
			}).then(function(response) {
				var respData = response.data;
				self.furnitureTypesDtform.typeId = respData.typeId;
				self.furnitureTypesDtform.typeNm = respData.typeNm;

				self.aside_dig = true;
			},function(e) {

				unlock(self);
			});
		},
		
		// 删除行数据
		onDelRow: function(row) {
			var self = this;
			self.$confirm({
				message: "确认删除该笔数据吗",
				confirmButtonText: "确认",
				cancelButtonText: "取消",
			}).then(function() {
				self.onConfirmUpdFurnitureType(self, row.typeId);
			}).catch(function() {
				return false;
			});
		},
		
		onConfirmUpdFurnitureType: function(self, typeId) {
			self.$http.post(contextPath + "/dataMantance/furnitureTypesInfo/deleteFurnitureTypes", {
				"typeId": typeId, 
				}).then(function(response) {
				setTimeout(function() {
					self.onRetrieve();
				}, 500);
			},function(e) {
				unlock(self);
			});
		},

    },
    
    mounted: function() {
    	var self = this;
    	self.getTypeNmList();
    	self.getTableList();
    },
    
}).$mount("#app")
</script>