<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    var app = new Vue({
        mixins: [autoScrollMixin, dateOptionsMixin],
        data: function () {
            return {
                filterYear: '',
                filterMonth: '',
                filterQuarter: '',
                tableHeight: 0,
                mapUrl: contextPath + '/dashboard/furnitureTrade/worldMap',
                areaPlatformFurnitureSales: contextPath + '/dashboard/furnitureTrade/areaPlatformFurnitureSales',
                hotBrandRanking: contextPath + '/dashboard/furnitureTrade/hotBrandRanking',

                hotSellingOnPlatforms: [{
                    prodName: '北欧实木双人床',
                    amazon: 1000,
                    eBay: 900,
                    wish: 800,
                    ali: 800,
                    other: 1100,
                    total: 4600
                }],
                productTradingSituation: [{prodName: '床', turnover: 56000, territories: '欧洲', producingArea: '中国'}],
            }
        },

        methods: {

            getHotProductSalesData: function(){},

            getProductTradingSitu: function(){},

            getHotBrandRanking: function(){},

            getXBorderFurnitureSales: function(){},

            calculateTableHeight: function () {
                let detailAreaHeight = parseInt(getComputedStyle(document.getElementsByClassName('detail-area')[0]).height.replace('px', ''));
                this.tableHeight = Math.floor((detailAreaHeight / 3 - 12) * 0.9);
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
            setTimeout(() => self.initScrollElement(), 800);
        },

    }).$mount("#app")

</script>