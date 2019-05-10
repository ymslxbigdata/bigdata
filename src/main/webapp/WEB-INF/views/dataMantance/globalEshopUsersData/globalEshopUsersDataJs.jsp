<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	eshop:'',
        	eshopOptions:[],
        	month:'',
        	tableHeight:0,
        	globalEshopUsersData:[],
        	       
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
			this.$http.post(contextPath + '/dataMantance/globalEshopUsersData/getGlobalEshopUsersData', {"eshopNm":eshop}).then(function(response) {
				self.globalEshopUsersData = response.body;
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