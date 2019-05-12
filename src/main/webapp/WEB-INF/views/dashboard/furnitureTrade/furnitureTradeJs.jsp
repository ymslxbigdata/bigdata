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
		
		methods: {
            // 初始化所有表格的滚动
            initScrollElement: function () {

                // 获取所有table元素
                let tableElements = document.getElementsByClassName('vue-table__body-wrapper');
                // 获取实际table body

                for (let i = 0; i < tableElements.length; i++) {

                    // 获取表格外层元素高度
                    let tableHeight = getComputedStyle(tableElements[i]).height.replace('px', '');
                    // 获取表格实际高度
                    let scrollHeight = tableElements[i].scrollHeight;
                    // 可滚动的距离 = 表格实际高度 - 表格外层元素高度
                    let scrollRange = scrollHeight - tableHeight;
                    tableElements[i].id = 'table-' + i;
                    // 绑定鼠标进入事件 → 取消滚动
                    tableElements[i].addEventListener('mouseenter', () => {
                        this.cancelAutoScroll('table-' + i)
                    });
                    // 绑定鼠标离开事件 → 继续滚动
                    tableElements[i].addEventListener('mouseleave', () => {
                        this.setAutoScroll('table-' + i, scrollRange)
                    });
                    // 设置滚动
                    this.setAutoScroll('table-' + i, scrollRange);
                }
            },

            // 取消自动滚动播放
            cancelAutoScroll: function (tableId) {
                //清除定时器以取消滚动
                clearInterval(this.intervalList[tableId]);
            },

            // 设置自动滚动播放
            setAutoScroll: function (tableId, scrollRange) {

                let speed = 100; //滚动速度
                let areaBox = document.getElementById(tableId); //外层box
                let self = this;
                setTimeout(function () {

                    //清除一遍定时器避免重复
                    self.cancelAutoScroll(tableId);
                    //创建定时器并将定时器存入集合对象
                    self.intervalList[tableId] = setInterval(function () {

                        if (areaBox.scrollTop >= (scrollRange)) {
                            areaBox.scrollTop = 0;
                        } else {
                            areaBox.scrollTop++;
                            console.log('ima: ' + areaBox.scrollTop + ' range: ' + scrollRange);
                        }
                    }, speed);
                });
            },

            calculateTableHeight: function(){
                let detailAreaHeight = parseInt(getComputedStyle(document.getElementsByClassName('detail-area')[0]).height.replace('px',''));
                this.tableHeight = Math.floor((detailAreaHeight / 3 - 12) * 0.9);
            }
        },
         mounted: function() {



             let self = this;
             this.calculateTableHeight();

             window.onresize = function(){
                 self.calculateTableHeight();
             }
             setTimeout(() => self.initScrollElement(), 800)
         },

	}).$mount("#app")
	
</script>