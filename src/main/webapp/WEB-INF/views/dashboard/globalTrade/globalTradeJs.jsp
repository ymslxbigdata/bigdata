<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	 var app = new Vue({
		
		data:function(){
			return{
                tableHeight: 0,

                mapUrl: contextPath + '/dashboard/worldMap',
                xBorderTotalSalesUrl: contextPath + '/dashboard/xBorderTotalSales',
                mainStreamTotalSalesUrl: contextPath + '/dashboard/mainStreamTotalSales',
                mainStreamUserCnt: contextPath + '/dashboard/mainStreamUserCnt',


			    developingCountry: [{platForm:'阿里巴巴',userCnt: '1500万', totalSales:'56839亿美元'}
                                    ,{platForm:'亚马逊',userCnt: '1200万', totalSales:'36800亿美元'}
                                    ,{platForm:'eBay',userCnt: '900万', totalSales:'32800亿美元'}
                                    ,{platForm:'wish',userCnt: '800万', totalSales:'30800亿美元'}
                                    ,{platForm:'123',userCnt: '9020万', totalSales:'328400亿美元'}
                                    ,{platForm:'33',userCnt: '8001万', totalSales:'308200亿美元'}
                                    ,{platForm:'22',userCnt: '9030万', totalSales:'328200亿美元'}
                                    ,{platForm:'31243',userCnt: '80qwt01万', totalSales:'3082wtq00亿美元'}
                                    ,{platForm:'21552',userCnt: '90qwt30万', totalSales:'3282q00亿美元'}
                                    ,{platForm:'3tw3',userCnt: '8001qwt万', totalSales:'30820qwt0亿美元'}
                                    ,{platForm:'2wrq2',userCnt: '90qwt30万', totalSales:'328200qwt亿美元'}
                                    ,{platForm:'11',userCnt: '2', totalSales:'30800亿美元'}],
                developedCountry: [{platForm:'亚马逊',userCnt: '1900万', totalSales:'196800亿美元'}
                                    ,{platForm:'eBay',userCnt: '900万', totalSales:'86800亿美元'}
                                    ,{platForm:'阿里巴巴',userCnt: '800万', totalSales:'56839亿美元'}
                                    ,{platForm:'wish',userCnt: '700万', totalSales:'48800亿美元'}]
			}
		},

		methods: {

		    calculateTableHeight: function(){
                // 高度等于父容器 - 标题高度(35px) - padding值(2px)
                this.tableHeight = getComputedStyle(document.getElementsByClassName('data-panel')[0]).height.replace('px','') - 35 - 2;
            },

            calculateChartHeight: function(){
                let detailAreaHeight = parseInt(getComputedStyle(document.getElementsByClassName('detail-area')[0]).height.replace('px',''));
                this.tablePanelHeight = (detailAreaHeight / 3 - 12) * 0.9 ;
            }

		},

         mounted: function() {

             let self = this;
             // this.drawMap();

             this.calculateTableHeight();

             window.onresize = function(){
                 self.calculateTableHeight();
             }
         },


     }).$mount("#app")
	
</script>