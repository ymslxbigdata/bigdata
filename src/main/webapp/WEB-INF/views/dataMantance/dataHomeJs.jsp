<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
var app = new Vue({
	data: function() {
		return {
			iframeName: "",
			tableData: [],
			openItem: ['1'],

			editableTabsValue: "0",
			editableTabs: [],
			tabIndex: 0,
			navMenuList: [],
			tabs: {
				globalEshopInfo: {
					title: '全球跨境电商平台信息',
					url: 'globalEshopInfo/info'
				},
				globalEshopUsersData: {
					title: '全球跨境电商平台用户数据',
					url: 'globalEshopUsersData/info',
				},
				globalEshopTradeData: {
					title: '全球跨境电商平台交易数据 ',
					url: 'globalEshopTradeData/info',
				},
			},
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
		navMenuSelect: function(index, indexPath) {

			if (index == "1-1") {
				this.iframeUrl = "compInfoMaintenController/info";
				this.iframeName = "compInfoMaintenFrm";
			}
		},
		
		bodySize: function() {
			document.getElementById("contentBodyId").style.height = document.documentElement.clientHeight - 80 + "px";
			document.getElementById('leftNavId').style.height = document.documentElement.clientHeight - 80 + "px";
		},
	},
	created: function() {
// 		var rootPage = window.parent.parent;
// 		//初始化style
// // 		rootPage.getVueInstance().setChildFrameResolution(rootPage);
		
// 		// 加载菜单
// 		this.getNavMenuList();
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