<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	 var app = new Vue({
		
		data:function(){
			return{
				
				menuList:[
					{label:"首页",url:contextPath+"/homepage"},
					{label:"全球交易大数据",url:contextPath+"/dashboard/globalTrade"},
					{label:"家具交易大数据",url:contextPath+"/dashboard/globalTrade"},
					{label:"海外仓大数据",url:contextPath+"/dashboard/globalTrade"},
				]
			}
		},
		methods: {
		      
		      onMenuItemClick: function(index, indexPath) {
		    	  if(index == "0") {
		    		  window.open(this.menuList[index].url,"_self");
		    	  }
		    	  else {
		    		  window.open(this.menuList[index].url,"_blank");
		    	  }
		      },
		
			  onDataMantanceClick: function() {
				  window.open(contextPath+"/dataMantance/dataHome","_blank")
			  }
		}
		
	}).$mount("#app")
</script>