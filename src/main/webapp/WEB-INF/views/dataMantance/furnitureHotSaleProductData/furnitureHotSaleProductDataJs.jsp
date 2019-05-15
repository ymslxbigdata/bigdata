<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	
        	brandId: '',
        	brandNm: '',
        	tableHeight: document.body.clientHeight - 105,
        	furnitureHotSaleProductData: [],
        	currentData: {},
        	currentIndex: 0,
        	
        	showAside: false,
        	
        	disabledAsideBrandId: false,
        	disabledAsideBrandNm: false,
        	
        	showDialog: false,
        	currentDataRules: {
        		brandId: [
	              { required: true, message: "请输入品牌ID"},
	            ],
	            brandNm: [
	              { required: true, message: "请输入品牌名称"},
	            ],
          	},
        }
    },
    methods: {
    	
    	getTableList: function() {
    		var self = this;
			var brandId = self.brandId;
			var brandNm = self.brandNm;
			this.$http.post(contextPath + '/dataMantance/furnitureHotSaleProductData/getFurnitureHotSaleProductData', {"brandId":brandId,"brandNm":brandNm}).then(function(response) {
				self.furnitureHotSaleProductData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	},
    	
    	changeCondition: function() {
    		this.furnitureHotSaleProductData = [];
    	},
    	
    	searchDataHandle: function() {
    		this.getTableList();
    	},
    	
    	editInsertHandle: function(rowData,handleType) {
    		
    		this.showAside = true;
    		
    		if(handleType == 'edit') {
    			
    			this.currentData = VueUtil.merge({}, rowData);
    			this.currentIndex = this.furnitureHotSaleProductData.indexOf(rowData);
    			
    			this.disabledAsideBrandId = true;
        		this.disabledAsideBrandNm = true;
    		}
    		else {
    			
    			this.currentData = {};
    			this.disabledAsideBrandId = false;
        		this.disabledAsideBrandNm = false;
    		}
        },
        
        deleteHandle: function(rowData) {
        	this.showDialog = true;
        	this.currentData = VueUtil.merge({}, rowData);
        },
    	
    	editInsertSaveHandle: function(currentData) {
    		var self = this;
    		var form = self.currentData;
    		self.$refs[currentData].validate(function(valid) {
				if (!valid) {
					return false;
				} else {
					var updFlag = true;
					self.furnitureHotSaleProductData.forEach(function(row) {
						if(self.disabledAsideBrandId == false && form.brandId == row.brandId) {
							updFlag = false;
							return false;
						}
					});
					if(updFlag) {
						self.$http.post(contextPath + '/dataMantance/furnitureHotSaleProductData/saveData', self.currentData).then(function(response) {
		     			self.getTableList();
		     			self.showAside = false;
		     			self.$notify({title: "Success", message: "保存成功",type: "success",position: "bottom-right",duration:1500});
						},function(e){
							unlock(self);
						});
					} else {
						self.$notify({ title: "Error", message: "数据已经存在，请重新输入",type: "error",position: "bottom-right",duration:1500});
					}
				}
			});
//     		var self = this;
//     		this.$http.post(contextPath + '/dataMantance/furnitureHotSaleProductData/saveData', self.currentData).then(function(response) {
//     			self.getTableList();
//     			self.showAside = false;
//     			this.$notify({title: "Success", message: "保存成功",type: "success",position: "bottom-right",duration:1500});
// 			}, function(response) {
// 				console.log(response.body.reason);
// 			});
    	},
    	
    	deleteSaveHandle: function() {
    		
    		this.showDialog = false;
    		var self = this;
    		this.$http.post(contextPath + '/dataMantance/furnitureHotSaleProductData/deleteData', self.currentData).then(function(response) {
    			self.getTableList();
    			self.showAside = false;
    			this.$notify({title: "Success", message: "删除成功",type: "success",position: "bottom-right",duration:1500});
			}, function(response) {
				console.log(response.body.reason);
			});
    	},
    	
    	importHandle: function() {
    		
    	},
    	
    	exportHandle: function() {
    		
    	},
    },
    
    mounted: function() {
    	var self = this;
    	self.searchDataHandle();
    },
    
}).$mount("#app")
</script>