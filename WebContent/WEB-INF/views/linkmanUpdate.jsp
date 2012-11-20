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
	//返回选中行的编号
	function getSelected() {
		var manager = $("#maingrid").ligerGetGridManager();
		var row = manager.getSelectedRow();
		if (!row) {
			alert('请选择要操作的行');
			return;
		}
		return row.id;
		// alert(JSON.stringify(row));
	}
	function getAssignId() {
		var manager = $("#maingrid").ligerGetGridManager();
		var row = manager.getSelectedRow();
		if (!row) {
			alert('请选择行');
			return;
		}
		return row.assignId;
	}

	//每个按钮响应的事件
	function itemclick(item) {
		var flag = true;
		if (item.id == 1) {//编辑
			var custId = getSelected();
			if (!custId)
				return;
			window.location.href = "cust/toCustEdit?custId=" + custId;
		} else if (item.id == 2) {//联系人
			var custId = $("#custId").val();
			if (!custId)
				return;
			window.location.href = "linkman/toList?custId=" + custId;
		} else if (item.id == 3) { //开发成功
			var userId = $("#userId").val();
			var assignId = getAssignId();
			var bb = userId == assignId;
			var chanceId = getSelected();
			$.ligerDialog.confirm("确定销售机会:" + chanceId + "为开发成功吗？",
					function(r) {
						if (r) {
							//window.location.href="chance/doDevSuccess?chanceId="+chanceId;
							$.post("chance/doDevSuccess", {
								'chanceId' : chanceId
							}, function(data) {
								if (data == "success") {
									$.ligerDialog.success("操作成功！");
									//重载数据
									var m = $("#maingrid")
											.ligerGetGridManager();
									m.loadData();
								} else {
									$.ligerDialog.error("操作失败！");
								}
							});
						}
					});
		} else if (item.id == 4) {

			var chanceId = getSelected();
			if (!chanceId)
				return;
			$.ligerDialog.confirm("确定执行开发失败操作吗？", function(rst) {
				if (!rst)
					return;
				$.post("chance/doDevFail", {
					'chanceId' : chanceId
				}, function(data) {
					if (data == "fail") {
						$.ligerDialog.tip({
							title : '操作提示',
							content : '操作失败'
						});
					} else {
						$.ligerDialog.tip({
							title : '操作提示',
							content : '操作成功'
						});
					}

				});
			});
		} else if (item.id == 5) {//保存
			alert("保存" + $("#custId").val());

		} else if (item.id == 6) {
		//	alert($("#custId"));
			window.location.href = "linkman/toList?custId="
					+ $("#custId").val();
		}
	}
	//工具条,显示的按钮
	$(function() {
		$("#toptoolbar").ligerToolBar({
			items : [
			/*     { id:1,text: '编辑', click: itemclick , icon:'add'},
			    { line:true }, */
			/*   { id:2,text: '联系人', click: itemclick },
			  { line:true },
			  { id:3,text: '交往记录', click: itemclick },
			  { line:true },
			  { id:4,text: '历史订单', click: itemclick },
			 { line:true}, */
			{
				id : 5,
				text : '保存',
				click : itemclick
			}, {
				line : true
			}, {
				id : 6,
				text : '返回到联系人列表',
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
			$.ligerDialog.alert("更新成功");
		} else if (result == "fail") {
			$.ligerDialog.alert("保存失败");
		}
		
		var op=$("#op").val();
		if(op=="update")
		{
			$("#myform").attr("action","linkman/update");
			
			$("#btn_sava").val("保存修改");
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

	<!-- 工具条 ，该工具条包含 增加、修改、删除  -->
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
						<td class="tb-tr-odd"><input type="hidden" name="customerId" value="${custId }" />姓名</td>
						<td align="left"><input name="name" type="text" value="${linkman.name }" /></td>
						<td class="tb-tr-odd">性别</td>
						<td align="left" >
								男
								${linkman.sex  }
								<input <c:if test="${linkman.sex=='男'}">checked</c:if> <c:if test="${linkman.sex==null}">checked</c:if>  type="radio" name="sex" value="男" />
								女
								<input <c:if test="${linkman.sex=='女'}">checked</c:if> type="radio" name="sex" value="女"  />
								
							
						</td>
					</tr>
					<tr>
						<td class="tb-tr-odd">职位</td>
						<td><input name="position" type="text" value="${linkman.position }" /></td>
						<td class="tb-tr-odd">办公电话</td>
						<td><input name="tel" type="text" value="${linkman.mobile }" /></td>
					</tr>
					<tr>
						<td class="tb-tr-odd">手机</td>
						<td><input name="mobile" type="text" value="${linkman.tel }" /></td>
						<td class="tb-tr-odd">备注</td>
						<td><input name="memo" type="text" value="${linkman.memo }" /></td>
					</tr>
				</table>
				<input id="btn_sava" type="submit" value="保存" />
			</form>
		</div>
	</div>
</body>
</html>


