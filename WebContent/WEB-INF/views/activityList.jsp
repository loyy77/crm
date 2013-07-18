<hidden id="cId" value="${custId}"></hidden>
<%--
  Created by IntelliJ IDEA.
  User: loyy
  Date: 13-7-17
  Time: 下午6:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <base href="<%=basePath %>">
    <title></title>
    <link href="<c:url value="/resources/ligerUI/skins/Aqua/css/ligerui-all.css"/>" rel="stylesheet" type="text/css"/>
    <link href="<c:url value="/resources/ligerUI/skins/ligerui-icons.css"/>" rel="stylesheet" type="text/css"/>
    <script src="<c:url value="/resources/jquery/jquery-1.3.2.min.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/json2.js"/>" type="text/javascript"></script>
    <script src="<c:url value="/resources/ligerUI/js/core/base.js"/>" type="text/javascript"></script>
    <%--<script src="<c:url value="/resources/ligerUI/js/plugins/ligerDialog.js"/>" type="text/javascript"></script>--%>
    <%--<script src="<c:url value="/resources/ligerUI/js/plugins/ligerTextBox.js"/>" type="text/javascript"></script>--%>
    <%--<script src="<c:url value="/resources/ligerUI/js/plugins/ligerCheckBox.js"/>" type="text/javascript"></script>--%>
    <%--<script src="<c:url value="/resources/ligerUI/js/plugins/ligerComboBox.js"/>" type="text/javascript"></script>--%>
    <script src="<c:url value="/resources/ligerUI/js/plugins/ligerGrid.js"/>" type="text/javascript"></script>
    <%--<script src="<c:url value="/resources/ligerUI/js/plugins/ligerDateEditor.js"/>" type="text/javascript"></script>--%>
    <%--<script src="<c:url value="/resources/ligerUI/js/plugins/ligerSpinner.js"/>" type="text/javascript"></script>--%>
    <%--<script src="<c:url value="/resources/ligerUI/js/plugins/ligerToolBar.js"/>" type="text/javascript"></script>--%>


    <script type="text/javascript">


        $(f_initGrid);

        var manager, g;
        function f_initGrid() {

            g = manager = $("#maingrid").ligerGrid({
                columns: [
                    { display: '编号', name: 'id', align: 'center', width: 50 },
                    { display: '客户名', name: "customerName", minWidth: 120 },
                    { display: '日期', name: 'atvDate', minWidth: 150 },
                    { display: '地点', name: 'place', minWidth: 140 },
                    { display: '简介', name: 'title', minWidth: 140 },
                    { display: '详情', name: 'description', minWidth: 140 },
                    {display:'操作',render:function(record,value,rowindex,column){
                                value='<input type="button" value="编辑"/>';

                                value+="<div id='btn'></div> ";
                            value+="<script type='text/javascript'>";

                            value+=" $('#btn').ligerButton( { click: function (){alert('删除！');}});";
                           value+=" <\/script>";

                            return  value;
                    }}
                ],
                usePager:false,
                url: "atv/list?custId=" + $("#cId").val(),
                width: '99%'


            });



        }
        ;


    </script>

</head>
<body>


<!-- 工具条 ，该工具条包含 增加、修改、删除  -->
<div id="toptoolbar" style="width:99%"></div>
<!-- 表格，数据展示的主要区域 -->
<div id="maingrid" style="margin-top:0px"></div>
<br/>

<div style="display:none;"/>


</body>
</html>





