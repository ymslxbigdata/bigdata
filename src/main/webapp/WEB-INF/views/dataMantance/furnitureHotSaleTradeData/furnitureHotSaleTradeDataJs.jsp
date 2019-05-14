<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	typeNm:'',
        	typeNmOptions:[],
        	productNm:'',
        	tableHeight: document.body.clientHeight - 105,
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
			disabledAsideKey: false,
			furnitureHotSaleTradeDataDtformRules: {
	            typeNm: [
	              { required: true, message: "请选择种类名"},
	            ],
	            productId: [
	              { required: true, message: "请输入产品ID"},
	            ],
	            productNm: [
		          { required: true, message: "请输入产品名称"},
	            ],
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
			disabledAsideKey = false,
			self.$refs.furnitureHotSaleTradeDataDtform.resetFields();
		},
		
		// 清空条件部
    	changeCondition: function() {
    		this.furnitureHotSaleTradeData = [];
    	},
    	
    	changeAsideConditon: function() {
    		
    		this.furnitureHotSaleTradeDataDtform.typeId = '';
    		for(var item in this.typeNmOptions) {
    			if(this.typeNmOptions[item].typeNm == this.furnitureHotSaleTradeDataDtform.typeNm) {
    	
    				this.furnitureHotSaleTradeDataDtform.typeId = this.typeNmOptions[item].typeId;
    				break;
    			}
    		}
    	},
    	
    	// 保存热销产品交易数据
		onNewOrModifyFurnitureHotSaleTradeData: function() {
			var self = this;
			var form = self.furnitureHotSaleTradeDataDtform;
			form.tradeDate = VueUtil.formatDate(form.tradeDate,"yyyy-MM");
			self.$http.post(contextPath + "/dataMantance/furnitureHotSaleTradeData/newOrModifyFurnitureHotSaleTradeData", form).then(function(response) {
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
			self.disabledAsideKey = true;
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
				self.$http.post(contextPath + "/dataMantance/furnitureHotSaleTradeData/deleteFurnitureHotSaleTradeData", {
					"saleTradeId": row.saleTradeId, 
					}).then(function(response) {
					setTimeout(function() {
						self.onRetrieve();
					}, 500);
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
    	self.getTypeNmList();
    	self.getTableList();
    },
    
}).$mount("#app")
</script>