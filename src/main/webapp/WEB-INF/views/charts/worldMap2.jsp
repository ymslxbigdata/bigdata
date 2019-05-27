<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<div id="worldMap" class="width-100 height-100" onload="drawMap()"></div>
<script>

    var globalCountry = [
        {
            area: 'asia',
            color: '#17324d',
            countrys: ['China', 'Mongolia', 'Dem. Rep. Korea', 'Korea', 'Japan', 'Philippines', 'Vietnam', 'Lao PDR', 'Cambodia', 'Myanmar', 'Thailand', 'Malaysia', 'Brunei', 'Singapore', 'Indonesia', 'Timor-Leste', 'Nepal', 'Bhutan', 'Bangladesh', 'India', 'Pakistan', 'Sri Lanka', 'Kazakhstan', 'Kyrgyzstan', 'Tajikistan', 'Uzbekistan', 'Turkmenistan', 'Afghanistan', 'Iraq', 'Iran', 'Syria', 'Jordan', 'Lebanon', 'Israel', 'Palestine', 'Saudi Arabia', 'Bahrain', 'Qatar', 'Kuwait', 'United Arab Emirates', 'Oman', 'Yemen', 'Georgia', 'Armenia', 'Azerbaijan', 'Turkey', 'Cyprus']
        },
        {
            area: 'europe',
            color: '#994C52',
            countrys: ['Finland', 'Sweden', 'Norway', 'Iceland', 'Denmark', 'Estonia', 'Latvia', 'Lithuania', 'Belarus', 'Russia', 'Ukraine', 'Moldova', 'Poland', 'Czech Rep.', 'Slovakia', 'Hungary', 'Germany', 'Austria', 'Switzerland', 'Liechtenstein', 'United Kingdom', 'Ireland', 'Netherlands', 'Belgium', 'Luxembourg', 'France', 'Romania', 'Bulgaria', 'Serbia', 'Macedonia', 'Albania', 'Greece', 'Slovenia', 'Croatia', 'Montenegro', 'Bosnia and Herz.', 'Italy', 'Malta', 'Spain', 'Portugal', 'Andorra']
        },
        {
            area: 'africa',
            color: '#DA742C',
            countrys: ['Zambia', 'Egypt', 'Libya', 'Cote dIvoire', 'Nigeria', 'Sudan', 'S. Sudan', 'Tunisia', 'Algeria', 'Morocco', 'Ethiopia', 'Eritrea', 'Somalia', 'Djibouti', 'Kenya', 'Tanzania', 'Uganda', 'Rwanda', 'Burundi', 'Seychelles', 'Chad', 'Central African Rep.', 'Cameroon', 'Gabon', 'Congo', 'Dem. Rep. Congo', 'Mauritania', 'W. Sahara', 'Senegal', 'Mali', 'Burkina Faso', 'Guinea', 'Guinea-Bissau', 'Sierra Leone', 'Liberia', 'Ghana', 'Togo', 'Benin', 'Niger', 'Angola', 'Zimbabwe', 'Malawi', 'Mozambique', 'Botswana', 'Namibia', 'South Africa', 'Swaziland', 'Lesotho', 'Madagascar', 'Comoros', 'Mauritius', 'Saint Helena']
        },
        {
            area: 'dayang',
            color: '#E6B451',
            countrys: ['Australia', 'New Zealand', 'Papua New Guinea', 'Solomon Is.', 'Vanuatu', 'Micronesia', 'Palau', 'Kiribati', 'Samoa', 'Tonga', 'New Caledonia', 'Fr. Polynesia', 'Niue', 'American Samoa', 'N. Mariana Is.']
        },
        {
            area: 'namerica',
            color: '#E2E6C3',
            countrys: ['Canada', 'Greenland', 'United States', 'Mexico', 'Guatemala', 'Belize', 'El Salvador', 'Honduras', 'Nicaragua', 'Costa Rica', 'Panama', 'Bahamas', 'Cuba', 'Jamaica', 'Haiti', 'Dominica', 'Antigua and Barb.', 'Saint Lucia', 'St. Vin. and Gren.', 'Grenada', 'Barbados', 'Trinidad and Tobago', 'Puerto Rico', 'U.S. Virgin Is.', 'Montserrat', 'Turks and Caicos Is.', 'Cayman Is.', 'Bermuda']
        },
        {
            area: 'samerica',
            color: '#764D39',
            countrys: ['Colombia', 'Venezuela', 'Guyana', 'Suriname', 'Ecuador', 'Peru', 'Bolivia', 'Brazil', 'Chile', 'Argentina', 'Uruguay', 'Paraguay']
        }
    ];
    var region = new Array();
    globalCountry.forEach(function (area) {
        area.countrys.forEach(function (country) {
            region.push({name: country, itemStyle: {areaColor: area.color, color: 'red'}});
        });
    });

    var geoCoordMap = {};
    var overseasRepoData = {eshopNm:'',value:[]};
    
    /* var geoCoordMap = {
	 		"阿里巴巴":[100.23,37.35],
	 		"亚马逊":[111.22,10.11],
	 		"俄罗斯":[101.981363,64.880159],
	 		"澳大利亚":[134.066249,-24.657257],
	 		"加拿大":[-111.316897,57.535082],
	 		"美国":[-98.3652,40.937553],
	 	};

	 	var overseasRepoData = {
	 		eshopNm:"阿里巴巴",
	 		value:[
	 			{repoNm:'俄罗斯',opacity:10000,tatolStock:2222,useableStock:4444},
	 			{repoNm:'澳大利亚',opacity:10000,tatolStock:2222,useableStock:4444},
	 			{repoNm:'加拿大',opacity:10000,tatolStock:2222,useableStock:4444},
	 			{repoNm:'美国',opacity:10000,tatolStock:2222,useableStock:4444},
	 		]
	 	}; */

    var convertData = function (data) {
        
        var res = [];
        var fromCoord = geoCoordMap[data.eshopNm];

        for (var i = 0; i < data.value.length; i++) {
        	var dataItem = data.value[i];
            var toCoord = geoCoordMap[dataItem.repoNm];
            if (fromCoord && toCoord[0] && toCoord[1]) {
                res.push({
                    fromName:data.eshopNm,
                    toName:dataItem.repoNm,
                    coords:[fromCoord,toCoord],
                    value:dataItem
                });
            }
        }
        return res;
    };
    
    var convertData2 = function() {
    	var data = [];
    	var repoValue =  overseasRepoData.value;
    	for(var i in repoValue) {
    		if(geoCoordMap[repoValue[i].repoNm][0]==null || geoCoordMap[repoValue[i].repoNm][1]==null){
    			continue;
    		}
    		else {
    			data.push({"name":repoValue[i].repoNm,"value":geoCoordMap[repoValue[i].repoNm].concat(repoValue[i])})
    		}
    	}
    	return data;
    };
    
    var planePath = 'path://M1705.06,1318.313v-89.254l-319.9-221.799l0.073-208.063c0.521-84.662-26.629-121.796-63.961-121.491c-37.332-0.305-64.482,36.829-63.961,121.491l0.073,208.063l-319.9,221.799v89.254l330.343-157.288l12.238,241.308l-134.449,92.931l0.531,42.034l175.125-42.917l175.125,42.917l0.531-42.034l-134.449-92.931l12.238-241.308L1705.06,1318.313z';

    var chart = echarts.init(document.getElementById('worldMap'));
    var option = {
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
                    color: '#ffffff'
                }
            },
            //地图区域的图形样式
            itemStyle: {
                normal: {
                    areaColor: '#38547e',    //区域颜色
                    borderColor: '#B3A896',  //边框颜色
                    borderWidth: 1           //边框线宽
                },
                emphasis: {
                    areaColor: '#979797'
                }
            },
            //特定区域设定
            regions: region,
        },
        tooltip: {
            trigger: 'item',
            backgroundColor: "#1B2A61",
            borderColor:"#74ECFF",
            borderWidth:1,
        	showDelay: 0,
    		hideDelay: 0,
            formatter: function (params) {

            	if(params.seriesType=="effectScatter")
                return "  海外仓：" + params.value[2].repoNm + "<br />" +
                       "仓库容量：" + params.value[2].opacity + "<br />" +
                       "  总库存：" + params.value[2].tatolStock + "<br />" +
                       "可用库存：" + params.value[2].useableStock;
            }
        },
        series: [{
            name: '弧线',
            type: 'lines',
            zlevel: 1,
            effect: {
                show: true,
                period: 6,//箭头指向速度，值越小速度越快
                trailLength: 0.7,//特效尾迹长度[0,1]值越大，尾迹越长重
                color: '#ffa022',
                symbolSize: 3
            },
            lineStyle: {
                normal: {
                    color: '#00EAFF',
                    width: 2,
                    curveness: -0.2
                }
            },
            data: convertData(overseasRepoData)
        },
        {
            name: '飞机',
            type: 'lines',
            zlevel: 2,
            symbol: ['none', 'pin'],
            symbolSize: 10,
            effect: {
                show: true,
                period: 6,
                trailLength: 0,
                symbol: planePath,
                symbolSize: 20
            },
            lineStyle: {
                normal: {
                    color: '#a6c84c',
                    width: 1,
                    opacity: 0.6,
                    curveness: -0.2
                }
            },
            data: convertData(overseasRepoData)
        },
        {
            name: '终点',
            type: 'effectScatter',
            coordinateSystem: 'geo',
            zlevel: 2,
            rippleEffect: {
                brushType: 'stroke'
            },
            label: {
                normal: {
                    show: true,
                    position: 'right',
                    formatter: '{b}'
                }
            },
            symbolSize: 12,
            itemStyle: {
                normal: {
                    color: '#f00'
                }
            },
            data: convertData2(),
        },
		{
			name: '起点',
			type: 'scatter',
			coordinateSystem: 'geo',
			zlevel: 2,
			rippleEffect: {
				period: 4,
				brushType: 'stroke',
				scale: 4
			},
			label: {
				normal: {
					show: true,
					position: 'right',
					//offset:[5, 0],
					color: '#0f0',
					formatter: '{b}',
					textStyle: {
						color: "#0f0"
					}
				},
				emphasis: {
					show: true,
					color: "#f60"
				}
			},
			symbol: 'pin',
			symbolSize: 50,
			data: [{
				name: overseasRepoData.eshopNm,
				value: geoCoordMap[overseasRepoData.eshopNm],
			}],
		}
        ],
    };
    chart.setOption(option);
    window.addEventListener('resize', function () {
        chart.resize()
    });
    
    // ToolTip轮播
    var index = 0;
    function showToolTip() {
    	chart.dispatchAction({
    		type:'showTip',
    		seriesIndex: 2,
    		dataIndex:index
    	});

    	chart.dispatchAction({
    		type:'highlight',
    		seriesIndex: 2,
    		dataIndex:index
    	});

    	chart.dispatchAction({
    		type:'downplay',
    		seriesIndex: 2,
    		dataIndex:index==0?overseasRepoData.value.length-1:index-1,
    	});
    	
    	index++;
    	if(index > overseasRepoData.value.length - 1) {
    		index = 0;
    	}
    };
    
    var refreshData = function() {
        
        //更新数据
         var option = chart.getOption();
        
         option.series[0].data = convertData(overseasRepoData);   
         option.series[1].data = convertData(overseasRepoData);
         
         option.series[2].data = convertData2();
         
         option.series[3].data = [{
			name: overseasRepoData.eshopNm,
			value: geoCoordMap[overseasRepoData.eshopNm],
		 }];
         
         chart.setOption(option);    
    };

    setInterval(showToolTip,3000);

    var regions = chart.getOption().geo[0].regions;

</script>
</body>
</html>