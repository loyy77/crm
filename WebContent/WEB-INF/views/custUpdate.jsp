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
<script type="text/javascript" src="resources/ligerUI/js/ligerui.min.js"></script>
<script type="text/javascript" src="resources/jquery-validation/jquery.metadata.js"></script>
<script type="text/javascript" src="resources/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript" src="resources/jquery-validation/messages_cn.js"></script>
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
		  if(!custId)return;
			 window.location.href="cust/toCustEdit?custId="+custId;
      	  }else if(item.id==2){//联系人
      		//	alert("linkman.toList");
      		  var custId=	  $("#custId").val();
      		  if(!custId)return;
      		  	window.location.href="linkman/toList?custId="+custId;
      	  }else if(item.id==3){ //开发成功
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
      		  
      		 var chanceId=getSelected();
   		  if(!chanceId)return;
   		  $.ligerDialog.confirm("确定执行开发失败操作吗？",function(rst){
   			  if(!rst)return;
   			  $.post("chance/doDevFail",{'chanceId':chanceId},function(data){
   				  if(data=="fail"){
   					  $.ligerDialog.tip({title:'操作提示',content:'操作失败'});
   				  }else{
   					  $.ligerDialog.tip({title:'操作提示',content:'操作成功'});
   				  }
   				  
   			  });
   		  });
      	  }
      	  else if(item.id==5){//保存
      		alert("保存"+ $("#custId").val());
      		
      	  }else if(item.id==6){
      		  window.location.href="cust/toList";
      	  }
        }
    	//工具条
        $(function ()
       {
            $("#toptoolbar").ligerToolBar({ items: [
            /*     { id:1,text: '编辑', click: itemclick , icon:'add'},
                { line:true }, */
                { id:2,text: '联系人', click: itemclick },
                { line:true },
                { id:3,text: '交往记录', click: itemclick },
                { line:true },
                { id:4,text: '历史订单', click: itemclick },
               { line:true},
               { id:5,text: '保存', click : itemclick},
               { line:true},
               { id:6,text: '返回到列表', click : itemclick}
            ]
            }); 
            
           
        });

</script>
 <!-- form -->
    <!--    <script type="text/javascript"> 
        var groupicon = "resources/ligerUI/skins/icons/communication.gif";
        $(function ()
        {
            $.metadata.setType("attr", "validate");
            //创建表单结构
           //var mainform = $("#myform");
            mainform.ligerForm({
                inputWidth: 170, labelWidth: 90, space: 40,
                fields: [
                { name: "ProductID", type: "hidden" },
                { display: "编号", name: "id", newline: true,group: "基础信息", groupicon: groupicon}, 
               // { display: "编号", name: "id", newline: true, type: "text", validate: { required: true,minlength:3 }, group: "基础信息", groupicon: groupicon}, 
                { display: "供应商", name: "SupplierID", newline: false, type: "select", comboboxName: "CompanyName", options: { valueFieldID: "SupplierID" } },
                { display: "类别 ", name: "CategoryID", newline: true, type: "select", comboboxName: "CategoryName", options: { valueFieldID: "CategoryID" } },
                { display: "日期 ", name: "AddTime", newline: true, type: "date" },
                { display: "折扣", name: "QuantityPerUnit", newline: false, type: "number" },
                { display: "单价", name: "UnitPrice", newline: true,  type: "number" },
                { display: "库存量", name: "UnitsInStock", newline: true, type: "digits", group: "库存", groupicon: groupicon },
                { display: "订购量", name: "UnitsOnOrder", newline: false, type: "digits" },
                { display: "备注", name: "Remark", newline: true, type: "text" ,width:470 }
                ]
            });

            var validator = $("#myform").validate({
                //调试状态，不会提交数据的
                debug: true,
                errorPlacement: function (lable, element)
                {

                    if (element.hasClass("l-textarea"))
                    {
                        element.addClass("l-textarea-invalid");
                    }
                    else if (element.hasClass("l-text-field"))
                    {
                        element.parent().addClass("l-text-invalid");
                    }
                    $(element).removeAttr("title").ligerHideTip();
                    $(element).attr("title", lable.html()).ligerTip();
                },
                success: function (lable)
                {
                    var element = $("#" + lable.attr("for"));
                    if (element.hasClass("l-textarea"))
                    {
                        element.removeClass("l-textarea-invalid");
                    }
                    else if (element.hasClass("l-text-field"))
                    {
                        element.parent().removeClass("l-text-invalid");
                    }
                    $(element).removeAttr("title").ligerHideTip();
                },
                submitHandler: function ()
                {
                    alert("Submitted!");
                }
            }); 
        });  
    </script>  -->
     
    <script type="text/javascript">
    $().ready(function(){
    	
    	
    	$("input").attr("class","l-text");
    	$("select").addClass("l-text");
    //	$("td:odd").css("text-align","center");
    //$("tr + td").css("text-align","center");
    
        var result=$("#result").val();
        if(result=="success"){
        	$.ligerDialog.alert("更新成功");
        }else if(result=="fail"){
        	$.ligerDialog.alert("保存失败");
        }
    });
    </script>
