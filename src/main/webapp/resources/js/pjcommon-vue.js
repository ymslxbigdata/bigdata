var autoScrollMixin = {
    data: function () {
        return {
            intervalList: [],
        }
    },
    methods: {
        initScrollElement: function () {

            // 获取所有table元素
            let tableElements = document.getElementsByClassName('vue-table__body-wrapper');
            // 获取实际table body
            for (let i = 0; i < tableElements.length; i++) {
                // 获取表格外层元素高度
                let tableHeight = getComputedStyle(tableElements[i]).height.replace('px', '');
                // 获取表格实际高度
                let scrollHeight = tableElements[i].scrollHeight;
                // 可滚动的距离 = 表格实际高度 - 表格外层元素高度
                let scrollRange = scrollHeight - tableHeight;
                tableElements[i].id = 'table-' + i;
                // 绑定鼠标进入事件 → 取消滚动
                tableElements[i].addEventListener('mouseenter', () => {
                    this.cancelAutoScroll('table-' + i)
                });
                // 绑定鼠标离开事件 → 继续滚动
                tableElements[i].addEventListener('mouseleave', () => {
                    this.setAutoScroll('table-' + i, scrollRange)
                });
                // 设置滚动
                this.setAutoScroll('table-' + i, scrollRange);
            }
        },

        // 取消自动滚动播放
        cancelAutoScroll: function (tableId) {
            //清除定时器以取消滚动
            clearInterval(this.intervalList[tableId]);
        },

        // 设置自动滚动播放
        setAutoScroll: function (tableId, scrollRange) {

            let speed = 100; //滚动速度
            let areaBox = document.getElementById(tableId); //外层box
            let self = this;
            setTimeout(function () {

                //清除一遍定时器避免重复
                self.cancelAutoScroll(tableId);
                //创建定时器并将定时器存入集合对象
                self.intervalList[tableId] = setInterval(function () {

                    if (areaBox.scrollTop >= (scrollRange)) {
                        areaBox.scrollTop = 0;
                    } else {
                        areaBox.scrollTop++;
                    }
                }, speed);
            });
        },
    }
};

var dateOptionsMixin = {
    data: function () {
        return {
            months: [
                  {index: '01', text: '一月'}
                , {index: '02', text: '二月'}
                , {index: '03', text: '三月'}
                , {index: '04', text: '四月'}
                , {index: '05', text: '五月'}
                , {index: '06', text: '六月'}
                , {index: '07', text: '七月'}
                , {index: '08', text: '八月'}
                , {index: '09', text: '九月'}
                , {index: '10', text: '十月'}
                , {index: '11', text: '十一月'}
                , {index: '12', text: '十二月'}],
            quarters: [{index: 1, text: '第一季度'}
                     , {index: 2, text: '第二季度'}
                     , {index: 3, text: '第三季度'}
                     , {index: 4, text: '第四季度'}],
            years: [{text: '2019'}
                  , {text: '2018'}
                  , {text: '2017'}
                  , {text: '2016'}
                  , {text: '2015'}
                  , {text: '2014'}
                  , {text: '2013'}
                  , {text: '2012'}
                  , {text: '2011'}
                  , {text: '2010'}],
        }
    }
};

var numberFormatMixin = {
    methods: {
        formatNumber: function(nStr){
            nStr += '';
            x = nStr.split('.');
            x1 = x[0];
            x2 = x.length > 1 ? '.' + x[1] : '';
            var rgx = /(\d+)(\d{3})/;
            while (rgx.test(x1)) {
                x1 = x1.replace(rgx, '$1' + ',' + '$2');
            }
            return x1 + x2;
        }
    }
};