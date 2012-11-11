<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
</title>
    <link href="/crm/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="/crm/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" /> 
    <script src="/crm/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/core/base.js" type="text/javascript"></script>
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

    <style type="text/css">
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
  
<script type="text/javascript">
$().ready(function(){
	$("#form1").validate();
	$("input[type='text']").attr("class","required");//("required");
	$("#rate").attr("class","{range:[0,100]}");
	$("#assignId").attr("class","");
	
	//Tip
	$("#id").ligerTip();
	$("#rate").ligerTip();
	
	});

</script>
</head>
<body style="padding:10px">
<input id="op" type="hidden" value="${op}"/>
    <form:form name="form1" id="form1" method="post" action="/crm/chance/doChance" modelAttribute="chance">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" border=0 >
            <tr>
                <td align="right" class="l-table-edit-td">编号：</td>
                <td align="left" class="l-table-edit-td"><form:input readonly="true" path="id" name="id" type="text" id="id"  title="系统自动生成" ltype="text" /></td>
                <td align="left">机会来源：</td>
                <td align="left"><form:input path="source" name="source" type="text" id="source" ltype="text" /></td>
            </tr>
            <tr>
                <td  align="right" class="l-table-edit-td" valign="top">客户名称：</td>
                 <td align="left" class="l-table-edit-td" ><form:input path="customerName"  name="customerName" type="text" id="customerName" ltype="text" />
                 </td><td align="left">成功几率：</td> 
                  <td align="left"><form:input path="rate" name="rate" type="text" id="rate" ltype="text" title="0-100之间的整数"/></td>
            </tr>   
            
            <tr>
                <td align="right"  valign="top"  >概要：</td>
                <td align="left" class="l-table-edit-td" colspan="3">
                  <form:input path="title" name="title" type="text" id="title" ltype="text"  style="width:400px;"/>
                </td>
            </tr>  
                 
           <tr>
                <td align="right" class="l-table-edit-td" valign="top">&nbsp;联系人：</td>
                 <td align="left" class="l-table-edit-td" ><form:input path="linkMan" name="linkman" type="text" id="linkman" ltype="text" />
                 </td>
                 <td align="left">联系电话：</td> 
                  <td align="left"><form:input path="linkPhone" name="linkPhone" type="text" id="linkPhone" ltype="text" class="required"/></td>
            </tr>   
            
              <tr>
                <td align="right" class="l-table-edit-td">机会描述：</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
             <%--    <form:textarea path="description"  /> --%>
                <form:textarea path="description" cols="100" rows="4" class="l-textarea" style="width:400px"/>
                </td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">创建人：</td>
                <td align="left" class="l-table-edit-td"><form:input value="${user.loginName }" name="createId.loginName" type="text" id="createId" ltype="text" readonly="true" path="createId.loginName" /></td>
                <td align="left">创建日期：</td>
                <td align="left"><form:input path="createDate" name="assignDate" type="text" id="assignDate" readonly="true" ltype="text" /></td>
            </tr>
          
         <tr>
                <td align="right" class="l-table-edit-td">指派给：</td>
                <td align="left" class="l-table-edit-td"><form:input path="assignId.loginName" name="assignId.loginName" type="text" id="assignId" readonly="true" ltype="text" /></td>
                <td align="left">指派日期：</td>
                <td align="left"><form:input path="assignDate" name="assignDate" type="text" id="assignDate" readonly="true" ltype="text" /></td>
            </tr>
        </table>
 <br />
<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="reset" value="重置" class="l-button l-button-reset"/>
    </form:form>
    <div style="display:none">
    <!--  数据统计代码 --></div>
</body>


</html>

 <script type="text/javascript">
	 
		 	 var op=$("#op").val();
			
			if(op=="update"){
				 $("#Button1").val("保存修改");
					
				$("#form1").attr("action","../chance/doChanceModify");
			}  

  </script>

