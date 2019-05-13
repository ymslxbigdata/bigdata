<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<div id="chart" class="width-100 height-100 background-color-0D1633"></div>
<script>

    var platForm = ['亚马逊', 'ebay', '阿里', 'wish'];
    var zStr = [''];

    // y, x, z
    var data = [[0,0,1000],[0,1,1000],[0,2,1000],[0,3,1000]];

    var chart = echarts.init(document.getElementById('chart'));

    option = {
        tooltip: {},
        xAxis3D: {
            type: 'category',
            data: platForm,
            name:'',
            axisLine:{
                lineStyle:{
                    color: '#FFFFFF'
                }
            },
            axisLabel: {
                margin: 14,
                color:'#FFFFFF',
                fontSize: 14,

            }
        },
        yAxis3D: {
            type: 'category',
            name:'',
            data: zStr,
            axisLine:{
                lineStyle:{
                    color: '#FFFFFF'
                }
            },
            axisLabel: {
                interval: 1,
                color:'#FFFFFF'
            }
        },
        zAxis3D: {
            type: 'value',
            name:'',
            axisLine:{
                lineStyle:{
                    color: '#FFFFFF'
                }
            },
            axisLabel: {
                color:'#FFFFFF'
            }

        },
        grid3D: {
            boxWidth: 250,
            boxDepth: 70,
            left: 20,
            top: 0,
            right: 20,
            viewControl: {
                distance: 280,
                alpha: 20,
                beta: -1,
            },
            light: {
                main: {
                    intensity: 1.2,
                    shadow: true,

                },
                ambient: {
                    intensity: 0.3
                }
            }
        },
        series: [{
            type: 'bar3D',
            data: data.map(function (item) {
                return {
                    value: [item[1], item[0], item[2]],
                }
            }),
            shading: 'lambert',
            itemStyle:{
                color: '#ff8800'
            },
            label: {
                textStyle: {
                    fontSize: 16,
                    borderWidth: 1,
                    color: '#FFFFFF'
                }
            },

            emphasis: {
                label: {
                    textStyle: {
                        fontSize: 20,
                        color: '#1400a9'
                    }
                },
                itemStyle: {
                    color: '#00e6ff'
                }
            }
        }]
    };

    chart.setOption(option);
    window.addEventListener('resize', function () {
        chart.resize()
    });
</script>
</body>
</html>