<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<script>
    var app = new Vue({
        // 混入表格自动滚动
        mixins: [autoScrollMixin, dateOptionsMixin],

        data: function () {

            return {

                filterPlatForm: '',
                platFormList:[],
                warehouseCnt: 0,
                wareHouseData: [],
                mapUrl: contextPath + '/dashboard/overseasTrade/worldMap',
                wordMapData: {},
                geoCoordMap: {},
                tableHeight: 0,
                
  				isWordMapLoadFinished:false,
            }
        },

        methods: {

            retrieve: function () {
                let self = this;

                this.getPlatFormList();
                this.getOverSeasInventoryData();
                setTimeout(() => self.initScrollElement(), 800);
            },

            getPlatFormList: function(){

                let self = this;

                this.$http.post(contextPath + '/dashboard/overseasTrade/getPlatFormList')
                    .then(
                        function(response){
                            self.platFormList = response.body;
                        },
                        function(response){
                            errorMsg(response.body.reason);
                        }
                    )
            },
            
            // 获取海外仓表格数据  计算海外仓个数
            getOverSeasInventoryData: function(){

                let self = this;
                let eshopId = this.filterPlatForm? this.filterPlatForm:'findAll';

                this.$http.post(contextPath + '/dashboard/overseasTrade/getOverSeasInventoryData', eshopId)
                .then(
                    function(response){
                        let result = 0;
                        self.wareHouseData = response.body;
                        /* for(let i in response.body){
                            result = result + parseInt(response.body[i].overseasRepo)
                        } */
                        // 计算海外仓个数
                        self.warehouseCnt = self.wareHouseData.length;
                        
                        self.geoCoordMap = {};
                        for(var item in this.platFormList) {
                        	if (response.body.length == 0) break;
                        	if(this.platFormList[item].eshopNm == response.body[0].eshopNm) {
                        		self.geoCoordMap[response.body[0].eshopNm] = [this.platFormList[item].locationX,this.platFormList[item].locationY];
                        		break;
                        	}	
                        }
                        
                        response.body.forEach(function(item) {
                        	self.geoCoordMap[item.overseasRepo] = [ item.repoLocationX, item.repoLocationY]
                        });
                        
                        self.wordMapData = {eshopNm:'',value:[]};
                        response.body.forEach(function(item) {
                        	self.wordMapData.eshopNm = item.eshopNm;
                        	self.wordMapData.value.push({"repoNm":item.overseasRepo,"opacity":item.capacity,"tatolStock":item.totalStock,"useableStock":item.useabelStock})
                        });
                        
                        self.initWordMap();
                    }, 
                    function(response){
                        errorMsg(response.body.reason);
                    }
                )
            },
            
            initWordMap: function() {
            	
            	let self = this;
            	let chartFrame = document.getElementsByClassName('map-frame')[0].contentWindow;
            	chartFrame.onload = function(){ 
            		self.isWordMapLoadFinished = true;
            		chartFrame.overseasRepoData = self.wordMapData;
                    chartFrame.geoCoordMap = self.geoCoordMap;
                    chartFrame.refreshData(); 
                };  
                
                if(self.isWordMapLoadFinished) {
                	chartFrame.overseasRepoData = self.wordMapData;
                    chartFrame.geoCoordMap = self.geoCoordMap;
                    chartFrame.refreshData();
                }
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
            filterPlatForm(val){
                this.getOverSeasInventoryData();
            }
        },
        mounted: function () {

            let self = this;

            self.calculateTableHeight();
            window.onresize = function () {
                self.calculateTableHeight();
            };

            this.retrieve();
        },
    }).$mount("#app")
</script>