<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	 var app = new Vue({
		
		data:function(){
			return{

                tableHeight: 0,
                mapUrl: contextPath + '/dashboard/furnitureTrade/worldMap',
                areaPlatformFurnitureSales: contextPath + '/dashboard/furnitureTrade/areaPlatformFurnitureSales',
                hotBrandRanking:  contextPath + '/dashboard/furnitureTrade/hotBrandRanking',

                hotSellingOnPlatforms:[{prodName: '北欧实木双人床', amazon: 1000, eBay: 900, wish: 800, ali: 800, other: 1100, total: 4600}],
                productTradingSituation: [{prodName: '床', turnover: 56000, territories: '欧洲', producingArea: '中国'}],
			}
		},
		
		mounted: function() {

		    let self = this;
		    this.calculateTableHeight();

            window.onresize = function(){
                self.calculateTableHeight();
            }

		},
		
		methods: {
            calculateTableHeight: function(){
                let detailAreaHeight = parseInt(getComputedStyle(document.getElementsByClassName('detail-area')[0]).height.replace('px',''));
                this.tableHeight = (detailAreaHeight / 3 - 12) * 0.9 ;
            }
        }

	}).$mount("#app")
	
</script>