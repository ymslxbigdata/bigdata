<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var app = new Vue({
	data: function() {
		return {
			eshopId: '',
			eshopNm: '',
			countryNm: '',
			countryOptions: [],
			pageData: [],
			globalEshopInfoData: [],
			aside_dig: false,
			eshopdtform: {
				eshopId: '',
				eshopNm: '',
				countryNm: '',
				address: '',
				establishedDate: '',
				briefIntroduction: '',
				detailsIntroduction: '',
				isMainEshop: '',
			},
			establishedDatepickerOptions: {
	            disabledDate: function(time) {
	              return time.getTime() > VueUtil.addDate((new Date), -1).getTime();
	            }
	        },
		}
	},
    methods: {
    	
    	getcountryNmList: function() {
    		
    		var self = this;
			this.$http.post(contextPath + '/dataMantance/globalEshopInfo/getcountryNmOptions', {}).then(function(response) {
				self.countryOptions = response.body;
			}, function(response) {
				console.log(response.body.reason);
			});
    	},

		// 检索按钮
    	onRetrieve: function() {
    		this.getTableList();
    	},
    	
    	// 新增按钮
		onAddEshop: function() {
			var self = this;
			self.aside_dig = true;
			self.$refs.eshopdtform.resetFields();
// 			self.initUserDtlAttr(self, false, "");
		},
		
		// 检索方法
    	getTableList: function() {
    		var self = this;
    		self.$http.post(contextPath + '/dataMantance/globalEshopInfo/getGlobalEshopInfo' , {
				"eshopId":self.eshopId,
				"eshopNm":self.eshopNm,
				"countryNm": self.countryNm
				}).then(function(response) {
				self.globalEshopInfoData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	}, 
    	
    	// 修改行数据
		onEditRow: function(row) {
			var self = this;
// 			self.$refs.userdtlform.resetFields();
// 			self.initUserDtlAttr(self, true, row.userId);
			self.$http.post(contextPath + "/dataMantance/globalEshopInfo/getGlobalEshopInfoDetail"
					, {"eshopId": row.eshopId}).then(function(response) {
				var respData = response.data;
				self.eshopdtform.eshopId = respData.eshopId;
				self.eshopdtform.eshopNm = respData.eshopNm;
				self.eshopdtform.countryNm = respData.countryNm;
				self.eshopdtform.address = respData.address;
				self.eshopdtform.establishedDate = respData.establishedDate;
				self.eshopdtform.briefIntroduction = respData.briefIntroduction;
				self.eshopdtform.detailsIntroduction = respData.detailsIntroduction;
				self.eshopdtform.isMainEshop = respData.isMainEshop;

				self.aside_dig = true;
			},function(e) {
				unlock(self);
			});
		},
			
		onNewOrModifyEshop: function(eshopdtform) {
			var self = this;
// 			self.$refs[eshopdtform].validate(function(valid) {
// 				if (!valid) {
// 					return false;
// 				}
// 				if (typeof(onSaveUserCallback) != "undefined" && !onSaveUserCallback({"userData": JSON.stringify(self.userdtlform), "userRoleData":JSON.stringify(self.userdtlform.userRoleData)
// 					, "extendList": JSON.stringify(self.userdtlform.extendList), "newExtendProps": JSON.stringify(self.newExtendProps)
// 				})) {
// 					return false;
// 				}
// 				if (self.userdtlform.userId) {
// 					self.confirmNewOrModifyUser(self);
// 				} else {
// 					self.$http.post(contextPath+"/userManage/validWithDb"
// 						,{"code": self.userdtlform.userCode}).then(function(response) {
// 							if(response.data.status) {
// 								error(self, message_arg(Vue.t(response.data.message), Vue.t('label.user_code'), self.userdtlform.userCode));
// 							} else {
								self.confirmNewOrModifyEshop(self);
// 							}
// 					},function(e){
// 						unlock(self);
// 					});
// 				}
// 			});
		},
		confirmNewOrModifyEshop: function(self) {
			debugger
			var form = self.eshopdtform;
// 			self.$http.post(contextPath + "/dataMantance/globalEshopInfo/newOrModifyEshopInfo", {
// 				 "eshopId": JSON.stringify(form.eshopId)
// 			   , "eshopNm":JSON.stringify(form.eshopNm)
// 			   , "countryNm": JSON.stringify(form.countryNm)
// 			   , "address": JSON.stringify(form.address)
// 		       , "establishedDate": JSON.stringify(form.establishedDate)
// 			   , "briefIntroduction": JSON.stringify(form.briefIntroduction)
// 			   , "detailsIntroduction": JSON.stringify(form.detailsIntroduction)
// 			   , "isMainEshop": JSON.stringify(form.isMainEshop)
// 			   }).then(function(response){
		self.$http.post(contextPath + "/dataMantance/globalEshopInfo/newOrModifyEshopInfo"
					, {"eshopId": form.eshopId
			   , "eshopNm":form.eshopNm
			   , "countryNm": form.countryNm
			   , "address": form.address
		       , "establishedDate": form.establishedDate
			   , "briefIntroduction": form.briefIntroduction
			   , "detailsIntroduction": form.detailsIntroduction
			   , "isMainEshop": form.isMainEshop
			           }).then(function(response) {
					debugger
						if (typeof(onAfterSaveUserCallback) != "undefined") {
						var actionType = self.userdtlform.userId != null && self.userdtlform.userId.trim() != "" ? "update" : "insert";
						onAfterSaveUserCallback({
							  "actionType": actionType
							, "userData": JSON.stringify(self.userdtlform)
							, "userRoleData":JSON.stringify(self.userdtlform.userRoleData)
							, "extendList": JSON.stringify(self.userdtlform.extendList)
							, "newExtendProps": JSON.stringify(self.newExtendProps)
						});
					}
					self.aside_dig = false;
					//self.filterContext = "";
					setTimeout(function() {
						self.onRetrieve();
					}, 500);
			},function(e){
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
			self.$http.post(contextPath + "/dataMantance/globalEshopInfo/deleteEshopInfo", {
				"eshopId": eshopId, 
// 				"action": action
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
    	self.getcountryNmList();
    	self.getTableList();
    },
}).$mount("#app")
</script>