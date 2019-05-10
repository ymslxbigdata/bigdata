<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<div id="totalSalesChart" class="width-100 height-100 background-color-0D1633"></div>
<script>



    var totalSalesChart = echarts.init(document.getElementById('totalSalesChart'));

    option = {
        xAxis: {
            type: 'category',
            data: ['欧洲', '南美洲', '俄罗斯', '澳洲', '东南亚','中国','日本','韩国'],
            axisLabel:{
                rotate: -30
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
            data: [56000, 38000, 32000, 29000, 26000, 9000, 8000, 6000],
            type: 'bar'
        }]
    };

    totalSalesChart.setOption(option);
    window.addEventListener('resize', function () {
        totalSalesChart.resize()
    });
</script>
</body>
</html>