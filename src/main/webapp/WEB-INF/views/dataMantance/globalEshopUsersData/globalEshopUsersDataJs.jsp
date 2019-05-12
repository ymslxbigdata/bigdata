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
        	aside_dig: false,
        	eshopUserdtform: {
        		eshopId: '',
				eshopNm: '',
				userNum: '',
				uerNumDevelop: '',
				userNumDeveloping: '',
			},
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
			self.$http.post(contextPath + '/dataMantance/globalEshopUsersData/getGlobalEshopUsersData', {"eshopNm":eshop}).then(function(response) {
				self.globalEshopUsersData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	}, 
    	
    	onRetrieve: function() {
    		this.getTableList();
    	},
    	
    	// 新增按钮
		onAddEshopUser: function() {
			var self = this;
			self.aside_dig = true;
			self.$refs.eshopUserdtform.resetFields();
		},
		
		onNewOrModifyEshop: function(eshopdtform) {
			var self = this;
			self.confirmNewOrModifyEshopUser(self);
		},
		
		confirmNewOrModifyEshopUser: function(self) {
			debugger
			var form = self.eshopUserdtform;
			self.$http.post(contextPath + "/dataMantance/globalEshopUsersData/newOrModifyEshopUserData" , {
				 "eshopId": form.eshopId
			   , "eshopNm":form.eshopNm
			   , "userNum": form.userNum
			   , "uerNumDevelop": form.uerNumDevelop
		       , "userNumDeveloping": form.userNumDeveloping
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
			self.$http.post(contextPath + "/dataMantance/globalEshopUsersData/getGlobalEshopUserDataDetail", {
				"eshopId": row.eshopId
			}).then(function(response) {
				debugger
				var respData = response.data;
				self.eshopUserdtform.eshopId = respData.eshopId;
				self.eshopUserdtform.eshopNm = respData.eshopNm;
				self.eshopUserdtform.userNum = respData.userNum;
				self.eshopUserdtform.uerNumDevelop = respData.uerNumDevelop;
				self.eshopUserdtform.userNumDeveloping = respData.userNumDeveloping;

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
				self.onConfirmUpdUser(self, row.eshopId);
			}).catch(function() {
				return false;
			});
		},
		
		onConfirmUpdUser: function(self, eshopId) {
			self.$http.post(contextPath + "/dataMantance/globalEshopUsersData/deleteEshopUsersData", {
				"eshopId": eshopId, 
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
    	self.getEshopList();
    	self.getTableList();
    },
    
}).$mount("#app")
</script>