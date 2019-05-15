<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	
        	month: '',
        	furnitureAreaSaleTradeData: [],
        	tableHeight: document.body.clientHeight - 105,
        	currentData: {},
        	currentIndex: 0,
        	
        	showAside: false,
        	showAsideEshopId: false,
        	
        	disabledAsideEshopNm: false,
        	disabledAsideTradeDate: false,
        	
        	showDialog: false,
        	currentDataRules: {
	            tradeDate: [
	              { required: true, message: "请输入年月"},
	            ],
          	},
          	//Excel上传路径
            uploadUrl: contextPath + '/dataMantance/furnitureAreaSaleTradeData/importExcel',
            downloadUrl: contextPath + '/dataMantance/furnitureAreaSaleTradeData/export',
        }
    },
    methods: {
    	
    	getTableList: function() {
    		var self = this;
			var eshopId = self.eshopId;
			var month = VueUtil.formatDate(self.month,"yyyy-MM");
			this.$http.post(contextPath + '/dataMantance/furnitureAreaSaleTradeData/getFurnitureAreaSaleTradeData', {"tradeDate":month}).then(function(response) {
				self.furnitureAreaSaleTradeData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	},
    	
    	changeCondition: function() {
    		this.furnitureAreaSaleTradeData = [];
    	},
    	
    	searchDataHandle: function() {
    		this.getTableList();
    	},
    	
    	editInsertHandle: function(rowData,handleType) {
    		
    		this.showAside = true;
    		
    		if(handleType == 'edit') {
    			this.currentData = VueUtil.merge({}, rowData);
    			this.currentIndex = this.furnitureAreaSaleTradeData.indexOf(rowData);
        		this.disabledAsideTradeDate = true;
    		}
    		else {
    			this.currentData = {tradeDate:''};
    			this.disabledAsideTradeDate = false;
    		}
        },
        
        deleteHandle: function(rowData) {
        	this.showDialog = true;
        	this.currentData = VueUtil.merge({}, rowData);
        },
    	
    	editInsertSaveHandle: function(currentData) {
    	
    		var self = this;
    		this.currentData.tradeDate = VueUtil.formatDate(this.currentData.tradeDate,"yyyy-MM");
			var form = self.currentData;
			self.$refs[currentData].validate(function(valid) {
				if (!valid) {
					return false;
				} else {
					var updFlag = true;
					self.furnitureAreaSaleTradeData.forEach(function(row) {
						debugger
						if(self.disabledAsideTradeDate == false && form.tradeDate == row.tradeDate) {
							updFlag = false;
							return false;
						}
					});
					if(updFlag) {
						self.$http.post(contextPath + '/dataMantance/furnitureAreaSaleTradeData/saveData', form).then(function(response) {
		     			self.getTableList();
		     			self.showAside = false;
		     			self.$notify({title: "Success", message: "保存成功",type: "success",position: "bottom-right",duration:1500});
			 				setTimeout(function() {
			 					self.onRetrieve();
			 				}, 500);
						},function(e){
							unlock(self);
						});
					} else {
						self.$notify({ title: "Error", message: "数据已经存在，请重新输入",type: "error",position: "bottom-right",duration:1500});
					}
				}
			});
    	},
    	
    	deleteSaveHandle: function() {
    		
    		this.showDialog = false;
    		var self = this;
    		this.$http.post(contextPath + '/dataMantance/furnitureAreaSaleTradeData/deleteData', self.currentData).then(function(response) {
    			self.getTableList();
    			self.showAside = false;
    			this.$notify({title: "Success", message: "删除成功",type: "success",position: "bottom-right",duration:1500});
			}, function(response) {
				console.log(response.body.reason);
			});
    	},
    	
    	//验证是否是xls文件
        beforeAvatarUpload: function (file) {
        	
        	var isXls = file.type === "application/vnd.ms-excel";
        	var isXlsx = file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";

        	if (!isXls && !isXlsx) {
        		errorMsg("请选择.xls或.xlsx格式的文档");
        		return false;
        	} else {
        		return true;
        	}
        },
        
      	//excel上传成功
        uploadSuccessHandle: function (response) {
        	var self = this;
        	self.$notify({title: "Success", message: "导入成功",type: "success",position: "bottom-right",duration:1500});
        	self.getTableList();
        },
        
      	//excel上传失败
        uploadErrorHandle: function (response) {
        	var self = this;
        	self.$notify({title: "Error", message: "导入失败",type: "error",position: "bottom-right",duration:1500});
        	errorMsg(response.body.reason);
        },
    },
    
    mounted: function() {
    	var self = this;
    	self.searchDataHandle();
    },
    
}).$mount("#app")
</script>