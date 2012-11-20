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
	//给文本框加样式
	$("input[type=text]").addClass("l-text");
	
	
	//Tip
	$("#id").ligerTip();
	$("#rate").ligerTip();
	$("#assignId.userId").ligerTip();
	
	});
	
	
	//定时刷新指派日期
	
	
	var assignDate=$("#assignDate");
	//var assignDate=$("#t2");
	var btn=$("#Button1");
	var id=window.setInterval(function(){
		//alert(currentTime());
		//alert(assignDate.val());
		assignDate.val(currentTime());
	},1000);
	btn.click(function(){
		if(btn.val()=='保存指派'){
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
                <td align="right" class="l-table-edit-td">编号：</td>
                <td align="left" class="l-table-edit-td"><form:input readonly="true" path="id" name="id" type="text" id="id"  title="系统自动生成" ltype="text" /></td>
                <td align="left">机会来源：</td>
                <td align="left"><form:input path="source" name="source" type="text" id="source" ltype="text" /></td>
            </tr>
            <tr>
                <td  align="right" class="l-table-edit-td" valign="top">客户名称：</td>
                 <td align="left" class="l-table-edit-td" ><form:input path="customerName"  name="customerName" type="text" id="customerName" ltype="text" />*
                 </td><td align="left">成功几率：</td> 
                  <td align="left"><form:input path="rate" name="rate" type="text" id="rate" ltype="text" title="0-100之间的整数"/>*</td>
            </tr>   
            
            <tr>
                <td align="right" class="l-table-edit-td"   valign="top"  >概要：</td>
                <td align="left" class="l-table-edit-td" colspan="3">
                  <form:input path="title" name="title" type="text" id="title" ltype="text" />*
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
             <%--    <form:textarea path="description"   /> --%>
                <form:textarea path="description" cols="90" rows="4" cssClass="l-textarea" />
                </td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">创建人：</td>
                <td align="left" class="l-table-edit-td"><form:input value="${user.loginName }" name="createId.loginName" type="text" id="createId" ltype="text" readonly="true" path="createId.loginName" />*</td>
                <td align="left">创建日期：</td>
                <td align="left"><form:input path="createDate" name="assignDate" type="text" id="assignDate" readonly="true" ltype="text" />*</td>
            </tr>
          
         <tr>
                <td align="right" class="l-table-edit-td">指派给：</td>
                <td align="left" class="l-table-edit-td">
               <%--  <form:input path="assignId.trueName" name="assignId.loginName" type="text" id="assignId" readonly="true" ltype="text" /> --%>
                	<!-- itemValue="${trueName}" itemLabel="${id}" -->  
			
                	<select id="assignId.userId" name="assignId.userId" title="在这里指派" class="l-text">
                <option value="0">未指派</option>
					<c:forEach var="u" items="${assignList }">
							
							<option <c:if test="${chance.assignId.userId==u.userId }">selected="selected"</c:if> value="${u.userId }">${u.trueName }</option>
					</c:forEach>
                	
                	</select>
                
                </td>
                <td align="left">指派日期：</td>
                <td align="left"><form:input path="assignDate" readonly="true"  name="assignDate" type="text" id="assignDate" ltype="text" title="插入自动生成" /></td>
            </tr>
        </table>
 <br />
<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="reset" value="重置" class="l-button l-button-reset"/>
    </form:form>
    <div style="display:none">
    <!--  数据统计代码 --></div>
    <input type="hidden" id="result" name="${result }"/>
    <input type="hidden" id="chanceId" value="${chance.id }"/>
    <input type="hidden" id="userId" value="${curruser.userId }"/>
</body>


</html>

 <script type="text/javascript">
	 
		 	 var op=$("#op").val();
			
			if(op=="update"){
				$("#Button1").val("保存修改");
				$("#form1").attr("action","chance/doChanceModify?userId="+$("#userId").val());
				
			}else if(op=='assign'){
				
				$("input[type='text']").attr("readonly","true"); 
				$("input[type='text']").attr("disabled","true");
				$("textarea").attr("disabled","true");
				$("#Button1").val("保存指派");
				$("#form1").attr("action","chance/doChanceAssign?chanceId="+$("#chanceId").val());
				
			}
			
			//给文本框加样式
		$("input[type=text]").addClass("l-text");
			$("#title").css({width:"340px"});
			$("#description").css({width:"340px"});
			/* var result=$("#result").val();
			if(result=="success"){
				alert("修改成功！");
			}
 */
  </script>

