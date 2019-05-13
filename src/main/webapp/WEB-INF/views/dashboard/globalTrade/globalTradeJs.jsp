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
                mainStreamUserCntUrl: contextPath + '/dashboard/globalTrade/mainStreamUserCnt',
                developingCountryData: [],
                developedCountryData: [],
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

                self.$http.post(contextPath + '/dashboard/globalTrade/getDevelopingData' ,
                    date
                ).then(function(response) {
                    result = response.data.map(function(val){
                        return {platForm: val[0], userCnt: val[1], totalSales: val[2]}
                    });
                    self.developingCountryData = result;
                }, function(response) {
                    errorMsg(response.body.reason);
                });
            },

            getDevelopedData: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getDevelopedData' ,
                    date
                ).then(function(response) {
                    result = response.data.map(function(val){
                        return {platForm: val[0], userCnt: val[1], totalSales: val[2]}
                    });
                    self.developedCountryData = result;
                }, function(response) {
                    errorMsg(response.body.reason);
                });
            },

            getXBorderTotalSales: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getXBorderTotalSales' , date)
                    .then(function(response) {

                        let result = response.data[0];
                        debugger;
                        let chartFrame = document.getElementById('xBorderTotalSales').contentWindow;
                        this.$nextTick(()=>{
                            chartFrame.totalSalesChart.setOption({series: [{
                                    data: result
                                }]});
                        });
                        console.log(result)
                    }, function(response) {
                        errorMsg(response.body.reason);
                    });
            },

            getMainStreamTotalSales: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getMainStreamTotalSales' ,
                    date
                ).then(function(response) {

                }, function(response) {
                    errorMsg(response.body.reason);
                });
            },

            getMainStreamUserCnt: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getMainStreamUserCnt' ,
                    date
                ).then(function(response) {

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
                    return this.filterYear + '-' + this.filterMonth ;
                }
            },
        },
        watch: {
            filterMonth(val){
                switch (val) {
                    case '01': case 2: case 3:
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
                    this.retrive(val);
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