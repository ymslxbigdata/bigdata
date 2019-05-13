<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<div id="totalSalesChart" class="width-100 height-100 background-color-0D1633"></div>
<script>

    var area = ['非洲', '亚洲', '欧洲', '北美洲', '大洋洲','南美洲','中国'];
    var data = [0, 0, 0, 0, 0, 0, 0];


    var totalSalesChart = echarts.init(document.getElementById('totalSalesChart'));

    option = {
        xAxis: {
            type: 'category',
            data: area,
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
        grid: {
            left: '20%',
            right: '10%'
        },
        series: [{
            data: data,
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