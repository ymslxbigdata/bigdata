<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    var app = new Vue({
        mixins: [autoScrollMixin,dateOptionsMixin],
        data: function () {
            return {
                filterYear: '',
                filterMonth: '',
                filterQuarter: '',

                mapUrl: contextPath + '/dashboard/globalTrade/worldMap',
                xBorderTotalSalesUrl: contextPath + '/dashboard/globalTrade/xBorderTotalSales',
                mainStreamTotalSalesUrl: contextPath + '/dashboard/globalTrade/mainStreamTotalSales',
                mainStreamUserCntUrl: contextPath + '/dashboard/globalTrade/mainStreamUserCnt',
                developingCountryData: [],
                developedCountryData: [],

                tableHeight: 0,
            }
        },

        methods: {

            retrieve: function(date){

                let self = this;

                this.getDevelopingData(date);
                this.getDevelopedData(date);
                this.getXBorderTotalSales(date);
                this.getMainStreamTotalSales(date);
                this.getMainStreamUserCnt(date);
                setTimeout(()=>self.initScrollElement(),300)
            },

            // 获取发展中国家交易数据
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

            // 获取发达国家交易数据
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

            // 获取跨境电商平台交易额
            getXBorderTotalSales: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getXBorderTotalSales' , date)
                    .then(function(response) {

                        let result = response.data[0];
                        let chartFrame = document.getElementById('xBorderTotalSales').contentWindow;
                        chartFrame.chart.setOption({series: [{
                                data: result
                            }]});
                    }, function(response) {
                        errorMsg(response.body.reason);
                    });
            },

            // 获取主流跨境电商平台交易额
            getMainStreamTotalSales: function(date){

                let self = this;
                self.$http.post(contextPath + '/dashboard/globalTrade/getMainStreamTotalSales' ,
                    date
                ).then(function(response) {
                    let result = response.data.map(function(val){ return {value: val[1], name: val[0]}});
                    let chartFrame = document.getElementById('mainStreamTotalSales').contentWindow;
                    chartFrame.chart.setOption({series: [{
                            data: result
                    }]});
                }, function(response) {
                    errorMsg(response.body.reason);
                });
            },

            getMainStreamUserCnt: function(date){

                let self = this;

                self.$http.post(contextPath + '/dashboard/globalTrade/getMainStreamUserCnt'

                ).then(function(response) {
                    console.log(response);
                    let platForm =  response.data.map(function(val){return val[0]});
                    let userData = response.data.map(function(val,i){return [i,0,val[1]]});

                    let chartFrame = document.getElementById('mainStreamUserCnt').contentWindow;
                    chartFrame.chart.setOption(
                        {
                            xAxis3D:{
                                data: platForm
                            },
                            series: [{
                                data: userData
                        }
                        ]});
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
                    case '01': case '02': case '03':
                        this.filterQuarter = 1;
                        break;
                    case '04': case '05': case '06':
                        this.filterQuarter = 2;
                        break;
                    case '07': case '08': case '09':
                        this.filterQuarter = 3;
                        break;
                    case '10': case '11': case '12':
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
            setTimeout(() => self.initScrollElement(), 800);

            let today = new Date();
            this.filterYear = today.getFullYear();
            this.filterMonth = today.getMonth()+1;
        },


    }).$mount("#app")

</script>