var autoScrollMixin = {

    methods : {
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
                        console.log('ima: ' + areaBox.scrollTop + ' range: ' + scrollRange);
                    }
                }, speed);
            });
        },
    },
    mounted: function(){
        setTimeout(() => self.initScrollElement(), 800);
    }
};