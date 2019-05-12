<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	typeNm:'',
        	typeNmOptions:[],
        	productNm:'',
//         	productNmOptions: [],
        	furnitureHotSaleTradeData:[],
        	aside_dig: false,
        	furnitureHotSaleTradeDataDtform: {
        		saleTradeId: '',
        		typeId: '',
        		typeNm: '',
        		productId: '',
        		productNm: '',
        		hotSalePlace: '',
        		productPlace: '',
        		tradeDate: '',
        		tradeVolume: '',
        		tradeAmazon: '',
        		tradeAli: '',
        		tradeWish: '',
        		tradeEbay: '',
        		tradeOthers: '',
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
			self.$http.post(contextPath + '/dataMantance/furnitureHotSaleTradeData/getFurnitureHotSaleTradeData', {
				"typeNm":self.typeNm,
				"productNm":self.productNm
			}).then(function(response) {
				self.furnitureHotSaleTradeData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	}, 
    	
    	onRetrieve: function() {
    		this.getTableList();
    	},
    	
    	// 新增按钮
		onAddFurnitureHotSaleTradeData: function() {
			var self = this;
			self.aside_dig = true;
			self.$refs.furnitureHotSaleTradeDataDtform.resetFields();
		},
		
		onNewOrModifyFurnitureHotSaleTradeData: function(eshopdtform) {
			var self = this;
			self.confirmNewOrModifyFurnitureHotSaleTradeData(self);
		},
		
		confirmNewOrModifyFurnitureHotSaleTradeData: function(self) {
			var form = self.furnitureHotSaleTradeDataDtform;
			self.$http.post(contextPath + "/dataMantance/furnitureHotSaleTradeData/newOrModifyFurnitureHotSaleTradeData" , {
				 "saleTradeId": form.saleTradeId
			   , "typeId":form.typeId
			   , "typeNm":form.typeNm
			   , "productId":form.productId
			   , "productNm":form.productNm
			   , "hotSalePlace":form.hotSalePlace
			   , "productPlace":form.productPlace
			   , "tradeDate":form.tradeDate
			   , "tradeVolume":form.tradeVolume
			   , "tradeAmazon":form.tradeAmazon
			   , "tradeAli":form.tradeAli
			   , "tradeWish":form.tradeWish
			   , "tradeEbay":form.tradeEbay
			   , "tradeOthers":form.tradeOthers
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
			self.$http.post(contextPath + "/dataMantance/furnitureHotSaleTradeData/getFurnitureHotSaleTradeDataDetail", {
				"saleTradeId": row.saleTradeId
			}).then(function(response) {
				var respData = response.data;
				self.furnitureHotSaleTradeDataDtform.saleTradeId = respData.saleTradeId;
				self.furnitureHotSaleTradeDataDtform.typeId = respData.typeId;
				self.furnitureHotSaleTradeDataDtform.typeNm = respData.typeNm;
				self.furnitureHotSaleTradeDataDtform.productId = respData.productId;
				self.furnitureHotSaleTradeDataDtform.productNm = respData.productNm;
				self.furnitureHotSaleTradeDataDtform.hotSalePlace = respData.hotSalePlace;
				self.furnitureHotSaleTradeDataDtform.productPlace = respData.productPlace;
				self.furnitureHotSaleTradeDataDtform.tradeDate = respData.tradeDate;
				self.furnitureHotSaleTradeDataDtform.tradeVolume = respData.tradeVolume;
				self.furnitureHotSaleTradeDataDtform.tradeAmazon = respData.tradeAmazon;
				self.furnitureHotSaleTradeDataDtform.tradeAli = respData.tradeAli;
				self.furnitureHotSaleTradeDataDtform.tradeWish = respData.tradeWish;
				self.furnitureHotSaleTradeDataDtform.tradeEbay = respData.tradeEbay;
				self.furnitureHotSaleTradeDataDtform.tradeOthers = respData.tradeOthers;

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
				self.onConfirmUpdFurnitureHotSaleTradeData(self, row.saleTradeId);
			}).catch(function() {
				return false;
			});
		},
		
		onConfirmUpdFurnitureHotSaleTradeData: function(self, saleTradeId) {
			self.$http.post(contextPath + "/dataMantance/furnitureHotSaleTradeData/deleteFurnitureHotSaleTradeData", {
				"saleTradeId": saleTradeId, 
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
    	self.getTypeNmList();
    	self.getTableList();
    },
    
}).$mount("#app")
</script>