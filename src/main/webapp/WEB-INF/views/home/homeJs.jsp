<sec:authentication property="principal.userContext" var="uc" />
<script>
var getVueInstance = function(){return homeApp}
var homeApp = new Vue({
	mixins: [ajaxGetButtonMixin()],
	data: function() {
		return {

			iframeName: "homePage",
			iframeUrl: "homePage/info",

		}
	},

}).$mount("#home");

window.onload = function() {

}
</script>