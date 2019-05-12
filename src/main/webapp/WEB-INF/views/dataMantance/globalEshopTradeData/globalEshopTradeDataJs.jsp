<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	
        	eshopId: '',
        	eshopNm: '',
        	month: '',
        	eshopOptions: [],
        	monthOptions: [{value:'1',label:'1月份'}
        	          ,{value:'2',label:'2月份'}
        	          ,{value:'3',label:'3月份'}
        	          ,{value:'4',label:'4月份'}
        	          ,{value:'5',label:'5月份'}
        	          ,{value:'6',label:'6月份'}
        	          ,{value:'7',label:'7月份'}
        	          ,{value:'8',label:'8月份'}
        	          ,{value:'9',label:'9月份'}
        	          ,{value:'10',label:'10月份'}
        	          ,{value:'11',label:'11月份'}
        	          ,{value:'12',label:'12月份'}],
        	          
        	globalEshopTradeData: [],
        	
        	currentData: {},
        	currentIndex: 0,
        	
        	showAside: false,
        	showAsideEshopId: false,
        	
        	disabledAsideEshopNm: false,
        	disabledAsideTradeMonth: false,
        	       
        }
    },
    methods: {
    	
    	getEshopOption: function() {
    		
    		var self = this;
			this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/getEshopOptions', {}).then(function(response) {
				debugger
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
			this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/getGlobalEshopTradeData', {"eshopId":eshopId,"tradeMonth":month}).then(function(response) {
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
        		this.disabledAsideTradeMonth = this.month != '' ? true : false;
    		}
    		else {
    			
    			this.currentData = {tradeMonth:'',eshopId:'',eshopNm:''};
    			
    			this.disabledAsideEshopNm = this.eshopNm != '' ? true : false;
    			this.disabledAsideTradeMonth = this.month != '' ? true : false;
				
    			this.currentData.eshopNm = this.eshopNm;
    			this.currentData.eshopId = this.eshopId;
    			this.currentData.tradeMonth = this.month;
    		}
        },
    	
    	editInsertSaveHandle: function() {
    		
    		var self = this;
    		this.currentData.tradeMonth = VueUtil.formatDate(this.currentData.tradeMonth,"yyyy-MM");
    		this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/saveData', self.currentData).then(function(response) {
    			self.getTableList();
    			self.showAside = false;
			}, function(response) {
				console.log(response.body.reason);
			});
    	},
    	
    	deleteSaveHandle: function() {
    		
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