<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    var app = new Vue({
        mixins: [autoScrollMixin, dateOptionsMixin, numberFormatMixin],
        data: function () {
            return {
                filterYear: '',
                filterMonth: '',
                filterQuarter: '',

                // 当前时间
                curDate: getDateYYYYMMDDStringCH(new Date()),
                curTime: getDateHHmmSSStringCH(new Date()),

                tradeAndUserData: {},
                geoCoordMap: {},
                mapUrl: contextPath + '/dashboard/globalTrade/worldMap',
                xBorderTotalSalesUrl: contextPath + '/dashboard/globalTrade/xBorderTotalSales',
                mainStreamTotalSalesUrl: contextPath + '/dashboard/globalTrade/mainStreamTotalSales',
                mainStreamUserCntUrl: contextPath + '/dashboard/globalTrade/mainStreamUserCnt',
                developingCountryData: [],
                developedCountryData: [],

                tableHeight: 0,
                
                //图表加载完成标志
                isWordMapLoadFinished: false,
                isAreaEshopTradeLoadFinish: false,
                isMainEshopTradeLoadFinish: false,
                isMainEshopUserLoadFinish: false,
            }
        },

        methods: {

            retrieve: function(date){

                let self = this;

                this.getDevelopingData(date);
                this.getMapData(date);
                this.getDevelopedData(date);
                this.getXBorderTotalSales(date);
                this.getMainStreamTotalSales(date);
                setTimeout((date)=>self.getMainStreamUserCnt(date),100);

                setTimeout(()=>self.initScrollElement(),300)
            },

            // 获取地图所需数据
            getMapData: async function(date){

                // 获取电商交易总额及用户数
                await this.getEshopUserAndTradeData(date);
                // 获取电商海外仓坐标
                await this.getRepoCoordData();
                
                let self = this;
                
                let chartFrame = document.getElementsByClassName('map-frame')[0].contentWindow;
                chartFrame.onload = function(){ 
                	self.isWordMapLoadFinished = true;
            		 chartFrame.tradeAndUserData = self.tradeAndUserData;
                     chartFrame.chart.setOption({series: [{
                             data: chartFrame.convertData(self.tradeAndUserData, self.geoCoordMap)
                     }]});
                };
                
                if(self.isWordMapLoadFinished){
                	chartFrame.tradeAndUserData = self.tradeAndUserData;
                    chartFrame.chart.setOption({series: [{
                            data: chartFrame.convertData(self.tradeAndUserData, self.geoCoordMap)
                    }]});
                }
                
            },

            getEshopUserAndTradeData: async function(date){

                let self = this;
                var tradeAndUserData = [];
                self.tradeAndUserData = [];
                await self.$http.post(contextPath + '/dashboard/globalTrade/getMainStreamShopData', date)
                    .then(function(response) {
                        tradeAndUserData = response.body.map(
                            function(val) {
                                return {
                                    eshopNm: val[1],
                                    tradeData:val[3],
                                    userData: val[4]
                                }
                            }
                        );
                        self.tradeAndUserData = tradeAndUserData;
                    }, function(response) {
                        errorMsg(response.body.reason);
                    });
            },

            getRepoCoordData : async function(){

                let self = this;
                var geoCoordMap = {};
                self.geoCoordMap = {};
                await self.$http.post(contextPath + '/dashboard/globalTrade/getRepoLocation')
                .then(function(response) {
                    for (i = 0; i < response.data.length; i++) {
                        geoCoordMap[response.data[i][1].toString()] = [ parseInt(response.data[i][2]), parseInt(response.data[i][3])]
                    }
                    self.geoCoordMap = geoCoordMap;
                }, function(response) {
                    errorMsg(response.body.reason);
                });
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
                        chartFrame.onload = function() {
                        	self.isAreaEshopTradeLoadFinish = true;
                        	chartFrame.chart.setOption({series: [{data: result}]});
                        	chartFrame.autoTip(7);
                        };
                        if(self.isAreaEshopTradeLoadFinish) {
                        	chartFrame.chart.setOption({series: [{data: result}]});
                        }
                        
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
                    chartFrame.onload = function() {
                    	self.isMainEshopTradeLoadFinish = true;
                    	chartFrame.chart.setOption({series: [{data: result}]});
                    	chartFrame.autoTip(result.length);
                    };
                    if(self.isMainEshopTradeLoadFinish) {
                    	chartFrame.chart.setOption({series: [{data: result}]});
                    }
                   
                }, function(response) {
                    errorMsg(response.body.reason);
                });
            },

            // 主流跨境电商平台用户数
            getMainStreamUserCnt: function(){

                let self = this;
                self.$http.post(contextPath + '/dashboard/globalTrade/getMainStreamUserCnt'

                ).then(function(response) {
                    let platForm =  response.data.map(function(val){return val[0]});
                    let userData = response.data.map(function(val,i){return [i,0,val[1]]});
                    let chartFrame = document.getElementById('mainStreamUserCnt').contentWindow;
                    chartFrame.onload = function() {
                    	self.isMainEshopUserLoadFinish = true;
                    	 chartFrame.chart.setOption(
                                 {
                                     xAxis3D:{
                                         data: platForm
                                     },
                                     series: [{
                                         data: userData
                                     }]
                                 }
                             );
                    };
                    if(self.isMainEshopUserLoadFinish) {
                    	 chartFrame.chart.setOption(
                                 {
                                     xAxis3D:{
                                         data: platForm
                                     },
                                     series: [{
                                         data: userData
                                     }]
                                 }
                             );
                    }
                    
                   
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
            eshopUserCnt: function(){

                if(this.developedCountryData && this.developingCountryData){

                    let result = 0;

                    for(let i = 0; i < this.developedCountryData.length; i++){
                        result = result + this.developedCountryData[i].userCnt;
                    }
                    for(let i = 0; i < this.developingCountryData.length; i++){
                        result = result + this.developingCountryData[i].userCnt;
                    }
                    return this.formatNumber(result.toString());
                }
            },
            eshopTotalSales: function(){

                if(this.developedCountryData && this.developingCountryData){

                    let result = 0;

                    for(let i = 0; i < this.developedCountryData.length; i++){
                        result = result + this.developedCountryData[i].totalSales;
                    }
                    for(let i = 0; i < this.developingCountryData.length; i++){
                        result = result + this.developingCountryData[i].totalSales;
                    }

                    return this.formatNumber(result.toString());
                }
            },
        },
        watch: {
            filterMonth(val){
                switch (val) {
                    case '01': case '02': case '03':
                        this.filterQuarter = "第一季度";
                        break;
                    case '04': case '05': case '06':
                        this.filterQuarter = "第二季度";
                        break;
                    case '07': case '08': case '09':
                        this.filterQuarter = "第三季度";
                        break;
                    case '10': case '11': case '12':
                        this.filterQuarter = "第四季度";
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
            setTimeout(()=>{
                self.filterYear = today.getFullYear();
                self.filterMonth = self.months[today.getMonth()].index;
            },800);

            setInterval(function() {
                self.curDate = getDateYYYYMMDDStringCH(new Date());
            }, 360000);
            setInterval(function() {
                self.curTime = getDateHHmmSSStringCH(new Date());
            }, 1000);

        },

    }).$mount("#app")

</script>