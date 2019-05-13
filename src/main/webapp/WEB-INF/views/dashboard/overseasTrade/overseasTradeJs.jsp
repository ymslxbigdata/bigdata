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
                wareHouseData: [],
                mapUrl: contextPath + '/dashboard/overseasTrade/worldMap',
            }
        },
        methods: {

            retrieve: function () {
                this.getOverSeasInventoryData();
            },

            getOverSeasInventoryData: function(){
                this.$http.post(contextPath + '/dashboard/overseasTrade/getOverSeasInventoryData')
                    .then(
                        function(response){
                            console.log(response);
                        },
                        function(response){
                            errorMsg(response.body.reason);
                        }
                    )
            },

            calculateTableHeight: function () {
                let height = getComputedStyle(document.getElementById('ware-house-data-div')).height.replace('px', '');
                this.tableHeight = Math.floor(height) - 2;
            },
        },
        computed: {
            dateFilter: function(){
                if(this.filterMonth && this.filterYear){
                    return this.filterYear + '-' + this.filterMonth;
                }
            },
        },
        watch: {
            filterMonth(val) {
                switch (val) {
                    case '01':
                    case '02':
                    case '03':
                        this.filterQuarter = 1;
                        break;
                    case '04':
                    case '05':
                    case '06':
                        this.filterQuarter = 2;
                        break;
                    case '07':
                    case '08':
                    case '09':
                        this.filterQuarter = 3;
                        break;
                    case '10':
                    case '11':
                    case '12':
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
            let today = new Date();
            this.filterYear = today.getFullYear();
            this.filterMonth = today.getMonth()+1;
        },

    }).$mount("#app")

</script>