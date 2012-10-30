<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" >
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
    <script src="<c:url value="/ligerUI/js/plugins/ligerGrid.js"/>"  type="text/javascript" charset="gbk></script>
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
			{ display: '���', name: 'id', align: 'center', width: 50 }, 
			{ display: '��˾��', name: 'customerName', minWidth: 120 }, 
			{ display: '��Ҫ', name: 'title', minWidth: 150,align:'left' },  
			{ display: '��ϵ��', name: 'linkMan', minWidth: 140 }, 
			{ display: '��ϵ�绰', name: 'linkPhone', minWidth: 140 },  
			{ display: '��������', name: 'createDate', minWidth: 140 } 
			],dataAction: 'server',      
                url:"../chance/list",
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

    
    	//ÿ����ť��Ӧ���¼�
	  function itemclick(item)
        {
		  if(item.text=="����"){
			  
			  window.location.href="../chance/toChanceAdd";
			// var m= $.ligerDialog.open({ height: 420,width:550,url: '../chance/toChanceAdd' });
      			//m.target="home";
      			
      			
      			
      	  }else if(item.text=="�޸�"){
      		  
      		  var chanceId=getSelected();
      		  if(!chanceId)return;
      		  	window.location.href="../chance/toChanceModify?chanceId="+chanceId;
      	  }else if(item.text=="ɾ��"){
      		var chanceId=getSelected();
      		//alert(chanceId);
      		
      		$.ligerDialog.confirm("ȷ��ɾ�����Ϊ:"+chanceId+"�ļ�¼��",function (r) {
      			if(r){
      				window.location.href="../chance/doChanceDel?chanceId="+chanceId;
      			}
      		});

      	

      	
      	  }
        }
        $(function ()
        {
            $("#toptoolbar").ligerToolBar({ items: [
                { text: '����', click: itemclick , icon:'add'},
                { line:true },
                { text: '�޸�', click: itemclick },
                { line:true },
                { text: 'ɾ��', click: itemclick }
            ]
            });
        });

</script>
</head>
<body  style="padding:0px">  
 <div class="l-clear"></div>
 <!-- ������ ���ù��������� ���ӡ��޸ġ�ɾ��  -->
  <div id="toptoolbar" style="width:99%"></div>  
 <!-- �������չʾ����Ҫ���� -->
  <div id="maingrid" style="margin-top:0px"></div> <br />
  <div style="display:none;">
  <!-- g data total ttt -->
  

  
</div>
</body>
</html>

