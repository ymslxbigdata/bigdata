<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<div id="chart" class="width-100 height-100 background-color-0D1633"></div>
<script>



    var chart = echarts.init(document.getElementById('chart'));

    option = {
                tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b}: {d}%"
        },
        series : [
            {
                name:'交易额',
                type:'pie',
                radius : [30, 80],
                roseType : 'radius',
                data:[
                    {value:1500, name:'Wish'},
                    {value:2500, name:'亚马逊'},
                    {value:1800, name:'eBay'},
                    {value:1500, name:'阿里巴巴'},
                ].sort(function (a, b) { return a.value - b.value; }),
                label: {
                    normal: {
                        textStyle: {
                            color: 'rgb(255,255,255)'
                        }
                    }
                },
                labelLine: {
                    normal: {
                        lineStyle: {
                            color: 'rgb(255,255,255)'
                        },
                        smooth: 0.2,
                        length: 10,
                        length2: 20
                    }
                },

                animationType: 'scale',
                animationEasing: 'elasticOut',
                animationDelay: function (idx) {
                    return Math.random() * 200;
                }
            }
        ]
    };

    chart.setOption(option);
    window.addEventListener('resize', function () {
        chart.resize()
    });
</script>
</body>
</html>