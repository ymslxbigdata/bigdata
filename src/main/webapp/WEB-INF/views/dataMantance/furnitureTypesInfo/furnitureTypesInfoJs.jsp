<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
    data: function() {
        return {
        	typeNm:'',
        	typeNmOptions:[],
        	furnitureTypesInfoData:[],
        	tableHeight: document.body.clientHeight - 105,
        	aside_dig: false,
        	furnitureTypesDtform: {
        		typeId: '',
        		typeNm: '',
			},
			disabledAsideKey: false,
			furnitureTypesDtformRules: {
				typeId: [
	              { required: true, message: "请输入家具种类ID"},
	            ],
	            typeNm: [
	              { required: true, message: "请输入家具种类名称"},
	            ],
          	},
          	//Excel上传路径
            uploadUrl: contextPath + '/dataMantance/furnitureTypesInfo/importExcel',
            downloadUrl: contextPath + '/dataMantance/furnitureTypesInfo/export',
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
			self.$http.post(contextPath + '/dataMantance/furnitureTypesInfo/getFurnitureTypesInfoData', {
				"typeNm":self.typeNm
			}).then(function(response) {
				self.furnitureTypesInfoData = response.body;
			}, function(response) {
				errorMsg(response.body.reason);
			});
    	}, 
    	
    	onRetrieve: function() {
    		this.getTableList();
    	},
    	
		// 清空条件部
    	changeCondition: function() {
    		this.furnitureTypesInfoData = [];
    	},
    	
    	// 新增按钮
		onAddFurnitureType: function() {
			var self = this;
			self.aside_dig = true;
			self.disabledAsideKey = false;
			self.$refs.furnitureTypesDtform.resetFields();
		},
		
		// 保存家具种类数据
		onNewOrModifyFurnitureType: function(furnitureTypesDtform) {
			var self = this;
			var form = self.furnitureTypesDtform;
			self.$refs[furnitureTypesDtform].validate(function(valid) {
				if (!valid) {
					return false;
				} else {
					var updFlag = true;
					self.furnitureTypesInfoData.forEach(function(row) {
						if(self.disabledAsideKey == false && form.typeId == row.typeId) {
							updFlag = false;
							return false;
						}
					});
					if(updFlag) {
			 			self.$http.post(contextPath + "/dataMantance/furnitureTypesInfo/newOrModifyFurnitureType", form).then(function(response) {
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
			self.$http.post(contextPath + "/dataMantance/furnitureTypesInfo/getFurnitureTypesDetail", {
				"typeId": row.typeId
			}).then(function(response) {
				var respData = response.data;
				self.furnitureTypesDtform.typeId = respData.typeId;
				self.furnitureTypesDtform.typeNm = respData.typeNm;
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
				self.$http.post(contextPath + "/dataMantance/furnitureTypesInfo/deleteFurnitureTypes", {
					"typeId": row.typeId, 
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
    	self.getTypeNmList();
    	self.getTableList();
    },
    
}).$mount("#app")
</script>