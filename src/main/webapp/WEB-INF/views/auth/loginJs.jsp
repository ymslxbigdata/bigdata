<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	 var app = new Vue({
		
		data:function(){
			return{
				
				loginForm:{
					username:'',
					password:'',
					siteCode:''
				},
				rules: {
					username: [{ required: true, message: '请输入用户名', trigger: 'change' }],
					password: [{ required: true, message: '请输入密码', trigger: 'change' }]
				}
			}
		},
		methods: {
		      
			onSubmit: function(formName) {
				var self = this;
				self.$refs[formName].validate(function(valid) {
					if (valid) { 
						debugger
						
						var loginForm = document.getElementById("loginForm");
						loginForm.submit();
					}
// 					return false;
				});
			}
		}
		
	}).$mount("#login")
</script>