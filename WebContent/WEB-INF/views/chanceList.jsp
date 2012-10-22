<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link href="<c:url value="/ligerUI/skins/Aqua/css/ligerui-all.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/ligerUI/skins/ligerui-icons.css"/>" rel="stylesheet" type="text/css" />
    <script src="<c:url value="/js/jquery-1.3.2.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/json2.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/core/base.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/plugins/ligerDialog.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/plugins/ligerTextBox.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/plugins/ligerCheckBox.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/plugins/ligerComboBox.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/plugins/ligerGrid.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/plugins/ligerDateEditor.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/plugins/ligerSpinner.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/ligerUI/js/plugins/ligerToolBar.js"/>" type="text/javascript"></script>


    <script type="text/javascript">

   
        $(f_initGrid);
        var manager, g;
        function f_initGrid()
        {
            g = manager = $("#maingrid").ligerGrid({
                columns:  [ 
			{ display: '编号', name: 'id', align: 'center', width: 50 }, 
			{ display: '公司名', name: 'customerName', minWidth: 120 }, 
			{ display: '概要', name: 'title', minWidth: 150,align:'left' },  
			{ display: '联系人', name: 'linkMan', minWidth: 140 }, 
			{ display: '联系电话', name: 'linkPhone', minWidth: 140 },  
			{ display: '创建日期', name: 'createDate', minWidth: 140 } 
			],dataAction: 'server',      
                url:"../chance/list",
                width: '99%'
            });   
        }
      
    </script>
    
    <script type="text/javascript">
	  function itemclick(item)
        {
		  if(item.text=="增加"){
      			window.location.href="../chance/toChanceAdd";
      	  }else if(item.text=="修改"){
      		  	window.location.href="../chance.toChanceModify";
      	  }else if(item.text=="删除"){
      		  window.location.href="../chance.doChanceDel";
      	  }
        }
        $(function ()
        {
            $("#toptoolbar").ligerToolBar({ items: [
                { text: '增加', click: itemclick , icon:'add'},
                { line:true },
                { text: '修改', click: itemclick },
                { line:true },
                { text: '删除', click: itemclick }
            ]
            });
        });

</script>
</head>
<body  style="padding:0px">  
 <div class="l-clear"></div>
 <!-- 工具条 ，该工具条包含 增加、修改、删除  -->
  <div id="toptoolbar" style="width:99%"></div>  
 <!-- 表格，数据展示的主要区域 -->
  <div id="maingrid" style="margin-top:0px"></div> <br />
  <div style="display:none;">
  <!-- g data total ttt -->
</div>
</body>
</html>

