<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<base   href="<%=basePath %>">
<meta http-equiv="Content-Type" content="text/html; charset=gbk" >
    <title></title>
    <link href="<c:url value="/resources/ligerUI/skins/Aqua/css/ligerui-all.css"/>" rel="stylesheet" type="text/css" />
    <link href="<c:url value="/resources/ligerUI/skins/ligerui-icons.css"/>" rel="stylesheet" type="text/css" />
    <script src="<c:url value="/resources/jquery/jquery-1.3.2.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/json2.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/core/base.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerDialog.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerTextBox.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerCheckBox.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerComboBox.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerGrid.js"/>"  type="text/javascript" charset="gbk></script>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerDateEditor.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerSpinner.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerToolBar.js"/>" type="text/javascript"></script>
 
       
    <script type="text/javascript">

        $(f_initGrid);
        var manager, g;
        function f_initGrid()
        {
            g = manager = $("#maingrid").ligerGrid({
                columns:  [ 
			{ display: '编号', name: 'id', align: 'center', width: 50 }, 
			{ display: '姓名', name: 'name', minWidth: 120 }, 
			{ display: '性別', name: 'sex', minWidth: 150 },  
			{ display: '职位', name: 'position', minWidth: 140 }, 
			{ display: '办公电话', name: 'tel', minWidth: 140 },  
			{ display: '手机', name: 'mobile', minWidth: 140 },
			{ display: '备注', name: 'memo', minWidth: 140 },
			],dataAction: 'server',
				usePager:false,      
				pageSizeOptions: [5, 10, 15, 20,30,50], 		
				pageSize:10,		
                url:"linkman/list?custId="+$("#custId").val(),
                width: '99%'
            });   
        }
      
    </script>
    
    <script type="text/javascript">
    
    //返回选中行的编号
    function getSelected()
    {
        var manager = $("#maingrid").ligerGetGridManager();
        var row = manager.getSelectedRow();
        if (!row) { alert('请选择要操作的行'); return; }
        return row.id;
       // alert(JSON.stringify(row));
    }
    function getAssignId(){
    	  var manager = $("#maingrid").ligerGetGridManager();
          var row = manager.getSelectedRow();
          if (!row) { alert('请选择行'); return; }
          return row.assignId;
    }
    

    
    	//每个按钮响应的事件
	  function itemclick(item)
        {
			var flag=true;
		  if(item.id==1){//新建联系人
			 var custId= $("#custId").val();
		  	if(!custId)return;
			 window.location.href="linkman/toEdit?custId="+custId;
      	  }else if(item.id==2){//编辑联系人信息
      		  var custId=$("#custId").val();
      			var linkmanId=getSelected();
      			//alert(linkmanId);
      		  if(!custId)return;
      		  	window.location.href="linkman/toUpdate?op=update&custId="+custId+"&linkmanId="+linkmanId;
      	  }else if(item.id==3){ 
      		 
      		
      			var linkmanId=getSelected();
          		$.ligerDialog.confirm("确定编号为:"+linkmanId+"的联系人信息吗？",function (r) {
          			if(r){
          				//window.location.href="chance/doDevSuccess?chanceId="+chanceId;
          				$.post("linkman/del",{'linkmanId':linkmanId},function(data){
          					if(data=="success"){
          						$.ligerDialog.success("操作成功！");
          						//重载数据
          						var m=$("#maingrid").ligerGetGridManager();
          						m.loadData();
          					}else{
          						$.ligerDialog.error("操作失败！");
          					}
          				});
          			}
          		});
      	  }else if(item.id==4){
   
      	  }
		  
		  
      	  else if(item.text=='指派'){
      		  if(flag){
      			  var chanceId=getSelected();
          		  if(!chanceId)return;
          		  	window.location.href="chance/toChanceAssign?chanceId="+chanceId;
      			  
      		  }
      		
      	  }
        }
    	//工具条
        $(function ()
       {
            $("#toptoolbar").ligerToolBar({ items: [
                { id:1,text: '新建', click: itemclick , icon:'add'},
                { line:true },
                { id:2,text: '编辑', click: itemclick },
                { line:true },
                { id:3,text: '删除', click: itemclick }//,
               /*  { line:true },
                { id:4,text: '历史订单', click: itemclick },
               { line:true},
               { id:5,text: '删除', click : itemclick} */
            ]
            }); 
            
           
        });

</script>
</head>
<body  style="padding:0px">  
<input type="hidden" id="customerId" value="${customer.id }"/>
<input type="hidden" id="custId" value="${custId }"	/>
<input type="hidden" id="op" value="${op}" />
 <div class="l-clear"></div>
 <!-- 工具条 ，该工具条包含 增加、修改、删除  -->
  <div id="toptoolbar" style="width:99%"></div>  
  <table width="600px" style="margin:2px;"><tr style="line-height:24px;"><td bgcolor="#B0E0E6" width="90px;" align="center">客户编号</td><td align="center" width="100px;">${customer.id }</td><td bgcolor="#B0E0E6" width="90px;" align="center">客户名称</td><td align="left" style="padding-left: 5px;">${customer.name }</td></tr></table>
  
 <!-- 表格，数据展示的主要区域 -->
  <div id="maingrid" style="margin-top:0px"></div> <br />
  <div style="display:none;">
 

  
</div>
<input type="hidden" id="result" value="${result }"/>
</body>
</html>
 <!-- g data total ttt -->
  <script type="text/javascript">
  $().ready(function(){
	  var result = $("#result").val();
		if (result == "success") {
			$.ligerDialog.alert("更新成功");
		} else if (result == "fail") {
			$.ligerDialog.alert("操作失败");
		}
		
  });
  </script>
