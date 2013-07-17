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
			{ display: '���', name: 'id', align: 'center', width: 50 }, 
			{ display: '����', name: 'name', minWidth: 120 }, 
			{ display: '����', name: 'region', minWidth: 150 },  
			{ display: '�ͻ�����', name: 'managerName', minWidth: 140 }, 
			{ display: '�ͻ��ȼ�', name: 'levelLabel', minWidth: 140 },  
			{ display: '״̬', name: 'state', minWidth: 140 }
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
    
    //����ѡ���еı��
    function getSelected()
    {
        var manager = $("#maingrid").ligerGetGridManager();
        var row = manager.getSelectedRow();
        if (!row) { alert('��ѡ��Ҫ��������'); return; }
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
		  if(item.id==1){//�༭
			 var custId= getSelected();
		 // alert(custId);
		  if(!custId)return;
			 window.location.href="cust/toCustEdit?custId="+custId;
      	  }else if(item.id==2){//��ϵ��
      		  var custId=getSelected();
      		  if(!custId)return;
      		  	window.location.href="linkman/toList?custId="+custId;
      	  }else if(item.id==3){ //������¼
      		  alert("������-������¼")
      	      return;
              var row=$("#maingrid").ligerGetGridManager().getSelectedRow();

              if (!row) { alert('��ѡ��Ҫ��������'); return; }
              var custId=row.id;
               window.location.href="";


              /////
      		  var userId=$("#userId").val();
      		  var assignId=getAssignId();
      			var bb=userId==assignId;
      			var chanceId=getSelected();
          		$.ligerDialog.confirm("ȷ�����ۻ���:"+chanceId+"Ϊ�����ɹ���",function (r) {
          			if(r){
          				//window.location.href="chance/doDevSuccess?chanceId="+chanceId;
          				$.post("chance/doDevSuccess",{'chanceId':chanceId},function(data){
          					if(data=="success"){
          						$.ligerDialog.success("�����ɹ���");
          						//��������
          						var m=$("#maingrid").ligerGetGridManager();
          						m.loadData();
          					}else{
          						$.ligerDialog.error("����ʧ�ܣ�");
          					}
          				});
          			}
          		});
      	  }else if(item.id==4){
      		  alert("������");return;
      		 var chanceId=getSelected();
   		  if(!chanceId)return;
   		  $.ligerDialog.confirm("������",function(rst){
   			  /*
   			  if(!rst)return;
   			  $.post("chance/doDevFail",{'chanceId':chanceId},function(data){
   				  if(data=="fail"){
   					  $.ligerDialog.tip({title:'������ʾ',content:'����ʧ��'});
   				  }else{
   					  $.ligerDialog.tip({title:'������ʾ',content:'�����ɹ�'});
   				  }
   				  
   			  });
   			  */
   		  });
      	  }
      	  else if(item.id==5){
      		  alert("������");return;
      		  if(flag){
      			  var chanceId=getSelected();
          		  if(!chanceId)return;
          		  	window.location.href="chance/toChanceAssign?chanceId="+chanceId;
      			  
      		  }
      		
      	  }
        }
    	//������
        $(function ()
       {
            $("#toptoolbar").ligerToolBar({ items: [
                { id:1,text: '�༭', click: itemclick , icon:'add'},
                { line:true },
                { id:2,text: '��ϵ��', click: itemclick },
                { line:true },
                { id:3,text: '������¼', click: itemclick },
                { line:true },
                { id:4,text: '��ʷ����', click: itemclick },
               { line:true},
               { id:5,text: 'ɾ��', click : itemclick}
            ]
            }); 
            
           
        });

</script>
</head>
<body  style="padding:0px">  
<input type="hidden" id="op" value="${op}" />
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
