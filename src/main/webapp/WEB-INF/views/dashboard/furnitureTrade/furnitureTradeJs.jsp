<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    // TODO: 修改var app 为 let app, 提高安全性
    var app = new Vue({
        mixins: [autoScrollMixin, dateOptionsMixin],
        data: function () {
            return {
                filterYear: '',
                filterMonth: '',
                filterQuarter: '',

                selectedFurnitureTypeId: "",
                furnitureTypeList: [],

                tableHeight: 0,
                mapUrl: contextPath + '/dashboard/furnitureTrade/worldMap',
                areaPlatformFurnitureSales: contextPath + '/dashboard/furnitureTrade/areaPlatformFurnitureSales',
                hotBrandRanking: contextPath + '/dashboard/furnitureTrade/hotBrandRanking',

                hotSellingOnPlatforms: [],
                productTradingSituation: [{prodName: '', turnover: 0, territories: '', producingArea: ''}],
                
                isHotBrandRankingLoadFinish: false,
            	isFurAreaTradeLoadFinish: false,
            	
            	hotFurnitureEshop: ['亚马逊','ebay','wish','阿里巴巴'],
            	hotFurnitureEshopData: [],
            	
            	tradeAndUserData: {},
                geoCoordMap: {},
            }
        },

        methods: {

            retrieve: function (tradeDate) {

                let self = this;

                this.getHotProductSalesData(tradeDate);
                this.getProductTradingSitu(tradeDate);
                this.getHotBrandRanking(tradeDate);
                this.getAreaPlatformFurnitureSales(tradeDate);
                setTimeout(() => self.initScrollElement(), 300)
            },
            
            // 获取地图所需数据
            getMapData: async function(date){

                // 获取电商交易总额及用户数
                await this.getEshopUserAndTradeData(date);
                // 获取电商海外仓坐标
                await this.getHotFurnitureEshopData();
                
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
            
            // 获取电商平
            getEshopUserAndTradeData: function() {
            	
            },
            
            // 获取电商平台地理坐标
            getHotFurnitureEshopData: async function() {
            	
            	let self = this;
            	self.geoCoordMap = {};	
            	
            	await this.$http.post(contextPath + '/dashboard/furnitureTrade/getHotFurnitureEshopData',self.hotFurnitureEshop).then(
            		function(response){
            			self.hotFurnitureEshopData = response.data;
            			self.hotFurnitureEshopData.forEach(function(item){
            				self.geoCoordMap[item.eshopNm] = [item.locationX, item.locationY];
            			})
            		},
            		function(response) {
            			errorMsg(response.body.reason);
            		}
            		
            	);
            },

            getProductTypeList: function () {

                let self = this;
                this.$http.post(contextPath + '/dashboard/furnitureTrade/getProductTypeList')
                    .then(
                        function (response) {
                            self.furnitureTypeList = response.body;
                        },
                        function (response) {
                            errorMsg(response.body.reason);
                        }
                    )
            },

            // 热销产品各平台交易数据
            getHotProductSalesData: function (tradeDate) {

                let self = this;
                this.$http.post(contextPath + '/dashboard/furnitureTrade/getHotProductSalesData',
                    [tradeDate, !!self.selectedFurnitureTypeId ? self.selectedFurnitureTypeId : '']
                )
                    .then(
                        function (response) {
                            self.hotSellingOnPlatforms = response.body;
                        },
                        function (response) {
                            errorMsg(response.body.reason);
                        })
            },

            getProductTradingSitu: function (tradeDate) {

                let self = this;

                this.$http.post(contextPath + '/dashboard/furnitureTrade/getHotProductSalesData',
                    [tradeDate, !!self.selectedFurnitureTypeId ? self.selectedFurnitureTypeId : '']
                )
                    .then(
                        function (response) {
                            self.productTradingSituation = response.body;
                        },
                        function (response) {
                            errorMsg(response.body.reason);
                        })

            },
			// 热销品牌排行数据
            getHotBrandRanking: function () {

            	let self =  this;
                this.$http.post(contextPath + '/dashboard/furnitureTrade/getHotBrandRanking')
                    .then(
                        function (response) {
                            let value = response.data.map(function (val) {
                                return {value: val.ratio, name: val.brandNm}
                            });
                            let chartFrame = document.getElementById('hotBrandRanking').contentWindow;
                            chartFrame.onload = function() {
                            	self.isHotBrandRankingLoadFinish = true;
                            	chartFrame.chart.setOption({
                                    series: [{
                                        data: value
                                    }]
                                });
                                chartFrame.autoTip(value.length)
                            }
                            if(self.isHotBrandRankingLoadFinish) {
                            	chartFrame.chart.setOption({
                                    series: [{
                                        data: value
                                    }]
                                });
                            }
                            
                        },
                        function (response) {
                            errorMsg(response.body.reason);
                        })
            },
			
            // 各地区交易数据
            getAreaPlatformFurnitureSales: function (tradeDate) {
                this.$http.post(contextPath + '/dashboard/furnitureTrade/getAreaPlatformFurnitureSales',tradeDate)
                    .then(
                        function (response) {
                            let rawData = response.data[0];
                            let value = [];
                            for(let i in rawData){
                                if(i === 'tradeDate')continue;
                                else{
                                    value.push(rawData[i])
                                }
                            }
                            let chartFrame = document.getElementById('areaPlatformFurnitureSales').contentWindow;
                            chartFrame.onload = function() {
                            	isFurAreaTradeLoadFinish = true;
                            	chartFrame.chart.setOption({
                                    series: [{
                                        data: value
                                    }]
                                });
                                chartFrame.autoTip(value.length)
                            }
                            if(isFurAreaTradeLoadFinish) {
                            	chartFrame.chart.setOption({
                                    series: [{
                                        data: value
                                    }]
                                });
                            }
                            
                        },
                        function (response) {
                            errorMsg(response.body.reason);
                        })
            },
            
            calculateTableHeight: function () {
                let detailAreaHeight = parseInt(getComputedStyle(document.getElementsByClassName('detail-area')[0]).height.replace('px', ''));
                this.tableHeight = Math.floor((detailAreaHeight / 3 - 12) * 0.9);
            }
        },
        computed: {
            dateFilter: function () {
                if (this.filterMonth && this.filterYear) {
                    return this.filterYear + '-' + this.filterMonth;
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
            dateFilter(val) {
                if (val) {
                    this.retrieve(val);
                }
            },
            selectedFurnitureTypeId() {
                this.getHotProductSalesData(this.dateFilter);
                this.getProductTradingSitu(this.dateFilter);
            }
        },
        mounted: function () {

            let self = this;
            this.calculateTableHeight();
            this.getProductTypeList();
            this.getHotFurnitureEshopData();
            window.onresize = function () {
                self.calculateTableHeight();
            };
            setTimeout(() => self.initScrollElement(), 800);

            let today = new Date();
            this.filterYear = today.getFullYear();
            this.filterMonth = this.months[today.getMonth()].index;

        },

    }).$mount("#app")

</script>