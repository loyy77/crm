var indexdata = 
[
    { text: '营销管理',isexpand:false, children: [ 
		{url:"demos/base/resizable.htm",text:"营销机会管理"},
		{url:"demos/base/drag.htm",text:"客户开发计划"}
	]
    },
    { text: '客户管理', isexpand: false, children: [
		{ url: "demos/filter/filter.htm", text: "客户信息管理" },
		{ url: "demos/filter/filterwin.htm", text: "客户流失管理" }
	]
    }, 
	{ text: '服务管理',isexpand:false, children: [ 
		{url:"demos/dialog/dialogAll.htm",text:"服务创建"},
		{url:"demos/dialog/dialogTarget.htm",text:"服务分配"},
		{url:"demos/dialog/dialogUrl.htm",text:"服务处理"}, 
		{url:"demos/dialog/tip.htm",text:"服务反馈"}, 
		{url:"demos/dialog/window.htm",text:"服务归档"}
	]},
	{ text: '统计报表',isexpand:false, children: [  
		{url:"demos/menu/evenmenu.htm",text:"客户贡献分析"},
		{url:"demos/menu/menubar.htm",text:"客户构成分析"}, 
		{url:"demos/menu/mulmenu.htm",text:"客户服务分析"},
		{url:"demos/menu/mulmenu.htm",text:"客户流失分析"}
	]},
	{ text: '基础数据',isexpand:false, children: [  
		{url:"demos/comboBox/comboBoxSelect.htm",text:"数据字典管理"},
		{url:"demos/comboBox/comboBoxSingle.htm",text:"查询产品信息"},
		{url:"demos/comboBox/comboBoxSingleCheckBox.htm",text:"查询库存"},
		
	]},
	
];


var indexdata2 =
[
    { isexpand: "true", text: "表格", children: [
        { isexpand: "true", text: "可排序", children: [
		    { url: "dotnetdemos/grid/sortable/client.aspx", text: "客户端" },
            { url: "dotnetdemos/grid/sortable/server.aspx", text: "服务器" }
	    ]
        },
        { isexpand: "true", text: "可分页", children: [
		    { url: "dotnetdemos/grid/pager/client.aspx", text: "客户端" },
            { url: "dotnetdemos/grid/pager/server.aspx", text: "服务器" }
	    ]
        },
        { isexpand: "true", text: "树表格", children: [
		    { url: "dotnetdemos/grid/treegrid/tree.aspx", text: "树表格" } 
	    ]
        }
    ]
    }
];