<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<base href="<%=basePath%>">
<title></title>
<link href="resources/ligerUI/skins/Aqua/css/ligerui-all.css"
	rel="stylesheet" type="text/css" />
<!--  <link href="resources/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />  -->
<script src="resources/jquery/jquery-1.3.2.min.js"
	type="text/javascript"></script>

<script src="resources/ligerUI/js/ligerui.min.js" type="text/javascript"></script>

<style type="text/css">
.grouphr {
	height: 1px;
	border: none;
	border-top: 1px solid #B0E0E6;
}

.grouphr2 {
	height: 1px;
	border: none;
	border-top: 1px dashed #B0E0E6;
	padding: 5px;
}

.l-table-edit {
	
}

.l-table-edit-td {
	padding: 4px;
}

.l-button-submit,.l-button-reset {
	width: 80px;
	float: left;
	margin-left: 10px;
	padding-bottom: 2px;
}
</style>

<script type="text/javascript">
var chanceId;
var planDate;
var oldplanResult="";
var g;
function currentTime(){
	var d = new Date(),str = '';
	 str += d.getFullYear()+'-';
	 str  += d.getMonth() + 1+'-';
	 str  += d.getDate()+' ';
	// str += d.getHours()+':'; 
	// str  += d.getMinutes()+':'; 
	//str+= d.getSeconds(); 
	return str;
	}
	
	


$().ready(function(){

	
	chanceId=$("#chanceId").val();
		var planTodo=$("#planTodo");
	//	planTodo.setDisabled();
		
		var manager=$("#planTodo").ligerTextBox({disabled:false});
		  $("#planTodo").bind('click', function ()
           {
  				//manager.setEnabled();	
           });
	
		
		
		 
		 function getSelected()
		    {
		        var manager = $("#maingrid").ligerGetGridManager();
		        var row = manager.getSelectedRow();
		        if (!row) { alert('��ѡ����'); return; }
		        return row.id;
		       // alert(JSON.stringify(row));
		    }
		
		planDate= $("#planDate").ligerDateEditor({ labelWidth: 80, labelAlign: 'right', initValue: currentTime() });

		 
	      

	});
