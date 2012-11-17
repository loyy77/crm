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
      	  }else if(item.text=="ִ�мƻ�"||item.id==2){
      		  var chanceId=getSelected();
      		  if(!chanceId)return;
      		  	window.location.href="plan/toDevPlan?chanceId="+chanceId;
      	  }else if(item.id==3){ //�����ɹ�
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
      		  
      		 var chanceId=getSelected();
   		  if(!chanceId)return;
   		  $.ligerDialog.confirm("ȷ��ִ�п���ʧ�ܲ�����",function(rst){
   			  if(!rst)return;
   			  $.post("chance/doDevFail",{'chanceId':chanceId},function(data){
   				  if(data=="fail"){
   					  $.ligerDialog.tip({title:'������ʾ',content:'����ʧ��'});
   				  }else{
   					  $.ligerDialog.tip({title:'������ʾ',content:'�����ɹ�'});
   				  }
   				  
   			  });
   		  });
      	  }
      	  else if(item.id==5){//����
      		alert("����"+ $("#custId").val());
      		
      	  }
        }
    	//������
        $(function ()
       {
            $("#toptoolbar").ligerToolBar({ items: [
            /*     { id:1,text: '�༭', click: itemclick , icon:'add'},
                { line:true }, */
                { id:2,text: '��ϵ��', click: itemclick },
                { line:true },
                { id:3,text: '������¼', click: itemclick },
                { line:true },
                { id:4,text: '��ʷ����', click: itemclick },
               { line:true},
               { id:5,text: '����', click : itemclick}
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
            //�������ṹ
           //var mainform = $("#myform");
            mainform.ligerForm({
                inputWidth: 170, labelWidth: 90, space: 40,
                fields: [
                { name: "ProductID", type: "hidden" },
                { display: "���", name: "id", newline: true,group: "������Ϣ", groupicon: groupicon}, 
               // { display: "���", name: "id", newline: true, type: "text", validate: { required: true,minlength:3 }, group: "������Ϣ", groupicon: groupicon}, 
                { display: "��Ӧ��", name: "SupplierID", newline: false, type: "select", comboboxName: "CompanyName", options: { valueFieldID: "SupplierID" } },
                { display: "��� ", name: "CategoryID", newline: true, type: "select", comboboxName: "CategoryName", options: { valueFieldID: "CategoryID" } },
                { display: "���� ", name: "AddTime", newline: true, type: "date" },
                { display: "�ۿ�", name: "QuantityPerUnit", newline: false, type: "number" },
                { display: "����", name: "UnitPrice", newline: true,  type: "number" },
                { display: "�����", name: "UnitsInStock", newline: true, type: "digits", group: "���", groupicon: groupicon },
                { display: "������", name: "UnitsOnOrder", newline: false, type: "digits" },
                { display: "��ע", name: "Remark", newline: true, type: "text" ,width:470 }
                ]
            });

            var validator = $("#myform").validate({
                //����״̬�������ύ���ݵ�
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
<input type="hidden" id="op" value="${op}" />
<input type="hidden" id="custId" value="${customer.id }"/>
 <!-- ������ ���ù��������� ���ӡ��޸ġ�ɾ��  -->
  <div id="toptoolbar" style="width:99%"></div>  
<div>


   <div id="d-form" class="d-form">
   <form id="myform">
   		<table id="t-main" class="t-main" cellspacing="4" cellpadding="5">
   			
   			<tr>
   				<td colspan=3 align=left><img src="resources/ligerUI/skins/icons/communication.gif"/></td>
   				
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">�ͻ����</td>
   				<td align="left">${customer.id }</td>
   				<td class="tb-tr-odd">����</td>
   				<td><input type="text" value="${customer.name }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">����</td>
   				<td><select>
   				<c:forEach var="r" items="${regionList }">
   					<option value="${r.dictValue }">${r.dictItem }</option>
   				</c:forEach>
   				
   				</select></td>
   				<td class="tb-tr-odd">�ͻ�����</td>
   				<td><select>
   					<option></option>
   				</select></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">�ͻ��ȼ�</td>
   				<td><select>
   				<c:forEach var="l" items="${custLevel }">
   					
   				<option value="${l.dictValue }">${l.dictItem }</option>
   				</c:forEach>
   					
   				</select></td>
   				<td></td>
   				<td></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">�ͻ������</td>
   				<td><select>
   					<option value="1">��</option>
   					<option value="2">���</option>
   					<option value="3" selected>����</option>
   					<option value="4">�����</option>
   					<option value="5">������</option>
   				</select></td>
   				<td class="tb-tr-odd">�ͻ����ö�</td>
   				<td><select>
   				<option value="1">��</option>
   					<option value="2">���</option>
   					<option value="3" selected>����</option>
   					<option value="4">�����</option>
   					<option value="5">������</option>
   				</select></td>
   			</tr>
   			
   			<tr>
   				<td colspan=4 align=left><img src="resources/ligerUI/skins/icons/communication.gif"/></td>
   				
   			</tr>
   		
   			<tr>
   				<td class="tb-tr-odd">��ַ</td>
   				<td><input value="${customer.addr }"/></td>
   				<td class="tb-tr-odd">�ʱ�</td>
   				<td><input value="${customer.zip }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">�绰</td>
   				<td><input value="${customer.tel }"/></td>
   				<td class="tb-tr-odd">����</td>
   				<td><input value="${customer.fax }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">��ַ</td>
   				<td><input type="text" value="${customer.website }"/></td>
   				<td></td>
   				<td></td>
   			</tr>
   		
   			
   		
   		<tr>
   				<td colspan=4 align=left><img src="resources/ligerUI/skins/icons/communication.gif"/></td>
   				
   			</tr>
   		
   		
   			<tr>
   				<td class="tb-tr-odd">Ӫҵִ��ע���</td>
   				<td><input value="${customer.licence }"/></td>
   				<td class="tb-tr-odd">����</td>
   				<td><input value="${customer.chieftain }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">ע���ʽ���Ԫ��</td>
   				<td><input value="${customer.bankroll }"/></td>
   				<td class="tb-tr-odd">��Ӫҵ��</td>
   				<td><input value="${customer.turnover }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">��������</td>
   				<td><input value="${customer.bank }"/></td>
   				<td class="tb-tr-odd">�����ʺ�</td>
   				<td><input value="${customer.account }"/></td>
   			</tr>
   			<tr>
   				<td class="tb-tr-odd">��˰�ǼǺ�</td>
   				<td><input value="${customer.localTax }"/></td>
   				<td class="tb-tr-odd">��˰�ǼǺ�</td>
   				<td><input value="${customer.nationalTax }"/></td>
   			</tr>
   			
   		</table>
   </form> 
   		</div>
</div>
</body>
</html>

 
  