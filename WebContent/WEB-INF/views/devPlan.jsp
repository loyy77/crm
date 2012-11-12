<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
</title>
    <link href="/crm/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
   <!--  <link href="/crm/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />  -->
    <script src="/crm/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    
  <script src="/crm/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
 <!--    <script src="/crm/ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="/crm/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="/crm/resources/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="/crm/resources/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="/crm/resources/jquery-validation/messages_cn.js" type="text/javascript"></script>
 -->
    <style type="text/css">
    	.grouphr{height:1px;border:none;border-top:1px solid #B0E0E6;}
    	.grouphr2{height:1px;border:none;border-top:1px dashed #B0E0E6;padding:5px;}
        .l-table-edit {}
        .l-table-edit-td{padding:4px; }
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
  
<script type="text/javascript">
var chanceId;
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
		        if (!row) { alert('请选择行'); return; }
		        return row.id;
		       // alert(JSON.stringify(row));
		    }
		
		 $("#planDate").ligerDateEditor({ labelWidth: 80, labelAlign: 'right', initValue: currentTime() });

		 
	      	

	});
//表格（开发计划列表）
 
// alert(chanceId);
  $(f_initGrid);
	   var manager, g,planId,planTodo;
	
	  function f_initGrid()
	  { 
		     g =  manager = $("#maingrid").ligerGrid({
        columns: [
        { display: '主键', name: 'id', width: 30, type: 'int',frozen:false,hide:true},
        { display: '日期', name: 'planDate',width:120
        },
        { display: '计划项', width: 550, name: 'planTodo',
            editor: { type: 'text'},
        },
        { display: '操作', isSort: false, width: 120, render: function (rowdata, rowindex, value)
            {
           
               return "<a href='javascript:delrow(" + rowindex + ","+rowdata.id+")'>删除</a> "; 
          
        
        }

        }
        ],
       
        onSelectRow: function (rowdata, rowindex)
        {
        	
      
        	planId=rowdata.id;
        	oldplanTodo=rowdata.planTodo;
        //	alert(rowdata.id);
        
          //  $("#txtrowindex").val(rowindex);
        },
        enabledEdit: true, isScroll: false, rownumbers:false,onAfterEdit:function(rowdata,rowindex){
        	
        	var m=$("#maingrid").ligerGetGridManager();
        	var row = m.getSelectedRow();
        	planTodo=row.planTodo;
        	//planTodo=m.getUpdated().planTodo;
      
        	//alert(planId+","+planTodo);
        	if(oldplanTodo==planTodo){
        			
        		return};
        	
        	$.post("../plan/doUpdatePlan",{'id':planId,'planTodo':encodeURI(planTodo)},function(){
        		//alert("修改成功！");
        		//$.ligerDialog.success('修改成功');
        		 $.ligerDialog.tip({ title: '提示信息', content: '修改成功！' });

        		});
        	
        	
        },
        dataAction: 'server',
        url:"../plan/planList?chanceId="+chanceId,
        width: '99%',
		usePager:false
		});   
		     
		     
		 
		     
}
//删除信息
	  function delrow(rowid,planId){
		if(confirm('确定删除？')){
		  
			$.post("../plan/del",{'id':planId},function(){
				$.ligerDialog.tip({title:'提示信息',content:'删除成功'});				
				manager.deleteRow(rowid);
		});
	
		  
		  }}
	  
	  
	
</script>
</head>
<body style="padding:10px">

<div id="tt"></div>
<input id="op" type="hidden" value="${op}"/>
    <form:form name="form1" id="form1" method="post" action="/crm/plan/add" modelAttribute="plan">
<div>
</div>

	
		<img alt="分组图标" src="/crm/ligerUI/skins/icons/communication.gif"/>&nbsp;<b>销售信息</b>
		<hr class="grouphr"/>
        <table cellpadding="0" cellspacing="10" class="l-table-edit" border=0 >
            <tr >
                <td align="right" class="l-table-edit-td" >编号：</td>
                <td align="left" style="width:159px;">
                <input type="hidden" id="chanceId" value="${chance.id }"/>
                	${chance.id }</td>
                <td align="left">机会来源：</td>
                <td align="left"><lable>${chance.source }</lable></td>
            </tr>
            <tr>
                <td  align="right" class="l-table-edit-td" valign="top">客户名称：</td>
                 <td align="left" class="l-table-edit-td" >${chance.customerName }
                 </td><td align="left">成功几率：</td> 
                  <td align="left">${chance.rate }</td>
            </tr>   
            
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">概要：</td>
                <td align="left" class="l-table-edit-td" >
                		${chance.title }
                </td>
                <td></td>
            </tr>  
                 
           <tr>
                <td align="right" class="l-table-edit-td" valign="top">&nbsp;联系人：</td>
                 <td align="left" class="l-table-edit-td" >${chance.linkMan }
                 </td>
                 <td align="left">联系电话：</td> 
                  <td align="left">${chance.linkPhone}</td>
            </tr>   
            
              <tr>
                <td align="right" class="l-table-edit-td">机会描述：</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
            		 ${chance.description }
                </td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">创建人：</td>
                <td align="left" class="l-table-edit-td">
                
                ${chance.createId.trueName }
</td>
                <td align="left">创建日期：</td>
                <td align="left">${chance.createDate }</td>
            </tr>
          
         <tr>
                <td align="right" class="l-table-edit-td">指派给：</td>
                <td align="left" class="l-table-edit-td">
                
                ${chance.assignId.trueName }
            
                
                </td>
                <td align="left">指派日期：</td>
                <td align="left">${chance.assignDate }</td>
            </tr>
        </table>
        <img alt="分组图标" src="/crm/ligerUI/skins/icons/communication.gif"/>&nbsp;<b>开发计划</b>
       	<hr class="grouphr"/>
       	
       	<div id="maingrid" style="margin-top:20px"></div> 
       	<!-- 添加新的计划 -->
       	<table cellpadding="10" width="800px" >
       		
       		 <tr><td colspan=4><hr class="grouphr2"/></td></tr>
      
       	<tr>
       <td>日期</td>
       	<td width="200px">
       		<input type="text" class="l-text" id="planDate" name="planDate" ></input>*</td>
       	<td width="60px">计划项：</td>
       	<td>      
       	 	<input type="text" class="l-text" style="width:220px" id="planTodo" name="palnTodo" size=30></input>*</td>
       	</tr>
       	
       	<tr ><td colspan=4 align="right" style="line-height: 23px;padding-top: 20px"><input type="button" value="保存" class="l-button" style="width:80px;height:30px;"/></td></tr>
       	</table>

       
 <br />
 

    </form:form>
    <div style="display:none">
    <!--  数据统计代码 --></div>
    <input type="hidden" id="result" name="${result }"/>
    
</body>


</html>

 <script type="text/javascript">
	 /* 
		 	 var op=$("#op").val();
			
			if(op=="update"){
				//$("#Button1").val("保存修改");
				//$("#form1").attr("action","../chance/doChanceModify");
			}else if(op=='assign'){
				
				$("input[type='text']").attr("readonly","true"); 
				$("input[type='text']").attr("disabled","true");
				$("textarea").attr("disabled","true");
				$("#Button1").val("保存指派");
				$("#form1").attr("action","../chance/doChanceAssign");
				
			} */
		
			/* var result=$("#result").val();
			if(result=="success"){
				alert("修改成功！");
			}
 */
  </script>

