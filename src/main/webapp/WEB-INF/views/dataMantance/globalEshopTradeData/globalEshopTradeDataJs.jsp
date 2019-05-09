<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	eshop:'',
        	eshopOptions:[],
        	month:'',
        	monthOptions:[{value:'1',label:'1月份'}
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
        	globalEshopTradeData:[],
        	tableHeight:0,
        	       
        }
    },
    methods: {
    	
    	getEshopList: function() {
    		
    		var self = this;
			this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/getEshopOptions', {}).then(function(response) {
				self.eshopOptions = response.body;
			}, function(response) {
				console.log(response.body.reason);
			});
    	},
    	
    	getTableList: function() {
    		var self = this;
			var eshop = self.eshop;
			var month = self.month;
			this.$http.post(contextPath + '/dataMantance/globalEshopTradeData/getGlobalEshopTradeData', {"eshopNm":eshop,"tradeMonth":month}).then(function(response) {
				self.globalEshopTradeData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	}, 
    	
    	searchDataHandle: function() {
    		this.getTableList();
    	}
    },
    
    mounted: function() {
    	var self = this;
    	self.getEshopList();
    	self.getTableList();
    },
    
}).$mount("#app")
</script>