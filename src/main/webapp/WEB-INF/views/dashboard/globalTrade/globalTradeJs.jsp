<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    var app = new Vue({

        data: function () {
            return {
                tableHeight: 0,

                mapUrl: contextPath + '/dashboard/globalTrade/worldMap',
                xBorderTotalSalesUrl: contextPath + '/dashboard/globalTrade/xBorderTotalSales',
                mainStreamTotalSalesUrl: contextPath + '/dashboard/globalTrade/mainStreamTotalSales',
                mainStreamUserCnt: contextPath + '/dashboard/globalTrade/mainStreamUserCnt',
                intervalList: [],
                developingCountry: [{platForm: '阿里巴巴', userCnt: '1500万', totalSales: '56839亿美元'}
                    , {platForm: '亚马逊', userCnt: '1200万', totalSales: '36800亿美元'}
                    , {platForm: 'eBay', userCnt: '900万', totalSales: '32800亿美元'}
                    , {platForm: 'wish', userCnt: '800万', totalSales: '30800亿美元'}
                    , {platForm: '123', userCnt: '9020万', totalSales: '328400亿美元'}
                    , {platForm: '33', userCnt: '8001万', totalSales: '308200亿美元'}
                    , {platForm: '22', userCnt: '9030万', totalSales: '328200亿美元'}
                    , {platForm: '31243', userCnt: '80qwt01万', totalSales: '3082wtq00亿美元'}
                    , {platForm: '21552', userCnt: '90qwt30万', totalSales: '3282q00亿美元'}
                    , {platForm: '3tw3', userCnt: '8001qwt万', totalSales: '30820qwt0亿美元'}
                    , {platForm: '2wrq2', userCnt: '90qwt30万', totalSales: '328200qwt亿美元'}
                    , {platForm: '11', userCnt: '2', totalSales: '30800亿美元'}],
                developedCountry: [{platForm: '亚马逊', userCnt: '1900万', totalSales: '196800亿美元'}
                    , {platForm: 'eBay', userCnt: '900万', totalSales: '86800亿美元'}
                    , {platForm: '阿里巴巴', userCnt: '800万', totalSales: '56839亿美元'}
                    , {platForm: 'wish', userCnt: '700万', totalSales: '48800亿美元'}]
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


            calculateTableHeight: function () {
                // 高度等于父容器 - 标题高度(35px) - padding值(2px)
                this.tableHeight = Math.floor(getComputedStyle(document.getElementsByClassName('data-panel')[0]).height.replace('px', '') - 35 - 2);
            },

            calculateChartHeight: function () {
                let detailAreaHeight = parseInt(getComputedStyle(document.getElementsByClassName('detail-area')[0]).height.replace('px', ''));
                this.tablePanelHeight = Math.floor((detailAreaHeight / 3 - 12) * 0.9);
            }
        },

        mounted: function () {

            let self = this;

            this.calculateTableHeight();

            window.onresize = function () {
                self.calculateTableHeight();
            };

            setTimeout(() => self.initScrollElement(), 800)
        },


    }).$mount("#app")

</script>