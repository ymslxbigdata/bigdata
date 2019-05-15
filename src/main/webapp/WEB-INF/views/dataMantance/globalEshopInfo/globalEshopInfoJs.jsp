<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
var app = new Vue({
	data: function() {
		return {
			eshopId: '',
			eshopNm: '',
			countryNm: '',
			countryOptions: [],
			tableHeight: document.body.clientHeight - 105,
			globalEshopInfoData: [],
			aside_dig: false,
			eshopdtform: {
				eshopId: '',
				eshopNm: '',
				countryNm: '',
				address: '',
				locationX:'',
				locationY:'',
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
	        
	        disabledAsideKey: false,
	        eshopdtformRules: {
	        	eshopId: [
	              { required: true, message: "请输入电商ID"},
	            ],
	            eshopNm: [
	              { required: true, message: "请输入电商名称"},
	            ],
	            countryNm: [
	              { required: true, message: "请输入所属国家"},
	            ],
          	},
          	//Excel上传路径
            uploadUrl: contextPath + '/dataMantance/globalEshopInfo/importExcel',
            downloadUrl: contextPath + '/dataMantance/globalEshopInfo/export',
          	
		}
	},
    methods: {
    	
    	// 获取国家下拉选项
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
			self.disabledAsideKey = false;
			self.$refs.eshopdtform.resetFields();
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
			self.disabledAsideKey = true;
			self.$http.post(contextPath + "/dataMantance/globalEshopInfo/getGlobalEshopInfoDetail" , {
				"eshopId": row.eshopId
			}).then(function(response) {
				var respData = response.data;
				self.eshopdtform.eshopId = respData.eshopId;
				self.eshopdtform.eshopNm = respData.eshopNm;
				self.eshopdtform.countryNm = respData.countryNm;
				self.eshopdtform.address = respData.address;
				self.eshopdtform.locationX = respData.locationX;
				self.eshopdtform.locationY = respData.locationY;
				self.eshopdtform.establishedDate = respData.establishedDate;
				self.eshopdtform.briefIntroduction = respData.briefIntroduction;
				self.eshopdtform.detailsIntroduction = respData.detailsIntroduction;
				self.eshopdtform.isMainEshop = respData.isMainEshop;

				self.aside_dig = true;
			},function(e) {
				unlock(self);
			});
		},
		
		// 清空条件部
    	changeCondition: function() {
    		this.globalEshopInfoData = [];
    	},
    	
    	// 保存电商数据
		onNewOrModifyEshop: function(eshopdtform) {
			var self = this;
			this.eshopdtform.establishedDate = VueUtil.formatDate(this.eshopdtform.establishedDate,"yyyy-MM-dd");
			var form = self.eshopdtform;
			self.$refs[eshopdtform].validate(function(valid) {
				if (!valid) {
					return false;
				} else {
					var updFlag = true;
					self.globalEshopInfoData.forEach(function(row) {
						if(self.disabledAsideKey == false && form.eshopId == row.eshopId) {
							updFlag = false;
							return false;
						}
					});
					if(updFlag) {
						debugger
						self.$http.post(contextPath + "/dataMantance/globalEshopInfo/newOrModifyEshopInfo", form).then(function(response) {
							self.aside_dig = false;
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

		// 删除行数据
		onDelRow: function(row) {
			var self = this;
			self.$confirm({
				message: "确认删除该笔数据吗？",
				confirmButtonText: "确认",
				cancelButtonText: "取消",
			}).then(function() {
				self.$http.post(contextPath + "/dataMantance/globalEshopInfo/deleteEshopInfo", {
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
		

		formateBooleanData: function(row,column,cellValue) {
			var isMainEshop = cellValue;
			if(isMainEshop) return "是";
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
    	self.getcountryNmList();
    	self.getTableList();
    },
}).$mount("#app")
</script>