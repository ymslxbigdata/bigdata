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

            getHotBrandRanking: function () {

                this.$http.post(contextPath + '/dashboard/furnitureTrade/getHotBrandRanking')
                    .then(
                        function (response) {
                            let value = response.data.map(function (val) {
                                return {value: val.ratio, name: val.brandNm}
                            });
                            let chartFrame = document.getElementById('hotBrandRanking').contentWindow;
                            chartFrame.chart.setOption({
                                series: [{
                                    data: value
                                }]
                            });
                            chartFrame.autoTip(value.length)
                        },
                        function (response) {
                            errorMsg(response.body.reason);
                        })
            },

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
                            chartFrame.chart.setOption({
                                series: [{
                                    data: value
                                }]
                            });
                            chartFrame.autoTip(value.length)
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