<style type="text/css">
	.d-form{margin:0px;padding-left: 20px;}
	.t-main{padding: 5px;}
	.t-main tr td{ margin: 5px;height: 24px;line-height: 24px;}
	.tb-tr-odd{text-align:center;width:100px}
</style>
</head>
<body  style="padding:0px">  
<input type="hidden" id="result" value="${result }">
<input type="hidden" id="op" value="${op}" />
<input type="hidden" id="custId" value="${customer.id }"/>
 <!-- 工具条 ，该工具条包含 增加、修改、删除  -->
  <div id="toptoolbar" style="width:99%"></div>  
<div>


   <div id="d-form" class="d-form">
   <form id="myform" action="cust/update" method="post">
   		<table id="t-main" class="t-main" cellspacing="4" cellpadding="5">
   			
   			<tr>
   				<td colspan=3 align=left><img src="resources/ligerUI/skins/icons/communication.gif"/></td>
   				
   			</tr>
   			<tr>
   				<input type="hidden" name="id" value="${customer.id }"/>
   				<td class="tb-tr-odd">客户编号</td>
   				<td align="left">${customer.id }</td>
   				<td class="tb-tr-odd">名称</td>
   				<td><input name="name" type="text" value="${customer.name }"/></td>
   			</tr>
   			<tr> 
   				<td class="tb-tr-odd">地区</td>
   				<td><select name="region">
   				<c:forEach var="r" items="${regionList }">
   					<option value="${r.dictValue }" <c:if test="${r.dictItem==customer.region }">selected</c:if> >${r.dictItem }</option>
   				</c:forEach>
   				
   				</select></td>
   				<td class="tb-tr-odd">客户经理</td>
   				<td>
   		
   				<select name="managerId">
   				<c:forEach var="cm" items="${custManagerList }">
   					<option value="${cm.userId }" <c:if test="${customer.managerId==cm.userId}">selected</c:if>>${cm.trueName }</option>
   				</c:forEach>
   					
   				</select></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">客户等级</td>
   				<td><select name="levelLabel">
   				<c:forEach var="l" items="${custLevel }">
   					
   				<option value="${l.dictValue }" <c:if test="${l.dictItem==customer.levelLabel }">selected</c:if>>${l.dictItem }</option>
   				</c:forEach>
   					
   				</select></td>
   				<td></td>
   				<td></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">客户满意度</td>
   				<td><select name="satisfy">
   				
   				<c:forEach begin="1" end="5" step="1" varStatus="index" var="s">
   					<option value="${s }"<c:if test="${customer.satisfy==s}">selected</c:if>><c:forEach begin="1" end="${s }">☆</c:forEach></option>
   				</c:forEach>
   					
   				</select></td>
   				<td class="tb-tr-odd">客户信用度</td>
   				<td><select name="credit">
   					<c:forEach begin="1" end="5" step="1" varStatus="index" var="s">
   					<option value="${s }"<c:if test="${customer.credit==s}">selected</c:if>><c:forEach begin="1" end="${s }">☆</c:forEach></option>
   				</c:forEach>
   				</select></td>
   			</tr>
   			
   			<tr>
   				<td colspan=4 align=left><img src="resources/ligerUI/skins/icons/communication.gif"/></td>
   				
   			</tr>
   		
   			<tr>
   				<td class="tb-tr-odd">地址</td>
   				<td><input name="addr" value="${customer.addr }"/></td>
   				<td class="tb-tr-odd">邮编</td>
   				<td><input name="zip" value="${customer.zip }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">电话</td>
   				<td><input name="tel" value="${customer.tel }"/></td>
   				<td class="tb-tr-odd">传真</td>
   				<td><input name="fax" value="${customer.fax }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">网址</td>
   				<td><input name="website" type="text" value="${customer.website }"/></td>
   				<td></td>
   				<td></td>
   			</tr>
   		
   			
   		
   		<tr>
   				<td colspan=4 align=left><img src="resources/ligerUI/skins/icons/communication.gif"/></td>
   				
   			</tr>
   		
   		
   			<tr>
   				<td class="tb-tr-odd">营业执照注册号</td>
   				<td><input name="licence" value="${customer.licence }"/></td>
   				<td class="tb-tr-odd">法人</td>
   				<td><input name="chieftain" value="${customer.chieftain }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">注册资金（万元）</td>
   				<td><input name="bankroll" value="${customer.bankroll }"/></td>
   				<td class="tb-tr-odd">年营业额</td>
   				<td><input name="turnover" value="${customer.turnover }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">开户银行</td>
   				<td><input name="bank" value="${customer.bank }"/></td>
   				<td class="tb-tr-odd">银行帐号</td>
   				<td><input name="account" value="${customer.account }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">地税登记号</td>
   				<td><input name="localTax" value="${customer.localTax }"/></td>
   				<td class="tb-tr-odd">国税登记号</td>
   				<td><input name="nationalTax" value="${customer.nationalTax }"/></td>
   			</tr>
   			
   		</table>
   		
   		<input type="submit" value="保存" />
   </form> 
   		</div>
</div>
</body>
</html>

 
  