<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	eshop:'',
        	eshopOptions:[],
        	month:'',
        	tableHeight: document.body.clientHeight - 105,
        	globalEshopUsersData:[],
        	aside_dig: false,
        	eshopUserdtform: {
        		eshopId: '',
				eshopNm: '',
				userNum: '',
				uerNumDevelop: '',
				userNumDeveloping: '',
			},
			disabledAsideKey: false,
			eshopUserdtformRules: {
	        	eshopId: [
	              { required: true, message: "请输入电商ID"},
	            ],
	            eshopNm: [
	              { required: true, message: "请输入电商名称"},
	            ],
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
    	
		// 清空条件部
    	changeCondition: function() {
    		this.globalEshopUsersData = [];
    	},
    	
    	// 新增按钮
		onAddEshopUser: function() {
			var self = this;
			self.aside_dig = true;
			self.disabledAsideKey = false;
			self.$refs.eshopUserdtform.resetFields();
		},
		
    	changeAsideConditon: function() {
    		
    		this.eshopUserdtform.eshopId = '';
    		for(var item in this.eshopOptions) {
    			if(this.eshopOptions[item].eshopNm == this.eshopUserdtform.eshopNm) {
    	
    				this.eshopUserdtform.eshopId = this.eshopOptions[item].eshopId;
    				break;
    			}
    		}
    	},
    	
		onNewOrModifyEshopUser: function(eshopUserdtform) {
			var self = this;
			var form = self.eshopUserdtform;
			self.$refs[eshopUserdtform].validate(function(valid) {
				if (!valid) {
					return false;
				} else {
					var updFlag = true;
					self.globalEshopUsersData.forEach(function(row) {
						if(self.disabledAsideKey == false && form.eshopId == row.eshopId) {
							updFlag = false;
							return false;
						}
					});
					if(updFlag) {
						self.$http.post(contextPath + "/dataMantance/globalEshopUsersData/newOrModifyEshopUserData" , form).then(function(response) {
			 				self.aside_dig = false;
			 				this.$notify({title: "Success", message: "保存成功",type: "success",position: "bottom-right",duration:1500});
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
		
    	// 修改行数据
		onEditRow: function(row) {
			var self = this;
			self.disabledAsideKey = true;
			self.$http.post(contextPath + "/dataMantance/globalEshopUsersData/getGlobalEshopUserDataDetail", {
				"eshopId": row.eshopId
			}).then(function(response) {
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
				message: "确认删除该笔数据吗？",
				confirmButtonText: "确认",
				cancelButtonText: "取消",
			}).then(function() {
				self.$http.post(contextPath + "/dataMantance/globalEshopUsersData/deleteEshopUsersData", {
					"eshopId": row.eshopId, 
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
    	self.getEshopList();
    	self.getTableList();
    },
    
}).$mount("#app")
</script>