//��񣨿����ƻ��б�

  $(f_initGrid);

	   var manager,planId,planTodo,planResult;
	
	  function f_initGrid()
	  { 	
		     g =  manager = $("#maingrid").ligerGrid({
        columns: [
	        { display: '����', name: 'id', width: 30, type: 'int',frozen:false,hide:true},
	        { display: '����', name: 'planDate',width:120
	        },
	        { display: '�ƻ���', width: 500, name: 'planTodo',
	            editor: { type: 'text'},
	        },
	      
	        { display: '����', name:'caozuo',isSort: false, width: 100, render: function (rowdata, rowindex, value)
	            {
	               return "<a href='javascript:delrow(" + rowindex + ","+rowdata.id+")'>ɾ��</a> "; 
	        	}
	        }
        ],
       
        onSelectRow: function (rowdata, rowindex)
        {
        	planId=rowdata.id;
        	oldplanTodo=rowdata.planTodo;
        	oldplanResult=rowdata.planResult;
        	if(oldplanResult==null){oldplanResult="";}
  
          //  $("#txtrowindex").val(rowindex);
        },onBeforeEdit:function(e,rowdata,rowindex){
            var manager = $("#maingrid").ligerGetGridManager();
			var row = manager.getSelectedRow();
			if(row==null){
				$.ligerDialog.warn("����ѡ���У���ѡ�е�����ǳ��ɫ�ġ�");
			}
        	oldplanResult=row.planResult;
        },
        enabledEdit: true, isScroll: false, rownumbers:false,
        onAfterEdit:function(rowdata,rowindex){
        	//alert("�༭");
        	//���grid�ؼ�������
        	var m=$("#maingrid").ligerGetGridManager();
        	var row = m.getSelectedRow();
        	planTodo=row.planTodo;
        	planResult=row.planResult;
        	if(oldplanTodo!=planTodo){
        	//		alert("oldplanTodo");
        		$.post("plan/doUpdatePlan",{'id':planId,'planTodo':encodeURI(planTodo)},function(){
            		 $.ligerDialog.tip({ title: '��ʾ��Ϣ', content: '�޸ĳɹ���' });
           		 });
        	}
        	
        	 if(oldplanResult==planResult){
        		 $.ligerDialog.tip({title:'��ʾ',content:'no change'});
        	
        		 $.post("plan/doUpdatePlan",{'id':planId,'planResult':encodeURI(planResult)},function(data){
        			if(data=="fail"){$.ligerDialog.tip({title:'��ʾ',content:'�޸�ʧ�ܣ�'});}
        			 $.ligerDialog.tip({title:'��ʾ',content:'�޸ĳɹ���'});
        		 });
        	 }
        	 
        	
        	
        	
        	
        },
        dataAction: 'server',
        url:"plan/planList?chanceId="+chanceId,
        width: '99%',
		usePager:false,allowHideColumn:false
		});   
		     
		     
		 
		     
}
		//ɾ����Ϣ
	  	function delrow(rowid,planId){

	  		 $.ligerDialog.confirm("ȷ��ɾ����",function(yes){
	  			$.post("plan/del",{'id':planId},function(){
					$.ligerDialog.tip({title:'��ʾ��Ϣ',content:'ɾ���ɹ�'});				
					manager.deleteRow(rowid);
				}); 
				 
	  			
	  		 });	
		}
	
	  
	  //�����
		function addNewRow(chanceId)
        {
		
			var planDate=$("#planDate").val();
			var planTodo=$("#planTodo").val();
		
			
			$.post("plan/add",{'planDate':planDate,'planTodo':planTodo,'chanceId':chanceId},function(data){
				if(data=="success"){	
					$.ligerDialog.tip({title:"������ʾ",content:'��ӳɹ���'});
					//alert("add.success");
		           var manager = $("#maingrid").ligerGetGridManager();
					var row = manager.getSelectedRow();
		            //����1:rowdata(�Ǳ���)
		            //����2:�����λ�� Row Data 
		            //����3:֮ǰ����֮��(�Ǳ���)
		            manager.addRow({ 
		                planDate: planDate,
		                planTodo: planTodo,
		               //	planId:row.id
		            }, row);
		          
		          
		            manager.loadData();
		         //  manager.loadServerData();
		           // alert(data);
					}else{
					alert("ʧ��");
				}
			
			});
			//, document.getElementById("chkbefore").checked
        }
	  //ִ�мƻ�
		function f_doPlan(){
			var m=$("#maingrid").ligerGetGridManager();
		//	g.toggleCol('planResult', true);
		//	g.toggleCol('caozuo', false);
		//	g.toggleCol('caozuo2', true);
	
			//������Ⱦ��ͼ
			var cols=[
			          { display: '����', name: 'id', width: 30, type: 'int',frozen:false,hide:true},
			          { display: '����', name: 'planDate',width:120 },
			          { display: '�ƻ���', width: 500, name: 'planTodo',type: 'text'},
			          { display:'�ƻ����',name:'planResult',editor:{type:'text'}},
			          { display: '����', name:'caozuo',isSort: false, width: 100, render: function (rowdata, rowindex, value)
			              {
			                 return "<a href='javascript:delrow(" + rowindex + ","+rowdata.id+")'>����</a> "; 
			          	  }
			          }
			         ];
			
			g.set('columns',cols);
			g.reRender();
			//�ر���ӿؼ�
			$("#tb-add").hide();
			
			//���û���״̬

		//  alert("��һ�����رռƻ���Ŀɱ༭״̬/r/n�ڶ�������ʾ�ƻ�����ı�����ʾ�����桱��ť")
	  }
	
