<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    var app = new Vue({
        // 混入表格自动滚动
        mixins: [autoScrollMixin, dateOptionsMixin],
        data: function () {
            return {
                filterYear: '',
                filterMonth: '',
                filterQuarter: '',
                tableHeight: 0,
                warehouseCnt: 108,
                wareHouseData: [{
                    platForm: 'eBay',
                    wareHouseLoc: '香港仓',
                    capacitance: '150000',
                    stock: '29000',
                    availStock: '900'
                }
                    , {
                        platForm: 'ebay',
                        wareHouseLoc: '日本仓',
                        capacitance: '150000',
                        stock: '29000',
                        availStock: '901'
                    }],
                mapUrl: contextPath + '/dashboard/overseasTrade/worldMap',
            }
        },
        methods: {

            retrieve: function () {

            },

            getOverSeasInventoryCnt: function(){},

            getOverSeasInventoryData: function(){},

            calculateTableHeight: function () {
                let height = getComputedStyle(document.getElementById('ware-house-data-div')).height.replace('px', '');
                this.tableHeight = Math.floor(height) - 2;
            },
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

            var self = this;

            self.calculateTableHeight();
            window.onresize = function () {
                self.calculateTableHeight();
            };

            setTimeout(() => self.initScrollElement(), 800);
        },

    }).$mount("#app")

</script>