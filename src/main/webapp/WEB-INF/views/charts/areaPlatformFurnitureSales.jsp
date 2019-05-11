<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<div id="salesChart" class="width-100 height-100 background-color-0D1633"></div>
<script>

    var salesChart = echarts.init(document.getElementById('salesChart'));

    var countries = ['欧洲', '南美洲','北美洲', '非洲', '俄罗斯', '澳洲', '东南亚','中国','日本','韩国'];
    var turnover = [56000, 38000, 37000, 35000, 32000, 29000, 26000, 9000, 8000, 6000];

    option = {
        xAxis: {
            type: 'category',
            data: countries,
            axisLabel:{
                // rotate: -30
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

    salesChart.setOption(option);
    window.addEventListener('resize', function () {
        salesChart.resize()
    });
</script>
</body>
</html>