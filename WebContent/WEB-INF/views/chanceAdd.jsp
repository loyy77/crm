<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ taglib prefix="form"  uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<base   href="<%=basePath %>"><title>
</title>
    <link href="resources/ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
  <!--   <link href="resources/ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" />  -->
    <script src="resources/jquery/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="resources/ligerUI/js/ligerui.min.js" type="text/javascript"></script>
<!--      <script src="/crm/ligerUI/js/core/base.js" type="text/javascript"></script>  -->
  <!--   <script src="/crm/ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="/crm/ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="/crm/ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
-->

    <script src="resources/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="resources/jquery-validation/jquery.metadata.js" type="text/javascript"></script> 
    <script src="resources/jquery-validation/messages_cn.js" type="text/javascript"></script>

    <style type="text/css">
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
  
<script type="text/javascript">

function currentTime(){
	var d = new Date(),str = '';
	 str += d.getFullYear()+'-';
	 str  += d.getMonth() + 1+'-';
	 str  += d.getDate()+' ';
	 str += d.getHours()+':'; 
	 str  += d.getMinutes()+':'; 
	str+= d.getSeconds(); 
	return str;
	}


$().ready(function(){
	$("#form1").validate();
	$("input[type='text']").attr("class","required");//("required");
	$("#rate").attr("class","{range:[0,100]}");
	$("#assignId").attr("class","");
	//���ı������ʽ
	$("input[type=text]").addClass("l-text");
	
	
	//Tip
	$("#id").ligerTip();
	$("#rate").ligerTip();
	$("#assignId.userId").ligerTip();
	
	});
	
	
	//��ʱˢ��ָ������
	
	
	var assignDate=$("#assignDate");
	//var assignDate=$("#t2");
	var btn=$("#Button1");
	var id=window.setInterval(function(){
		//alert(currentTime());
		//alert(assignDate.val());
		assignDate.val(currentTime());
	},1000);
	btn.click(function(){
		if(btn.val()=='����ָ��'){
			 window.clearInterval(id);
		}
	});

</script>
</head>
<body style="padding:10px">

<div id="tt"></div>
<input id="op" type="hidden" value="${op}"/>
    <form:form name="form1" id="form1" method="post" action="chance/doChance" modelAttribute="chance">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" border=0 >
            <tr>
                <td align="right" class="l-table-edit-td">��ţ�</td>
                <td align="left" class="l-table-edit-td"><form:input readonly="true" path="id" name="id" type="text" id="id"  title="ϵͳ�Զ�����" ltype="text" /></td>
                <td align="left">������Դ��</td>
                <td align="left"><form:input path="source" name="source" type="text" id="source" ltype="text" /></td>
            </tr>
            <tr>
                <td  align="right" class="l-table-edit-td" valign="top">�ͻ����ƣ�</td>
                 <td align="left" class="l-table-edit-td" ><form:input path="customerName"  name="customerName" type="text" id="customerName" ltype="text" />*
                 </td><td align="left">�ɹ����ʣ�</td> 
                  <td align="left"><form:input path="rate" name="rate" type="text" id="rate" ltype="text" title="0-100֮�������"/>*</td>
            </tr>   
            
            <tr>
                <td align="right" class="l-table-edit-td"   valign="top"  >��Ҫ��</td>
                <td align="left" class="l-table-edit-td" colspan="3">
                  <form:input path="title" name="title" type="text" id="title" ltype="text" />*
                </td>
            </tr>  
                 
           <tr>
                <td align="right" class="l-table-edit-td" valign="top">&nbsp;��ϵ�ˣ�</td>
                 <td align="left" class="l-table-edit-td" ><form:input path="linkMan" name="linkman" type="text" id="linkman" ltype="text" />
                 </td>
                 <td align="left">��ϵ�绰��</td> 
                  <td align="left"><form:input path="linkPhone" name="linkPhone" type="text" id="linkPhone" ltype="text" class="required"/></td>
            </tr>   
            
              <tr>
                <td align="right" class="l-table-edit-td">����������</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
             <%--    <form:textarea path="description"   /> --%>
                <form:textarea path="description" cols="90" rows="4" cssClass="l-textarea" />
                </td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">�����ˣ�</td>
                <td align="left" class="l-table-edit-td"><form:input value="${user.loginName }" name="createId.loginName" type="text" id="createId" ltype="text" readonly="true" path="createId.loginName" />*</td>
                <td align="left">�������ڣ�</td>
                <td align="left"><form:input path="createDate" name="assignDate" type="text" id="assignDate" readonly="true" ltype="text" />*</td>
            </tr>
          
         <tr>
                <td align="right" class="l-table-edit-td">ָ�ɸ���</td>
                <td align="left" class="l-table-edit-td">
               <%--  <form:input path="assignId.trueName" name="assignId.loginName" type="text" id="assignId" readonly="true" ltype="text" /> --%>
                	<!-- itemValue="${trueName}" itemLabel="${id}" -->  
			
                	<select id="assignId.userId" name="assignId.userId" title="������ָ��" class="l-text">
                <option value="0">δָ��</option>
					<c:forEach var="u" items="${assignList }">
							
							<option <c:if test="${chance.assignId.userId==u.userId }">selected="selected"</c:if> value="${u.userId }">${u.trueName }</option>
					</c:forEach>
                	
                	</select>
                
                </td>
                <td align="left">ָ�����ڣ�</td>
                <td align="left"><form:input path="assignDate" readonly="true"  name="assignDate" type="text" id="assignDate" ltype="text" title="�����Զ�����" /></td>
            </tr>
        </table>
 <br />
<input type="submit" value="�ύ" id="Button1" class="l-button l-button-submit" /> 
<input type="reset" value="����" class="l-button l-button-reset"/>
    </form:form>
    <div style="display:none">
    <!--  ����ͳ�ƴ��� --></div>
    <input type="hidden" id="result" name="${result }"/>
    <input type="hidden" id="chanceId" value="${chance.id }"/>
    <input type="hidden" id="userId" value="${curruser.userId }"/>
</body>


</html>

 <script type="text/javascript">
	 
		 	 var op=$("#op").val();
			
			if(op=="update"){
				$("#Button1").val("�����޸�");
				$("#form1").attr("action","chance/doChanceModify?userId="+$("#userId").val());
				
			}else if(op=='assign'){
				
				$("input[type='text']").attr("readonly","true"); 
				$("input[type='text']").attr("disabled","true");
				$("textarea").attr("disabled","true");
				$("#Button1").val("����ָ��");
				$("#form1").attr("action","chance/doChanceAssign?chanceId="+$("#chanceId").val());
				
			}
			
			//���ı������ʽ
		$("input[type=text]").addClass("l-text");
			$("#title").css({width:"340px"});
			$("#description").css({width:"340px"});
			/* var result=$("#result").val();
			if(result=="success"){
				alert("�޸ĳɹ���");
			}
 */
  </script>

