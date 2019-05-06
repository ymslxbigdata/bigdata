<script>
	 var app = new Vue({
		
		data:function(){
			return{				
			    
			}
		},
		
		mounted: function() {
			this.drawMap();
		},
		
		methods: {
			
			drawMap: function() {
				let wordMap = echarts.init(document.getElementById('wordMap'));
				let option = {
				    geo: {
				        map: 'world',
				        roam: true,     //开启鼠标缩放和平移
				        aspectScale: 0.75,
				        zoom: 1.2,

				        //地图的文本标签样式
				        label: {
				        	   //高亮样式
				            emphasis: {
				                show: true,
				                color:'#ffffff'
				            }
				        },
				        
				        //地图区域的图形样式
				        itemStyle: {
				            normal: {
				                areaColor: '#38547e',    //区域颜色
				                borderColor: '#1088C3',  //边框颜色
				                borderWidth: 1           //边框线宽
				            },
				            emphasis: {
				                areaColor: '#1A2960'
				            }
				        },

				        //特定区域设定
				        regions: [{name: 'China',itemStyle: {areaColor: 'blue',color: 'red'} }],
				    },
				    
				    tooltip: {
				    	show: true,
				    	trigger: "item",
				    	backgroundColor: "#1540a1",
				    	showDelay: 0,
				    deDelay: 0,
				    }
				};
				wordMap.setOption(option);
				window.addEventListener('resize',function() {wordMap.resize()});

			}
		}
		
	}).$mount("#app")
	
</script>