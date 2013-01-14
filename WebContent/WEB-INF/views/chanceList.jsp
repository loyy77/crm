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
<base  href="<%=basePath %>">
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
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerGrid.js"/>"  type="text/javascript"></script>
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
			{ display: '���', name: 'id', align: 'center', width: 50 }, 
			{ display: '��˾��', name: 'customerName', minWidth: 120 }, 
			{ display: '��Ҫ', name: 'title', minWidth: 150,align:'left' },  
			{ display: '��ϵ��', name: 'linkMan', minWidth: 140 }, 
			{ display: '��ϵ�绰', name: 'linkPhone', minWidth: 140 },  
			{ display: '��������', name: 'createDate', minWidth: 140 },
			{ display: 'ָ����',name:'assignId',minWidth:140,hide:1} 
			],dataAction: 'server',
				usePager:true,      
				pageSizeOptions: [5, 10, 15, 20,30,50], 		
				pageSize:10,		
                url:"chance/list",
                width: '99%'
            });   
        }
      
    </script>
    
    <script type="text/javascript">
    function getSelected()
    {
        var manager = $("#maingrid").ligerGetGridManager();
        var row = manager.getSelectedRow();
        if (!row) { alert('��ѡ����'); return; }
        return row.id;
       // alert(JSON.stringify(row));
    }
    function getAssignId(){
    	  var manager = $("#maingrid").ligerGetGridManager();
          var row = manager.getSelectedRow();
          if (!row) { alert('��ѡ����'); return; }
          return row.assignId;
    }
    

    
    	//ÿ����ť��Ӧ���¼�
	  function itemclick(item)
        {
			var flag=true;
    		
		  if(item.text=="����"){
			  
			  window.location.href="chance/toChanceAdd";
			// var m= $.ligerDialog.open({ height: 420,width:550,url: '../chance/toChanceAdd' });
      			//m.target="home";
      	  }else if(item.text=="�޸�"){
      		  
      		  var chanceId=getSelected();
      		  if(!chanceId)return;
      		  	window.location.href="chance/toChanceModify?chanceId="+chanceId;
      	  }else if(item.text=="ɾ��"){
      		  var userId=$("#userId").val();
      		  var assignId=getAssignId();
      		  
      		  //userId==2||userID==3
      		  if(userId==assignId){
      			var chanceId=getSelected();
          		//alert(chanceId);
          		
          		$.ligerDialog.confirm("ȷ��ɾ�����Ϊ:"+chanceId+"�ļ�¼��",function (r) {
          			if(r){
          				window.location.href="chance/doChanceDel?chanceId="+chanceId;
          			}
          		});
      		  }else{
      			$.ligerDialog.alert('�����Ǹ����ۻ���Ĵ����ߣ�����ִ��ɾ��������');
      		  }
      		  
      		

      	  }else if(item.text=='ָ��'){
      		  if(flag){
      			  var chanceId=getSelected();
          		  if(!chanceId)return;
          		  	window.location.href="chance/toChanceAssign?chanceId="+chanceId;
      			  
      		  }
      		
      	  }
        }
        $(function ()
       {
            $("#toptoolbar").ligerToolBar({ items: [
                { id:1,text: '����', click: itemclick , icon:'add'},
                { line:true },
                { id:2,text: '�޸�', click: itemclick },
                { line:true },
                { id:3,text: 'ɾ��', click: itemclick },
                { line:true},
                { id:4,text: 'ָ��', click : itemclick}
           
            ]
            }); 
            
            
            var userId=$("#userId").val();
    		  if(userId==2||userId==3){
    			  
    			 /*  $("#toptoolbar").ligerToolBar({ items: [
                      { text: '����', click: itemclick , icon:'add'},
                      { line:true },
                      { text: '�޸�', click: itemclick },
                      { line:true },
                      { text: 'ɾ��', click: itemclick }
                  ]
                  }); */
    		  };
        });

</script>
</head>
<body  style="padding:0px">  
<input type="hidden" id="result" value="${result}" />
 <div class="l-clear"></div>
 <!-- ������ ���ù��������� ���ӡ��޸ġ�ɾ��  -->
  <div id="toptoolbar" style="width:99%"></div>  
 <!-- �������չʾ����Ҫ���� -->
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
  				$.ligerDialog.success('�����ɹ���');
  			}
  		
  	});
	  

//  alert("win");
  
  </script>
