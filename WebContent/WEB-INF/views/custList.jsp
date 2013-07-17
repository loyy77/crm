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
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerGrid.js"/>"  type="text/javascript" ></script>
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
			{ display: '名称', name: 'name', minWidth: 120 }, 
			{ display: '地区', name: 'region', minWidth: 150 },  
			{ display: '客户经理', name: 'managerName', minWidth: 140 }, 
			{ display: '客户等级', name: 'levelLabel', minWidth: 140 },  
			{ display: '状态', name: 'state', minWidth: 140 }
			],dataAction: 'server',
				usePager:true,      
				pageSizeOptions: [5, 10, 15, 20,30,50], 		
				pageSize:10,		
                url:"cust/list",
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
		  if(item.id==1){//编辑
			 var custId= getSelected();
		 // alert(custId);
		  if(!custId)return;
			 window.location.href="cust/toCustEdit?custId="+custId;
      	  }else if(item.id==2){//联系人
      		  var custId=getSelected();
      		  if(!custId)return;
      		  	window.location.href="linkman/toList?custId="+custId;
      	  }else if(item.id==3){ //交往记录
      		  alert("开发中-交往记录")
      	      return;
              var row=$("#maingrid").ligerGetGridManager().getSelectedRow();

              if (!row) { alert('请选择要操作的行'); return; }
              var custId=row.id;
               window.location.href="";


              /////
      		  var userId=$("#userId").val();
      		  var assignId=getAssignId();
      			var bb=userId==assignId;
      			var chanceId=getSelected();
          		$.ligerDialog.confirm("确定销售机会:"+chanceId+"为开发成功吗？",function (r) {
          			if(r){
          				//window.location.href="chance/doDevSuccess?chanceId="+chanceId;
          				$.post("chance/doDevSuccess",{'chanceId':chanceId},function(data){
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
      		  alert("待开发");return;
      		 var chanceId=getSelected();
   		  if(!chanceId)return;
   		  $.ligerDialog.confirm("待开发",function(rst){
   			  /*
   			  if(!rst)return;
   			  $.post("chance/doDevFail",{'chanceId':chanceId},function(data){
   				  if(data=="fail"){
   					  $.ligerDialog.tip({title:'操作提示',content:'操作失败'});
   				  }else{
   					  $.ligerDialog.tip({title:'操作提示',content:'操作成功'});
   				  }
   				  
   			  });
   			  */
   		  });
      	  }
      	  else if(item.id==5){
      		  alert("待开发");return;
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
                { id:1,text: '编辑', click: itemclick , icon:'add'},
                { line:true },
                { id:2,text: '联系人', click: itemclick },
                { line:true },
                { id:3,text: '交往记录', click: itemclick },
                { line:true },
                { id:4,text: '历史订单', click: itemclick },
               { line:true},
               { id:5,text: '删除', click : itemclick}
            ]
            }); 
            
           
        });

</script>
</head>
<body  style="padding:0px">  
<input type="hidden" id="op" value="${op}" />
 <div class="l-clear"></div>
 <!-- 工具条 ，该工具条包含 增加、修改、删除  -->
  <div id="toptoolbar" style="width:99%"></div>  
 <!-- 表格，数据展示的主要区域 -->
  <div id="maingrid" style="margin-top:0px"></div> <br />
  <div style="display:none;">
 

  
</div>
</body>
</html>
 <!-- g data total ttt -->
  <script type="text/javascript">
  $().ready(function(){
		
  			var result=$("#result").val();
  			//alert(result);
  			if(result=='success'){
  				$.ligerDialog.success('操作成功！');
  			}
  		
  	});
	  

//  alert("win");
  
  </script>
