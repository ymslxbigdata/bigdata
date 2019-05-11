<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div id="hotBrandChart" class="width-100 height-100 background-color-0D1633"></div>

<script>

    var hotBrandChart = echarts.init(document.getElementById('hotBrandChart'));

    var data = [
        {value:10, name:'roseA'},
        {value:5,  name:'roseB'},
        {value:15, name:'rose3'},
        {value:25, name:'rose4'},
        {value:20, name:'rose5'},
        {value:35, name:'rose6'},
        {value:30, name:'rose7'},
        {value:40, name:'rose8'}
    ];

    option = {
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
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

    hotBrandChart.setOption(option);
    window.addEventListener('resize', function(){
        hotBrandChart.resize();
    })

</script>
</body>
</html>
