<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	
        	eshopId: '',
        	eshopNm: '',
        	month: '',
        	eshopOptions: [],
        	tableHeight: document.body.clientHeight - 105,          
        	globalEshopTradeData: [],
        	
        	currentData: {},
        	currentIndex: 0,
        	
        	showAside: false,
        	showAsideEshopId: false,
        	
        	disabledAsideEshopNm: false,
        	disabledAsideTradeDate: false,
        	
        	showDialog: false,
        	currentDataRules: {
        		eshopId: [
	              { required: true, message: "请输入电商ID"},
	            ],
	            eshopNm: [
	              { required: true, message: "请输入电商名称"},
	            ],
	            tradeDate: [
	              { required: true, message: "请输入年月"},
	            ],
          	},
        	       
        }
    },
    methods: {
    	
    	getEshopOption: function() {
    		
    		var self = this;
			this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/getEshopOptions', {}).then(function(response) {
				self.eshopOptions = response.body;
			}, function(response) {
				console.log(response.body.reason);
			});
    	},
    	
    	getEshopNmById: function() {
    		this.eshopNm = '';
    		for(var item in this.eshopOptions) {
    			if(this.eshopOptions[item].eshopId == this.eshopId) {
    				this.eshopNm = this.eshopOptions[item].eshopNm;
    				break;
    			}
    		}
    	},
    	
    	getTableList: function() {
    		var self = this;
			var eshopId = self.eshopId;
			var month = VueUtil.formatDate(self.month,"yyyy-MM");
			this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/getGlobalEshopTradeData', {"eshopId":eshopId,"tradeDate":month}).then(function(response) {
				self.globalEshopTradeData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	},
    	
    	changeCondition: function() {
    		this.globalEshopTradeData = [];
    		this.getEshopNmById();
    	},
    	
    	changeAsideConditon: function() {
    		
    		this.currentData.eshopNm = '';
    		for(var item in this.eshopOptions) {
    			if(this.eshopOptions[item].eshopId == this.currentData.eshopId) {
    				this.currentData.eshopNm = this.eshopOptions[item].eshopNm;
    				break;
    			}
    		}
    	},
    	
    	searchDataHandle: function() {
    		this.getTableList();
    	},
    	
    	editInsertHandle: function(rowData,handleType) {
    		
    		this.showAside = true;
    		
    		if(handleType == 'edit') {
    			
    			this.currentData = VueUtil.merge({}, rowData);
    			this.currentIndex = this.globalEshopTradeData.indexOf(rowData);
    			
    			this.showAsideEshopId = false;
        		this.disabledAsideEshopNm = true;
//         		this.disabledAsideTradeDate = this.month != '' ? true : false;
        		this.disabledAsideTradeDate = true;
    		}
    		else {
    			
    			this.currentData = {tradeDate:'',eshopId:'',eshopNm:''};
    			
//     			this.disabledAsideEshopNm = this.eshopNm != '' ? true : false;
//     			this.disabledAsideTradeDate = this.month != '' ? true : false;
    			this.disabledAsideEshopNm = false;
    			this.disabledAsideTradeDate = false;
				
    			this.currentData.eshopNm = this.eshopNm;
    			this.currentData.eshopId = this.eshopId;
    			this.currentData.tradeDate = this.month;
    		}
        },
        
        deleteHandle: function(rowData) {
        	this.showDialog = true;
        	this.currentData = VueUtil.merge({}, rowData);
        },
    	
    	editInsertSaveHandle: function(currentData) {
    		var self = this;
    		var form = self.currentData;
    		this.currentData.tradeDate = VueUtil.formatDate(this.currentData.tradeDate,"yyyy-MM");
    		self.$refs[currentData].validate(function(valid) {
				if (!valid) {
					return false;
				} else {
					var updFlag = true;
					self.globalEshopTradeData.forEach(function(row) {
						if(self.disabledAsideEshopNm == false && form.eshopNm == row.eshopId && form.tradeDate == row.tradeDate) {
							updFlag = false;
							return false;
						}
					});
					if(updFlag) {
						self.$http.post(contextPath + '/dataMantance/globalEshopTradeData/saveData', form).then(function(response) {
		     				self.getTableList();
		     				self.showAside = false;
		     				this.$notify({title: "Success", message: "保存成功",type: "success",position: "bottom-right",duration:1500});
// 							setTimeout(function() {
// 								self.onRetrieve();
// 							}, 500);
						},function(e){
							unlock(self);
						});
					} else {
						self.$notify({ title: "Error", message: "数据已经存在，请重新输入",type: "error",position: "bottom-right",duration:1500});
					}
				}
			});
//     		this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/saveData', self.currentData).then(function(response) {
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
    		this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/deleteData', self.currentData).then(function(response) {
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
    	self.getEshopOption();
    	self.searchDataHandle();
    },
    
}).$mount("#app")
</script>