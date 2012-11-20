<%@ page language="java" contentType="text/html; charset=gbk"
	pageEncoding="gbk"%>

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
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title></title>
<link
	href="<c:url value="/resources/ligerUI/skins/Aqua/css/ligerui-all.css"/>"
	rel="stylesheet" type="text/css" />
<link href="<c:url value="/resources/ligerUI/skins/ligerui-icons.css"/>"
	rel="stylesheet" type="text/css" />
<script src="<c:url value="/resources/jquery/jquery-1.3.2.min.js"/>"
	type="text/javascript"></script>
<script src="<c:url value="/resources/json2.js"/>"
	type="text/javascript"></script>
<script type="text/javascript" src="resources/ligerUI/js/ligerui.min.js"></script>
<script type="text/javascript"
	src="resources/jquery-validation/jquery.metadata.js"></script>
<script type="text/javascript"
	src="resources/jquery-validation/jquery.validate.min.js"></script>
<script type="text/javascript"
	src="resources/jquery-validation/messages_cn.js"></script>
<script type="text/javascript">
	//����ѡ���еı��
	function getSelected() {
		var manager = $("#maingrid").ligerGetGridManager();
		var row = manager.getSelectedRow();
		if (!row) {
			alert('��ѡ��Ҫ��������');
			return;
		}
		return row.id;
		// alert(JSON.stringify(row));
	}
	function getAssignId() {
		var manager = $("#maingrid").ligerGetGridManager();
		var row = manager.getSelectedRow();
		if (!row) {
			alert('��ѡ����');
			return;
		}
		return row.assignId;
	}

	//ÿ����ť��Ӧ���¼�
	function itemclick(item) {
		var flag = true;
		if (item.id == 1) {//�༭
			var custId = getSelected();
			if (!custId)
				return;
			window.location.href = "cust/toCustEdit?custId=" + custId;
		} else if (item.id == 2) {//��ϵ��
			var custId = $("#custId").val();
			if (!custId)
				return;
			window.location.href = "linkman/toList?custId=" + custId;
		} else if (item.id == 3) { //�����ɹ�
			var userId = $("#userId").val();
			var assignId = getAssignId();
			var bb = userId == assignId;
			var chanceId = getSelected();
			$.ligerDialog.confirm("ȷ�����ۻ���:" + chanceId + "Ϊ�����ɹ���",
					function(r) {
						if (r) {
							//window.location.href="chance/doDevSuccess?chanceId="+chanceId;
							$.post("chance/doDevSuccess", {
								'chanceId' : chanceId
							}, function(data) {
								if (data == "success") {
									$.ligerDialog.success("�����ɹ���");
									//��������
									var m = $("#maingrid")
											.ligerGetGridManager();
									m.loadData();
								} else {
									$.ligerDialog.error("����ʧ�ܣ�");
								}
							});
						}
					});
		} else if (item.id == 4) {

			var chanceId = getSelected();
			if (!chanceId)
				return;
			$.ligerDialog.confirm("ȷ��ִ�п���ʧ�ܲ�����", function(rst) {
				if (!rst)
					return;
				$.post("chance/doDevFail", {
					'chanceId' : chanceId
				}, function(data) {
					if (data == "fail") {
						$.ligerDialog.tip({
							title : '������ʾ',
							content : '����ʧ��'
						});
					} else {
						$.ligerDialog.tip({
							title : '������ʾ',
							content : '�����ɹ�'
						});
					}

				});
			});
		} else if (item.id == 5) {//����
			alert("����" + $("#custId").val());

		} else if (item.id == 6) {
		//	alert($("#custId"));
			window.location.href = "linkman/toList?custId="
					+ $("#custId").val();
		}
	}
	//������,��ʾ�İ�ť
	$(function() {
		$("#toptoolbar").ligerToolBar({
			items : [
			/*     { id:1,text: '�༭', click: itemclick , icon:'add'},
			    { line:true }, */
			/*   { id:2,text: '��ϵ��', click: itemclick },
			  { line:true },
			  { id:3,text: '������¼', click: itemclick },
			  { line:true },
			  { id:4,text: '��ʷ����', click: itemclick },
			 { line:true}, */
			{
				id : 5,
				text : '����',
				click : itemclick
			}, {
				line : true
			}, {
				id : 6,
				text : '���ص���ϵ���б�',
				click : itemclick
			} ]
		});

	});
</script>


<script type="text/javascript">
	$().ready(function() {

		$("input").attr("class", "l-text");
		$("input[type=radio]").attr("class","");
		$("select").addClass("l-text");

		var result = $("#result").val();
		if (result == "success") {
			$.ligerDialog.alert("���³ɹ�");
		} else if (result == "fail") {
			$.ligerDialog.alert("����ʧ��");
		}
		
		var op=$("#op").val();
		if(op=="update")
		{
			$("#myform").attr("action","linkman/update");
			
			$("#btn_sava").val("�����޸�");
		}
	});
</script>
<style type="text/css">
.tb-tr-odd{
line-height:24px;
	text-align:center;
	width:100px;
}
</style>
</head>
<body style="padding: 0px">

	<!-- ������ ���ù��������� ���ӡ��޸ġ�ɾ��  -->
	<div id="toptoolbar" style="width: 99%"></div>
	<div>
		<div id="d-form" class="d-form">
			<form id="myform" action="linkman/add" method="post">
					<input type="hidden" id="result" value="${result }">
	<input type="hidden" id="op" value="${op}" />
	<input type="hidden" id="custId" name="custId" value="${custId}" />
				
				
				<table id="t-main" class="t-main" cellspacing="0" cellpadding="0" border=0>
					<tr>
						<td colspan=4 align="left"><img
							src="resources/ligerUI/skins/icons/communication.gif" /></td>
					</tr>
					<tr>
					<c:if test="${linkman.id!=null }">	<input type="hidden" name="id" value="${linkman.id }"/> </c:if>
						<td class="tb-tr-odd"><input type="hidden" name="customerId" value="${custId }" />����</td>
						<td align="left"><input name="name" type="text" value="${linkman.name }" /></td>
						<td class="tb-tr-odd">�Ա�</td>
						<td align="left" >
								��
								${linkman.sex  }
								<input <c:if test="${linkman.sex=='��'}">checked</c:if> <c:if test="${linkman.sex==null}">checked</c:if>  type="radio" name="sex" value="��" />
								Ů
								<input <c:if test="${linkman.sex=='Ů'}">checked</c:if> type="radio" name="sex" value="Ů"  />
								
							
						</td>
					</tr>
					<tr>
						<td class="tb-tr-odd">ְλ</td>
						<td><input name="position" type="text" value="${linkman.position }" /></td>
						<td class="tb-tr-odd">�칫�绰</td>
						<td><input name="tel" type="text" value="${linkman.mobile }" /></td>
					</tr>
					<tr>
						<td class="tb-tr-odd">�ֻ�</td>
						<td><input name="mobile" type="text" value="${linkman.tel }" /></td>
						<td class="tb-tr-odd">��ע</td>
						<td><input name="memo" type="text" value="${linkman.memo }" /></td>
					</tr>
				</table>
				<input id="btn_sava" type="submit" value="����" />
			</form>
		</div>
	</div>
</body>
</html>


