<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
	 var app = new Vue({
         // 混入表格自动滚动
		mixin: [autoScrollMixin],
		data:function(){
			return{
                tableHeight: 0,
                warehouseCnt: 108,
                wareHouseData: [{platForm: 'eBay', wareHouseLoc: '香港仓', capacitance: '150000',stock: '29000', availStock: '900'}
                               ,{platForm: 'ebay', wareHouseLoc: '日本仓', capacitance: '150000',stock: '29000', availStock: '901'}],
                mapUrl: contextPath + '/dashboard/overseasTrade/worldMap',
            }
		},
		methods: {

		    retrive: function(){},

            calculateTableHeight: function(){
                let height = getComputedStyle(document.getElementById('ware-house-data-div')).height.replace('px','');
                this.tableHeight = Math.floor(height) - 2;
            },


        },
         mounted: function() {

             var self = this;
             self.calculateTableHeight();


             window.onresize = function(){
                 self.calculateTableHeight();
             };
         },
		
	}).$mount("#app")
	
</script>