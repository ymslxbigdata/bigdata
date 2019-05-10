<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<div id="wordMap" class="width-100 height-100" onload="drawMap()"></div>
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
    var wordMap = echarts.init(document.getElementById('wordMap'));
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
    };
    wordMap.setOption(option);
    window.addEventListener('resize', function () {
        wordMap.resize()
    });

</script>
</body>
</html>