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
                data:[],
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
    
    let timer = null;
    let count = 0;
    function autoTip(total) {
        timer = setInterval(function() {
            var curr = count % total;
            chart.dispatchAction({
                type: 'showTip',
                seriesIndex: 0, // 因为只有一组数据，所以此处应为0
                dataIndex: curr
            });
            count += 1;
        }, 3000);
    }
</script>
</body>
</html>