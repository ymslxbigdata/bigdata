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

    var countries = ['亚洲','欧洲','非洲', '大洋洲','北美洲', '南美洲', '中国'];
    var turnover = [];

    option = {
        tooltip : {
            trigger: 'item',
            formatter: "{b} : {c} 美元"
        },
        xAxis: {
            type: 'category',
            data: countries,
            axisLabel:{
            	 
            },
            axisLine:{
                lineStyle:{
                    color: '#FFFFFF'
                }
            },

        },
        yAxis: {
            type: 'value',
            axisLine:{
                lineStyle:{
                    color: '#FFFFFF'
                }
            }
        },
        series: [{
            data: turnover,
            type: 'bar'
        }]
    };

    chart.setOption(option);
    window.addEventListener('resize', function () {
        chart.resize();
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