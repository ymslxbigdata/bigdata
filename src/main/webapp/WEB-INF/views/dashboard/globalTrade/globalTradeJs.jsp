<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    var app = new Vue({
        mixins: [autoScrollMixin,dateOptionsMixin],
        data: function () {
            return {
                filterYear: '',
                filterMonth: '',
                filterQuarter: '',

                tableHeight: 0,
                mapUrl: contextPath + '/dashboard/globalTrade/worldMap',
                xBorderTotalSalesUrl: contextPath + '/dashboard/globalTrade/xBorderTotalSales',
                mainStreamTotalSalesUrl: contextPath + '/dashboard/globalTrade/mainStreamTotalSales',
                mainStreamUserCnt: contextPath + '/dashboard/globalTrade/mainStreamUserCnt',
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

            retrive: function(date){

                this.getDevelopingData(date);
                this.getDevelopedData(date);
                this.getXBorderTotalSales(date);
                this.getMainStreamTotalSales(date);
                this.getMainStreamUserCnt(date);

            },

            getDevelopingData: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getDevelopingData' , {
                    date
                }).then(function(response) {

                }, function(response) {
                    errorMsg(response.body.reason);
                });
            },

            getDevelopedData: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getDevelopedData' , {
                    date
                }).then(function(response) {

                }, function(response) {
                    errorMsg(response.body.reason);
                });
            },

            getXBorderTotalSales: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getXBorderTotalSales' , date)
                    .then(function(response) {}, function(response) {errorMsg(response.body.reason);});
            },

            getMainStreamTotalSales: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getMainStreamTotalSales' , {
                    date
                }).then(function(response) {

                }, function(response) {
                    errorMsg(response.body.reason);
                });
            },

            getMainStreamUserCnt: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getMainStreamUserCnt' , {
                    date
                }).then(function(response) {

                }, function(response) {
                    errorMsg(response.body.reason);
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
        computed: {
            dateFilter: function(){
                if(this.filterMonth && this.filterYear){
                    return new Date(this.filterYear + '/' + this.filterMonth + '/01');
                }
            },
        },
        watch: {
            filterMonth(val){
                switch (val) {
                    case 1: case 2: case 3:
                        this.filterQuarter = 1;
                        break;
                    case 4: case 5: case 6:
                        this.filterQuarter = 2;
                        break;
                    case 7: case 8: case 9:
                        this.filterQuarter = 3;
                        break;
                    case 10: case 11: case 12:
                        this.filterQuarter = 4;
                        break;
                }
            },
            dateFilter(val){
                if(val){
                    this.retrieve(val);
                }
            }
        },
        mounted: function () {

            let self = this;

            this.calculateTableHeight();
            window.onresize = function () {
                self.calculateTableHeight();
            };

            // 调用混入的初始化滚动方法
            setTimeout(() => self.initScrollElement(), 800)
        },


    }).$mount("#app")

</script>