</script>
</head>
<body style="padding: 10px">

	<div id="tt"></div>
	<input id="op" type="hidden" value="${op}" />
	<!-- ִ�мƻ��İ�ť -->
		<input type="button" value="ִ�мƻ�" style="width: 100px; height: 20px;"
			class="l-button" title="�ƶ��üƻ��󣬵��ִ�мƻ�" onclick="f_doPlan()" />

	<form:form name="form1" id="form1" method="post" action="/crm/plan/add"
		modelAttribute="plan">
		<div></div>


		<img alt="����ͼ��" src="resources/ligerUI/skins/icons/communication.gif" />&nbsp;<b>������Ϣ</b>
		<hr class="grouphr" />
		<table cellpadding="0" cellspacing="10" class="l-table-edit" border=0>
			<tr>
				<td align="right" class="l-table-edit-td">��ţ�</td>
				<td align="left" style="width: 159px;"><input type="hidden"
					id="chanceId" value="${chance.id }" /> ${chance.id }</td>
				<td align="left">������Դ��</td>
				<td align="left"><lable>${chance.source }</lable></td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td" valign="top">�ͻ����ƣ�</td>
				<td align="left" class="l-table-edit-td">${chance.customerName
					}</td>
				<td align="left">�ɹ����ʣ�</td>
				<td align="left">${chance.rate }</td>
			</tr>

			<tr>
				<td align="right" class="l-table-edit-td" valign="top">��Ҫ��</td>
				<td align="left" class="l-table-edit-td">${chance.title }</td>
				<td></td>
			</tr>

			<tr>
				<td align="right" class="l-table-edit-td" valign="top">&nbsp;��ϵ�ˣ�</td>
				<td align="left" class="l-table-edit-td">${chance.linkMan }</td>
				<td align="left">��ϵ�绰��</td>
				<td align="left">${chance.linkPhone}</td>
			</tr>

			<tr>
				<td align="right" class="l-table-edit-td">����������</td>
				<td align="left" class="l-table-edit-td" colspan="3">
					${chance.description }</td>
			</tr>
			<tr>
				<td align="right" class="l-table-edit-td">�����ˣ�</td>
				<td align="left" class="l-table-edit-td">

					${chance.createId.trueName }</td>
				<td align="left">�������ڣ�</td>
				<td align="left">${chance.createDate }</td>
			</tr>

			<tr>
				<td align="right" class="l-table-edit-td">ָ�ɸ���</td>
				<td align="left" class="l-table-edit-td">

					${chance.assignId.trueName }</td>
				<td align="left">ָ�����ڣ�</td>
				<td align="left">${chance.assignDate }</td>
			</tr>
		</table>



		<img alt="����ͼ��" src="resources/ligerUI/skins/icons/communication.gif" />&nbsp;<b>�����ƻ�</b>
		<hr class="grouphr" />


		<div id="maingrid" style="margin-top: 20px"></div>
		<!-- ����¼ƻ��Ĺ�����-->
		<div id="tb-add">
			<table cellpadding="10" width="800px" border="0">

				<tr>
					<td colspan=5><hr class="grouphr2" /></td>
				</tr>

				<tr>
					<td>*����</td>
					<td width="200px"><input type="text" class="l-text"
						id="planDate" name="planDate" class="required"></input></td>
					<td width="60px">*�ƻ��</td>
					<td><input type="text" class="l-text" style="width: 290px"
						id="planTodo" name="palnTodo" class="required"></input>
					<td><input type="button" value="����"
						onclick="javascript:addNewRow(${chance.id})" id="btnAddRow"
						class="l-button" style="width: 80px; height: 28px;" /></td>
					</td>
				</tr>


			</table>
		</div>

		<br />


	</form:form>
	<div style="display: none">
		<!--  ����ͳ�ƴ��� -->
	</div>
	${op }

</body>


</html>

<script type="text/javascript">
$().ready(function(){
	if($("#op").val()=="forward"){
		
		$("#tb-add").hide();
			$(f_doPlan);
		}
});
	
	
	</script>


