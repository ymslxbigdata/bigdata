<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
	data: function() {
		return {
			iframeName: "",
			tableData: [],
			openItem: ['1','2','3'],

			editableTabsValue: "0",
			editableTabs: [],
			tabIndex: 0,
			navMenuList: [{mainMenu:'全球交易大数据维护',mainIndex:'1',subMenu:[{title: '全球跨境电商平台信息',url: 'globalEshopInfo/info',subIndex:'1-1'}
                                                                        ,{title: '全球跨境电商平台用户数据',url: 'globalEshopUsersData/info',subIndex:'1-2'}
                                                                        ,{title: '全球跨境电商平台交易数据 ',url: 'globalEshopTradeData/info',subIndex:'1-3'}]
                          }
                         ,{mainMenu:'家具大数据维护',mainIndex:'2',subMenu:[{title: '家具种类信息',url: 'furnitureTypesInfo/info',subIndex:'2-1'}
                                                                     ,{title: '家具热销产品交易数据',url: 'furnitureHotSaleTradeData/info',subIndex:'2-2'}
                                                                     ,{title: '全球家具交易数据',url: 'globalEshopTradeData/info',subIndex:'2-3'}
                                                                     ,{title: '家具热销品牌信息',url: 'globalEshopTradeData/info',subIndex:'2-4'}]
                          }
                        ,{mainMenu:'海外仓维护',mainIndex:'3',subMenu:[{title: '海外仓信息',url: 'globalEshopOverseasRepo/info',subIndex:'3-1'}]} 
            ],
		}
	},
	methods: {
		
		// 点击菜单后，新增tab页
		addTab: function(tab) {
			for (var i = 0; i < this.editableTabs.length; i++) {
				if (tab.title == this.editableTabs[i].title) {
					this.editableTabsValue = this.editableTabs[i].name;
					return;
				}
			}
			var newTabName = ++this.tabIndex + "";
			this.editableTabs.push({
				title: tab.title,
				name: newTabName,
				url: tab.url,
			});
			this.editableTabsValue = newTabName;
		},
		
		removeTab: function(targetName) {
			var tabs = this.editableTabs;
			var activeName = this.editableTabsValue;
			if (activeName === targetName) {
				tabs.forEach(function(tab, index) {
					if (tab.name === targetName) {
						var nextTab = tabs[index + 1] || tabs[index - 1];
						if (nextTab) {
							activeName = nextTab.name;
						}
					}
				});
			}
			this.editableTabsValue = activeName;
			this.editableTabs = tabs.filter(function(tab) {
				return tab.name !== targetName
			});
		},
		
		
		bodySize: function() {
			document.getElementById("contentBodyId").style.height = document.documentElement.clientHeight - 80 + "px";
			document.getElementById('leftNavId').style.height = document.documentElement.clientHeight - 80 + "px";
		},
	},
	created: function() {

	},
	mounted: function() {
		this.bodySize();
		var self = this;
		window.onresize = function() {
			return self.bodySize();
		} 
	},
}).$mount("#app");
</script>