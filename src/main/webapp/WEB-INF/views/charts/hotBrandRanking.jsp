<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="chart" class="width-100 height-100 background-color-0D1633"></div>

<script>

    var chart = echarts.init(document.getElementById('chart'));

    var data = [

    ];

    option = {
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {d}%"
        },
        calculable : true,
        series : [
            {
                name:'热销品牌',
                type:'pie',
                radius : [10, 80],
                roseType : 'area',
                data:data
            }
        ]
    };

    chart.setOption(option);
    window.addEventListener('resize', function(){
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
