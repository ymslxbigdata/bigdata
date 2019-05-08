<script>
var app = new Vue({
    data: function() {
        return {
          
        }
    },
//     methods: {

//         // 获取用户信息(全检索)
//         getUserData: function() {

//             var self = this;

//             self.$http.post(contextPath + '/systemConfig/userManage/getFilteredUserList.json',
//             		self.userIdOrName ? self.userIdOrName : "%"
//             ).then(function(response) {
//                 self.userData = response.body;
//             }, function(response) {
//                 errorMsg(response.body.reason);
//             });
//         },

//         // 获取角色信息(全检索)
//         getRoleData: function() {

//             var self = this;

//             this.$http.post(contextPath + '/systemConfig/userManage/getRoleList.json', "%").then(function(response) {
//                 self.roleData = response.body;
//             }, function(response) {
//                 errorMsg(response.body.reason);
//             });
//         },

//         // 新增用户初始化
//         addUser: function() {

//             this.addUserInfo = {};
//             this.selectedRole = {};
//             this.startDatetime = '';
//             this.endDatetime = '';
//             this.$refs["addUserInfo"].resetFields();
//             this.roleSelectDisabled = true;
//             this.addUserVisible = true;
//         },

//         checkRoleSelectUsability: function() {

//             var userInfo = this.addUserInfo;

//             if(userInfo == null)return;

//             var userId = userInfo.hasOwnProperty('userId') && (userInfo.userId !== '');
//             var userNm = userInfo.hasOwnProperty('userNm') && (userInfo.userNm !== '');
//             var userPw = userInfo.hasOwnProperty('userPw') && (userInfo.userPw !== '');
//             var userPwRepeat = userInfo.hasOwnProperty('userPwRepeat') && (userInfo.userPwRepeat !== '');

//             this.roleSelectDisabled = (!(userId && userNm && userPw && userPwRepeat));
//             if(this.roleSelectDisabled){
//             	this.selectedRole = {};
//             }
//         },

//         // 保存用户信息
//         saveUser: function() {

//             var self = this;

//             //日期校验
//             if (self.startDatetime && self.endDatetime) {

//                 self.startDatetime = new Date(self.startDatetime);
//                 self.endDatetime = new Date(self.endDatetime);

//                 //format之后再new Date,消除因为时区引起的bug
//                 if (new Date(self.startDatetime.Format("yyyy-MM-dd")) > new Date(self.endDatetime.Format("yyyy-MM-dd"))) {
//                     errorMsg(this.$t('message.50029'));
//                     return;
//                 }
//             }
//             this.$refs["addUserInfo"].validate(function(valid) {

//                 if (valid) {

//                     self.$http.post(contextPath + '/systemConfig/userManage/addUser.json',
// 	                    {
// 	                        userId: self.addUserInfo.userId,
// 	                        userNm: self.addUserInfo.userNm,
// 	                        userPw: self.addUserInfo.userPw,
// 	                        roleId: self.selectedRole.roleId ? self.selectedRole.roleId : null,
// 	                        startDatetime: self.startDatetime ? new Date(self.startDatetime) : null,
// 	                        endDatetime: self.endDatetime ? new Date(self.endDatetime) : null,
// 	                        createAuthor: "${uc.userId}"
// 	                    }
//                     ).then(function(response) {

//                     	if(response.body){
//         					errorMsg(self.$t(response.body));
//         				}else{
// 	                        successMsg(self.$t('message.50012'));
// 	                        self.userIdOrName = '';
// 	                        self.addUserVisible = false;
// 	                        self.retrive();
//         				}

//                     }, function(response) {
//                         errorMsg(response.body.reason);
//                     });
//                } else {
//                     errorMsg(self.$t('message.50030'));
//                }
//         	});
//         },

//         // 编辑用户信息初始化
//         editUser: function(row) {

//             this.editUserInfo = {};
//             this.editUserInfo = Object.assign({}, row);
//             this.editUserInfoBackUp = Object.assign({}, row);
//             this.$refs["editUserInfo"].resetFields();
//             this.editUserVisible = true;
//         },

//         // 保存编辑内容
//         saveEdit: function() {

//             var self = this;

//             if(this.editUserInfo.userNm === this.editUserInfoBackUp.userNm){
//             	errorMsg(this.formatMessage(this.$t('message.50035'),[this.$t('label.userInfo')]));
//             	return;
//             }
//             this.$refs["editUserInfo"].validate(function(valid) {
//                 if (valid) {

//                     self.$http.post(contextPath + '/systemConfig/userManage/editUser.json',
//                    		{
//                         	userId: self.editUserInfo.userId,
//                        		userNm: self.editUserInfo.userNm
//                     	}
//                     ).then(function(response) {
//                     	if(response.body){
//         					errorMsg(self.$t(response.body));
//         				}else{

// 	                        successMsg(self.$t('message.50012'));
// 	                        self.editUserVisible = false;
// 	                        self.retrive();
//         				}
//                     }, function(response) {
//                         errorMsg(response.body.reason);
//                     });
//                 } else {
//                     errorMsg(self.$t('message.50030'));
//                 }
//             });
//         },

//         // 设置角色
//         setRole: function(row) {

//             var self = this;

//             this.message = '';
//             this.roleTerm = [];
//             this.startDatetime = '';
//             this.endDatetime = '';
//             this.currentUser = row;
//             this.selectedRole = null;
//             this.getRoleData();

//             self.$http.post(contextPath + '/systemConfig/userManage/findRoleByUserId.json',
//                 self.currentUser.userId
//             ).then(function(response) {

//                 var highlighRow = 0;

//                 self.currentUser.oldRoleId = response.body[0].roleId;
//                 self.selectedRole = response.body[0];
//                 self.startDatetime = self.currentUser.startDatetime ? self.currentUser.startDatetime : null;
//                 self.endDatetime = self.currentUser.endDatetime ? self.currentUser.endDatetime : null;

//                 // 设置高亮行
//                 if (self.currentUser.roleId) {
//                     for (var i = 0; i < self.roleData.length; i++) {

//                         if (self.roleData[i].roleId === self.currentUser.roleId) {

//                             highlighRow = i;
//                             break;
//                         }
//                     }
//                     setTimeout(function() {
//                         self.selectedRole = self.roleData[i];
//                     }, 500);
//                 }
//             }, function(response) {
//                 errorMsg(response.body.reason);
//             });

//             this.$nextTick(function() {
//                 self.setUserRoleVisible = true;
//             });
//         },

//         // 检查是否更换角色
//         userRoleValid: function() {

//             var self = this;
//             //未选择角色
// 			if(!self.selectedRole || !self.selectedRole.roleId){
// 				self.userRoleSaveHandle();
// 				return;
// 			}

//             // 用户已属于某角色,又选择了新的角色
//             if (self.currentUser.oldRoleId && (self.currentUser.roleId !== self.selectedRole.roleId)) {

//                 self.oldRole = self.currentUser.roleId;
//                 self.message = this.$t('message.50025') + this.$t('message.50027') + self.currentUser.roleNm + ',' + this.$t('message.50028') + self.selectedRole.roleNm + '?';
//                 self.confirmRoleChangeVisible = true;

//             } else {
//                 // 用户没有角色,直接save
//                 self.userRoleSaveHandle();
//             }
//         },

//         // 保存用户角色
//         userRoleSaveHandle: function() {

//             var self = this;

//             self.startDatetime = self.startDatetime ? new Date(self.startDatetime) : null;
//             self.endDatetime = self.endDatetime ? new Date(self.endDatetime) : null;

//             if (self.startDatetime && self.endDatetime) {

//                 // 时间合理性校验
//                 if (new Date(self.startDatetime.Format("yyyy-MM-dd")) > new Date(self.endDatetime.Format("yyyy-MM-dd"))) {

//                     errorMsg(self.$t('message.50029'));
//                     return;
//                 }
//             }
//             self.$http.post(contextPath + '/systemConfig/userManage/saveUserRoleInfo.json',{
//                 id: {
//                     roleId: self.selectedRole ? self.selectedRole.roleId : null,
//                     userId: self.currentUser.userId
//                 },
//                 startDatetime: self.startDatetime,
//                 endDatetime: self.endDatetime,
//                 createAuthor: "${uc.userId}"
//             }).then(function() {

//                 successMsg(self.$t('message.50012'));
//                 self.retrive();
//                 self.confirmRoleChangeVisible = false;
//                 self.setUserRoleVisible = false;

//             }, function(response) {
//                 errorMsg(response.body.reason);
//             });
//         },

//         // 重设密码
//         resetPassword: function(row) {

//             var self = this;

//             this.resetPwInfo = {};
//             this.resetPwInfo = Object.assign({}, row);
//             this.resetPwInfo.userPw = '';
//             this.resetPasswordVisible = true;
//             this.$nextTick(function() {
//                 self.$refs["resetPwInfo"].resetFields();
//             })
//         },

//         // 保存密码
//         saveUserPw: function() {

//             var self = this;

//             this.$refs["resetPwInfo"].validate(function(valid) {
//                 if (valid) {

//                     self.$http.post(contextPath + '/systemConfig/userManage/saveUserPw.json',{
// 	                        userId: self.resetPwInfo.userId,
// 	                        userNm: self.resetPwInfo.userNm,
// 	                        userPw: self.resetPwInfo.userPw,
//                     }).then(function() {

//                         successMsg(self.$t('message.50019'));
//                         self.resetPwInfo = {};
//                         self.resetPasswordVisible = false;

//                     }, function(response) {
//                         errorMsg(response.body.reason);
//                     });
//                 } else {
//                     errorMsg(self.$t('message.50030'));
//                 }
//             });
//         },

//         //删除用户
//         deleteUser: function(row) {

//             this.currentUser = row;
//             this.message = this.$t('message.50026') + '"' + this.currentUser.userNm + '"' + this.$t('message.50031');
//             this.confirmUserDeleteVisible = true;
//         },
//         confirmDelete: function() {

//             var self = this;

//             self.$http.post(contextPath + '/systemConfig/userManage/deleteUser.json', {
//                 userId: self.currentUser.userId,
//             }).then(function() {

//                 successMsg(this.$t('message.50020'));
//                 self.userIdOrName = '';
//                 self.currentUser = {};
//                 self.confirmUserDeleteVisible = false;
//                 self.retrive();

//             }, function(response) {
//                 errorMsg(response.body.reason);
//             });
//         },

//         // 检索
//         retrive: function() {

//             var self = this;
//             this.getUserData();
//             this.getRoleData();
//         },

//         // ID校验,不可输入中文及特殊字符
//         checkId: function(rule, value, callback) {

//         	var regu = /^[A-Za-z0-9]+$/;
//             if (!value) {
//                 return callback(new Error(this.$t('message.50015')));
//             } else {
//                 if (regu.test(value)) {
//                     callback();
//                 } else {
//                     callback(new Error(this.$t('message.50032')));
//                 }
//             }
//         },

//         //密码校验,不可输入中文
//         checkPw: function(rule, value, callback) {

//         	var regu = /[\u4e00-\u9fa5]/;

//             if (!value) {
//                 return callback(new Error(this.$t('message.50017')));
//             } else {

//                 if (value.match(regu)) {
//                     callback(new Error(this.$t('message.50033')));

//                 } else {
//                     callback();
//                 }
//             }
//         },

//         //编辑用户时的重复密码校验
//         checkNewPw: function(rule, value, callback) {

//         	var regu = /[\u4e00-\u9fa5]/;

//             if (!value) {
//                 return callback(new Error(this.$t('message.50018')));
//             } else {
//                 if (value.match(regu)) {
//                     callback(new Error(this.$t('message.50033')));
//                 } else if (this.resetPwInfo.userPw != value) {
//                     callback(new Error(this.$t('message.50034')));
//                 } else {
//                     callback();
//                 }
//             }
//         },

//         // 添加用户时的重复密码校验
//         checkUserPw: function(rule, value, callback) {

//         	var regu = /[\u4e00-\u9fa5]/;

//             if (!value) {
//                 return callback(new Error(this.$t('message.50018')));
//             } else {
//                 if (value.match(regu)) {
//                     callback(new Error(this.$t('message.50033')));
//                 } else if (this.addUserInfo.userPw != value) {
//                     callback(new Error(this.$t('message.50034')));

//                 } else {
//                     callback();
//                 }
//             }
//         },

//     },
//     watch: {
//         userIdOrName: function() {

//             this.userData = [];
//             this.debouncedSearch();
//         },

//         selectedRole: function(val) {

//             if (!val || !val.hasOwnProperty('roleId')) {

//                 this.datePickerDisabled = true;
//                 this.startDatetime = '';
//                 this.endDatetime = '';
//             } else {

//                 this.datePickerDisabled = false;
//             }
//         },

//         userData: function(val) {

//             for (var i = 0; i < val.length; i++) {

//                 val[i].startDatetime = val[i].startDatetime ? new Date(val[i].startDatetime).Format("yyyy-MM-dd") : null;
//                 val[i].endDatetime = val[i].endDatetime ? new Date(val[i].endDatetime).Format("yyyy-MM-dd") : null;
//             }
//         }
//     },
//     computed: {
//         roleTerm: {
//             get: function() {
//                 return [this.startDatetime, this.endDatetime];
//             },
//             set: function() {}
//         }
//     },
//     mounted: function() {

//         var self = this;
//         var rootPage = window.parent.parent.parent.parent;

//         // 检索数据
//         this.retrive();

//         //初始化style
//         rootPage.getVueInstance().setChildFrameResolution(rootPage);
//         self.tableHeight = document.documentElement.clientHeight - 55;
//         $("#app")[0].style.height = document.documentElement.clientHeight + 'px';

//         window.onresize = function() {
//             self.tableHeight = document.documentElement.clientHeight - 55;
//             $("#app")[0].style.height = document.documentElement.clientHeight + 'px';
//         }
//     },
//     created: function() {
//         this.debouncedSearch = _.debounce(this.getUserData, 500);
//     },
}).$mount("#app")
</script>