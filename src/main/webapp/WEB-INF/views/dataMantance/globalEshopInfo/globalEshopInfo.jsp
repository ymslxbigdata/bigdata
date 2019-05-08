<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="app" style="height: 100%" v-cloak>
	<div>hello</div>
<!--     <vue-col :span="24" style="height: 100%"> -->
<!--         <vue-row class="margin-bottom5"> -->
<!--             <vue-input size="large" v-model="userIdOrName" :placeholder="this.$t('message.50014')" style="width: calc(100% - 150px)"></vue-input> -->
<!--             <vue-button style="float: right; width: 140px;"  type="success" @click="addUser" type="primary"><i class="fa fa-plus-circle" aria-hidden="true"></i> {{ $t('label.addUser') }}</vue-button> -->
<!--         </vue-row> -->
<!--         <div> -->
<!--             <vue-table stripe highlight-current-row :border='true' :data="userData" :height="tableHeight"> -->
<!--                 <vue-table-column :label="this.$t('label.userId')" prop="userId" align="left"></vue-table-column> -->
<!--                 <vue-table-column :label="this.$t('label.userName')" prop="userNm" align="left"></vue-table-column> -->
<!--                 <vue-table-column :label="this.$t('label.role')" prop="roleNm" align="left"></vue-table-column> -->
<!--                 <vue-table-column :label="this.$t('label.startDatetime')" prop="startDatetime" align="center"></vue-table-column> -->
<!--                 <vue-table-column :label="this.$t('label.endDatetime')" prop="endDatetime" align="center"></vue-table-column> -->
<!--                 <vue-table-column :label="this.$t('label.operation')" width="300" align="center"> -->
<!--                     <template slot-scope="scope"> -->
<!--                         <div> -->
<!--                             <vue-tooltip placement="top" effect="light"> -->
<!--                                 <div slot="content">{{ $t('label.roleSetting') }}</div> -->
<!--                                 <vue-button @click="setRole(scope.row)"><i class="fa fa-users" aria-hidden="true"></i> -->
<!--                                 </vue-button> -->
<!--                             </vue-tooltip> -->
<!--                             <vue-tooltip placement="top" effect="light"> -->
<!--                                 <div slot="content">{{ $t('label.resetPassword') }}</div> -->
<!--                                 <vue-button @click="resetPassword(scope.row)" type="info"><i class="fa fa-refresh"></i></vue-button> -->
<!--                             </vue-tooltip> -->
<!--                             <vue-tooltip placement="top" effect="light"> -->
<!--                                 <div slot="content">{{ $t('label.editInfo') }}</div> -->
<!--                                 <vue-button @click="editUser(scope.row)" type="primary"><i class="fa fa-pencil" aria-hidden="true"></i></vue-button> -->
<!--                             </vue-tooltip> -->
<!--                             <vue-tooltip placement="top" effect="light"> -->
<!--                                 <div slot="content">{{ $t('label.deleteUser') }}</div> -->
<!--                                 <vue-button @click="deleteUser(scope.row)" type="danger"><i class="fa fa-trash-o" aria-hidden="true"></i></vue-button> -->
<!--                             </vue-tooltip> -->
<!--                         </div> -->
<!--                     </template> -->
<!--                 </vue-table-column> -->
<!--             </vue-table> -->
<!--         </div> -->
<!--     </vue-col> -->
<!--     新增用户 -->
<!--     <vue-dialog :title="this.$t('label.addUser')" v-model="addUserVisible" show-close> -->
<!--         <vue-form :model="addUserInfo" label-width="125px" label-position="right" ref="addUserInfo" :rules="addUserRules"> -->
<!--             <vue-form-item :label="this.$t('label.userId') " prop="userId"> -->
<!--                 <vue-input @change="checkRoleSelectUsability" :cleave="{blocks: [20]}" v-model="addUserInfo.userId"></vue-input> -->
<!--             </vue-form-item> -->
<!--             <vue-form-item :label="this.$t('label.userName') " prop="userNm"> -->
<!--                 <vue-input @change="checkRoleSelectUsability" :cleave="{blocks: [20]}" v-model="addUserInfo.userNm"></vue-input> -->
<!--             </vue-form-item> -->
<!--             <vue-form-item :label="this.$t('label.password')" prop="userPw"> -->
<!--                 <vue-input @change="checkRoleSelectUsability" type="password" :cleave="{blocks: [20]}" v-model="addUserInfo.userPw"></vue-input> -->
<!--             </vue-form-item> -->
<!--             <vue-form-item :label="this.$t('label.repeatPassword')" prop="userPwRepeat"> -->
<!--                 <vue-input @change="checkRoleSelectUsability" type="password" :cleave="{blocks: [20]}" v-model="addUserInfo.userPwRepeat"></vue-input> -->
<!--             </vue-form-item> -->
<!--             <vue-form-item :label="this.$t('label.role')"> -->
<!--                 <vue-select :disabled="roleSelectDisabled" class="margin-top8" size="large" v-model="selectedRole" clearable> -->
<!--                     <vue-option default-first-option filterable v-for="(item, index) in roleData" :key="index" :label="item.roleNm" :value="item"> -->
<!--                     </vue-option> -->
<!--                 </vue-select> -->
<!--             </vue-form-item> -->
<!--             <vue-col :span="12" class="margin-top8"> -->
<!--                 <vue-form-item :label="this.$t('label.startDatetime')"> -->
<!--                     <vue-date-picker size="large" v-model="startDatetime" align="right" :disabled="datePickerDisabled"></vue-date-picker> -->
<!--                 </vue-form-item> -->
<!--             </vue-col> -->
<!--             <vue-col :span="12" class="margin-top9"> -->
<!--                 <vue-form-item :label="this.$t('label.endDatetime')"> -->
<!--                     <vue-date-picker size="large" v-model="endDatetime" align="right" :disabled="datePickerDisabled"></vue-date-picker> -->
<!--                 </vue-form-item> -->
<!--             </vue-col> -->
<!--         </vue-form> -->
<!--         <vue-button class="float-right margin-left5 margin-top11 margin-bottom15" @click="addUserVisible = false">{{ this.$t('button.CANCEL') }}</vue-button> -->
<!--         <vue-button class="float-right margin-left5 margin-top11 margin-bottom15" type="primary" @click="saveUser">{{ this.$t('button.SAVE') }}</vue-button> -->
<!--     </vue-dialog> -->
<!--     编辑用户信息 -->
<!--     <vue-dialog :title="this.$t('label.editInfo')" v-model="editUserVisible" show-close> -->
<!--         <vue-form :model="editUserInfo" ref="editUserInfo" :rules="editUserRules" label-width="100px" label-position="right"> -->
<!--             <vue-form-item :label=" this.$t('label.userId')"> -->
<!--                 <vue-input disabled v-model="editUserInfo.userId"></vue-input> -->
<!--             </vue-form-item> -->
<!--             <vue-form-item :label=" this.$t('label.userName')" prop="userNm"> -->
<!--                 <vue-input :cleave="{blocks: [20]}" v-model="editUserInfo.userNm"></vue-input> -->
<!--             </vue-form-item> -->
<!--         </vue-form> -->
<!--         <vue-button class="float-right margin-left5 margin-top6 margin-bottom15" @click="editUserVisible = false">{{ this.$t('button.CANCEL') }}</vue-button> -->
<!--         <vue-button class="float-right margin-left5 margin-top6 margin-bottom15" type="primary" @click="saveEdit">{{ this.$t('button.SAVE') }}</vue-button> -->
<!--     </vue-dialog> -->
<!--     用户角色设置 -->
<!--     <vue-dialog :title="this.$t('label.roleSetting')" v-model="setUserRoleVisible" show-close> -->
<!--         <vue-form label-width="110px" label-position="right"> -->
<!--             <vue-col :span="12"> -->
<!--                 <vue-form-item :label=" this.$t('label.userId')"> -->
<!--                     <vue-input disabled v-model="currentUser.userId"></vue-input> -->
<!--                 </vue-form-item> -->
<!--             </vue-col> -->
<!--             <vue-col :span="12"> -->
<!--                 <vue-form-item :label="this.$t('label.userName')"> -->
<!--                     <vue-input disabled v-model="currentUser.userNm"></vue-input> -->
<!--                 </vue-form-item> -->
<!--             </vue-col> -->
<!--             <vue-col :span="24"> -->
<!--                 <vue-form-item :label="this.$t('label.role')"> -->
<!--                     <vue-select class="margin-top6" v-model="selectedRole" clearable> -->
<!--                         <vue-option default-first-option filterable v-for="(item, index) in roleData" :key="index" :label="item.roleNm" :value="item"> -->
<!--                         </vue-option> -->
<!--                     </vue-select> -->
<!--                 </vue-form-item> -->
<!--             </vue-col> -->
<!--             <vue-col :span="12"> -->
<!--                 <vue-form-item :label="this.$t('label.startDatetime')"> -->
<!--                     <vue-date-picker v-model="startDatetime" align="right" :disabled="datePickerDisabled"></vue-date-picker> -->
<!--                 </vue-form-item> -->
<!--             </vue-col> -->
<!--             <vue-col :span="12"> -->
<!--                 <vue-form-item :label="this.$t('label.endDatetime')"> -->
<!--                     <vue-date-picker v-model="endDatetime" align="right" :disabled="datePickerDisabled"></vue-date-picker> -->
<!--                 </vue-form-item> -->
<!--             </vue-col> -->
<!--         </vue-form> -->
<!--         <vue-button class="float-right margin-left5 margin-top3 margin-bottom15" @click="setUserRoleVisible = false">{{ this.$t('button.CANCEL') }}</vue-button> -->
<!--         <vue-button class="float-right margin-left5 margin-top3 margin-bottom15" type="primary" @click="userRoleValid">{{ this.$t('button.SAVE') }}</vue-button> -->
<!--     </vue-dialog> -->
<!--     用户密码重置 -->
<!--     <vue-dialog :title="this.$t('label.resetPassword')" v-model="resetPasswordVisible" show-close> -->
<!--         <vue-form :model="resetPwInfo" ref="resetPwInfo" :rules="resetPwRules" label-width="130px" label-position="right"> -->
<!--             <vue-form-item :label="this.$t('label.userId')"> -->
<!--                 <vue-input disabled :placeholder="resetPwInfo.userId"></vue-input> -->
<!--             </vue-form-item> -->
<!--             <vue-form-item :label="this.$t('label.userName')"> -->
<!--                 <vue-input disabled :placeholder="resetPwInfo.userNm"></vue-input> -->
<!--             </vue-form-item> -->
<!--             <vue-form-item :label="this.$t('label.newPassword')" prop="userPw"> -->
<!--                 <vue-input type="password" :cleave="{blocks: [20]}" v-model="resetPwInfo.userPw"></vue-input> -->
<!--             </vue-form-item> -->
<!--             <vue-form-item :label="this.$t('label.repeatPassword')" prop="repeatPw"> -->
<!--                 <vue-input type="password" :cleave="{blocks: [20]}" v-model="resetPwInfo.repeatPw"></vue-input> -->
<!--             </vue-form-item> -->
<!--         </vue-form> -->
<!--         <vue-button class="float-right margin-left5 margin-top8 margin-bottom15" @click="resetPasswordVisible = false">{{ this.$t('button.CANCEL') }}</vue-button> -->
<!--         <vue-button class="float-right margin-left5 margin-top8 margin-bottom15" type="primary" @click="saveUserPw">{{ this.$t('button.SAVE') }}</vue-button> -->
<!--     </vue-dialog> -->
<!--     确认是否更换角色 -->
<!--     <vue-dialog v-model="confirmRoleChangeVisible" size="small" show-close> -->
<!--         <div>{{ message }}</div> -->
<!--         <vue-button class="float-right margin-left5 margin-top5 margin-bottom15" @click="confirmRoleChangeVisible = false">{{ this.$t('button.CANCEL') }}</vue-button> -->
<!--         <vue-button class="float-right margin-left5 margin-top5 margin-bottom15" type="primary" @click="userRoleSaveHandle">{{ this.$t('button.SAVE') }}</vue-button> -->
<!--     </vue-dialog> -->
<!--     确认是否删除用户 -->
<!--     <vue-dialog :title="this.$t('label.prompt')" v-model="confirmUserDeleteVisible" size="small" show-close> -->
<!--         <div>{{ message }}</div> -->
<!--         <vue-button class="float-right margin-left5 margin-bottom15" @click="confirmUserDeleteVisible = false">{{ this.$t('button.NO') }}</vue-button> -->
<!--         <vue-button class="float-right margin-left5 margin-bottom15" type="primary" @click="confirmDelete">{{ this.$t('button.YES') }}</vue-button> -->
<!--     </vue-dialog> -->
	</div>
	<jsp:include page="globalEshopInfoJs.jsp" />
</body>
</html>