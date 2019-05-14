<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	typeNm:'',
        	typeNmOptions:[],
        	furnitureTypesInfoData:[],
        	tableHeight: document.body.clientHeight - 105,
        	aside_dig: false,
        	furnitureTypesDtform: {
        		typeId: '',
        		typeNm: '',
			},
			disabledAsideKey: false,
			furnitureTypesDtformRules: {
				typeId: [
	              { required: true, message: "请输入家具种类ID"},
	            ],
	            typeNm: [
	              { required: true, message: "请输入家具种类名称"},
	            ],
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
    	
		// 清空条件部
    	changeCondition: function() {
    		this.furnitureTypesInfoData = [];
    	},
    	
    	// 新增按钮
		onAddFurnitureType: function() {
			var self = this;
			self.aside_dig = true;
			self.disabledAsideKey = false;
			self.$refs.furnitureTypesDtform.resetFields();
		},
		
		onNewOrModifyFurnitureType: function(eshopdtform) {
			var self = this;
// 			self.confirmNewOrModifyFurnitureType(self);
			var form = self.furnitureTypesDtform;
			self.$http.post(contextPath + "/dataMantance/furnitureTypesInfo/newOrModifyFurnitureType" , {
				 "typeId": form.typeId
			   , "typeNm":form.typeNm
			}).then(function(response) {
				self.aside_dig = false;
				this.$notify({title: "Success", message: "保存成功",type: "success",position: "bottom-right",duration:1500});
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
			self.disabledAsideKey = true;
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
				message: "确认删除该笔数据吗？",
				confirmButtonText: "确认",
				cancelButtonText: "取消",
			}).then(function() {
				self.$http.post(contextPath + "/dataMantance/furnitureTypesInfo/deleteFurnitureTypes", {
					"typeId": row.typeId, 
				}).then(function(response) {
					setTimeout(function() {
						self.onRetrieve();
					}, 500);
					self.$notify({title: "Success", message: "删除成功",type: "success",position: "bottom-right",duration:1500});
				},function(e) {
					unlock(self);
				});
			}).catch(function() {
				return false;
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