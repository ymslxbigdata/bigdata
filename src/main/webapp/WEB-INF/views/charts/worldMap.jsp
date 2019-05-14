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

   var geoCoordMap = {
    };

    var tradeAndUserData = [
    ];

    var convertData = function (data, geoCoordMap) {
        var res = [];
        for (var i = 0; i < data.length; i++) {
            var geoCoord = geoCoordMap[data[i].eshopNm];
            if (geoCoord) {
                res.push({
                    name: data[i].eshopNm,
                    value: geoCoord.concat(data[i])
                });
            }
        }
        return res;
    };

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

                if(params.seriesType=="scatter")
                    return "电商平台："+params.value[2].eshopNm + "<br />" +
                        "用户数量：" + params.value[2].userData + "<br />" +
                        "交易总额：" + params.value[2].tradeData;
            }
        },
        series:[
            {
                name:'tradeData',
                type:'scatter',
                coordinateSystem: 'geo',
                data:convertData(tradeAndUserData),
                symbolSize: 12,
                label: {
                    normal: {
                        show: false
                    },
                    emphasis: {
                        show: false
                    }
                },
                itemStyle: {
                    emphasis: {
                        borderColor: '#fff',
                        borderWidth: 1
                    }
                }
            }
        ],
    };
    chart.setOption(option);
    window.addEventListener('resize', function () {
        chart.resize()
    });
    var index = 0;
    function showToolTip() {
        chart.dispatchAction({
            type:'showTip',
            seriesIndex: 0,
            dataIndex:index
        });

        chart.dispatchAction({
            type:'highlight',
            seriesIndex: 0,
            dataIndex:index
        });

        chart.dispatchAction({
            type:'downplay',
            seriesIndex: 0,
            dataIndex:index==0?tradeAndUserData.length-1:index-1,
        });

        index++;
        if(index > tradeAndUserData.length - 1) {
            index = 0;
        }
    }

    setInterval(showToolTip,3000);

    var regions = chart.getOption().geo[0].regions;

</script>
</body>
</html>