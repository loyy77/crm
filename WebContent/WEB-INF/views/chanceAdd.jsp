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

    <script type="text/javascript">    
  //  document.form1.attributes["action"].value  = "../chance/doChanceModify";
       /*  $(function ()
        {
            $("form").ligerForm();
            alert("form");
        }); 
         */
    </script>
    
    <style type="text/css">
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
  

</head>
<body style="padding:10px">
<input id="op" type="hidden" value="${op}"/>
    <form:form name="form1" id="form1" method="post" action="/crm/chance/doChance" modelAttribute="chance">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">��ţ�</td>
                <td align="left" class="l-table-edit-td"><form:input readonly="true" path="id" name="id" type="text" id="id" ltype="text" /></td>
                <td align="left">������Դ��</td>
                <td align="left"><form:input path="source" name="source" type="text" id="source" ltype="text" /></td>
            </tr>
            <tr>
                <td  align="right" class="l-table-edit-td" valign="top">�ͻ����ƣ�</td>
                 <td align="left" class="l-table-edit-td" ><form:input path="customerName"  name="customerName" type="text" id="customerName" ltype="text" />
                 </td><td align="left">�ɹ����ʣ�</td> 
                  <td align="left"><form:input path="rate" name="rate" type="text" id="rate" ltype="text" /></td>
            </tr>   
            
            <tr>
                <td align="right"  valign="top" >��Ҫ��</td>
                <td align="left" class="l-table-edit-td" colspan="3">
                  <form:input path="title" name="title" type="text" id="title" ltype="text" width="300" />
                </td>
            </tr>  
                 
           <tr>
                <td align="right" class="l-table-edit-td" valign="top">&nbsp;��ϵ�ˣ�</td>
                 <td align="left" class="l-table-edit-td" ><form:input path="linkMan" name="linkman" type="text" id="linkman" ltype="text" />
                 </td>
                 <td align="left">��ϵ�绰��</td> 
                  <td align="left"><form:input path="linkPhone" name="linkPhone" type="text" id="linkPhone" ltype="text" /></td>
            </tr>   
            
              <tr>
                <td align="right" class="l-table-edit-td">����������</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
             <%--    <form:textarea path="description"  /> --%>
                <form:textarea path="description" cols="100" rows="4" class="l-textarea" style="width:430px"/>
                </td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">�����ˣ�</td>
                <td align="left" class="l-table-edit-td"><form:input value="${user.loginName }" name="createId.loginName" type="text" id="createId" ltype="text" readonly="true" path="createId.loginName" /></td>
                <td align="left">�������ڣ�</td>
                <td align="left"><form:input path="createDate" name="assignDate" type="text" id="assignDate" readonly="true" ltype="text" /></td>
            </tr>
          
         <tr>
                <td align="right" class="l-table-edit-td">ָ�ɸ�:</td>
                <td align="left" class="l-table-edit-td"><form:input path="assignId.loginName" name="assignId.loginName" type="text" id="assignId" readonly="true" ltype="text" /></td>
                <td align="left">ָ�����ڣ�</td>
                <td align="left"><form:input path="assignDate" name="assignDate" type="text" id="assignDate" readonly="true" ltype="text" /></td>
            </tr>
        </table>
 <br />
<input type="submit" value="�ύ" id="Button1" class="l-button l-button-submit" /> 
<input type="reset" value="����" class="l-button l-button-reset"/>
    </form:form>
    <div style="display:none">
    <!--  ����ͳ�ƴ��� --></div>
</body>


</html>

 <script type="text/javascript">

	//	alert("op.val():"+$("#op").val());
  
	 
		 	 var op=$("#op").val();
			//$("#form1").attr("action","../chance/doChanceModify");
			
			if(op=="update"){
				 $("#Button1").val("�����޸�");
					
				$("#form1").attr("action","../chance/doChanceModify");
				
				
				//var act=document.getElementById("form1").attributes['action'];
				//act.value="../chance/doChanceModify";
				//alert(act.value);
			}  
		  
			

 

  </script>

