<%-- 
    Document   : main
    Created on : 2012-10-19, 21:06:36
    Author     : LiShixi
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=gbk" pageEncoding="gbk" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk" >
<title></title>

 <link href="<c:url value="/resources/ligerUI/skins/Aqua/css/ligerui-all.css" />" rel="stylesheet" type="text/css" ></link>
<%--  <link href="<c:url value="/resources/ligerUI/skins/Gray/css/all.css" />" rel="stylesheet" type="text/css" ></link> --%>
<script src="<c:url value="/js/jquery-1.3.2.min.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/ligerUI/js/ligerui.min.js"/>" type="text/javascript" charset="gbk"></script>
<script src="<c:url value="/ligerUI/js/plugins/ligerTree.js"/>" type="text/javascript" ></script>
<script src="<c:url value="/resources/treedata.js" />"	type="text/javascript"></script>

<script type="text/javascript">
            var tab = null;
            var accordion = null;
            var tree = null;
            $(function ()
            {

                //布局
                $("#layout1").ligerLayout({ leftWidth: 190, height: '100%',heightDiff:-34,space:4, onHeightChanged: f_heightChanged });

                var height = $(".l-layout-center").height();

                //Tab
                $("#framecenter").ligerTab({ height: height });

                //面板
                $("#accordion1").ligerAccordion({ height: height - 24, speed: null });

                $(".l-link").hover(function ()
                {
                    $(this).addClass("l-link-over");
                }, function ()
                {
                    $(this).removeClass("l-link-over");
                });
                //树
                $("#tree2").ligerTree({
                    data : indexdata,
                    checkbox: false,
                    slide: false,
                    nodeWidth: 120,
                    btnClickToToggleOnly:false, 
                    attribute: ['nodename', 'url'],
                    onSelect: function (node)
                    {
                        if (!node.data.url) return;
                        var tabid = $(node.target).attr("tabid");
                        if (!tabid)
                        {
                            tabid = new Date().getTime();
                            $(node.target).attr("tabid", tabid)
                        } 
                        f_addTab(tabid, node.data.text, node.data.url);
                    }
                });

                tab = $("#framecenter").ligerGetTabManager();
                accordion = $("#accordion1").ligerGetAccordionManager();
                tree = $("#tree1").ligerGetTreeManager();
                $("#pageloading").hide();

            });
            function f_heightChanged(options)
            {
                if (tab)
                    tab.addHeight(options.diff);
                if (accordion && options.middleHeight - 24 > 0)
                    accordion.setHeight(options.middleHeight - 24);
            }
            function f_addTab(tabid,text, url)
            { 
                tab.addTabItem({ tabid : tabid,text: text, url: url });
            } 
             
            
     </script> 
<script type="text/javascript">
        $(function ()
        {
      
            $("#tree1").ligerTree({
            	checkbox: false,
                slide: false,
                nodeWidth: 120,
                btnClickToToggleOnly:false, 
                attribute: ['nodename', 'url'],
                data: [
                       { text: '营销管理',
				children : [ {
					text : '销售机会管理',
					url : 'chance/toList'
				}, {
					text : '节点1.2'
				}, {
					text : '节点1.3',
					children : [ {
						text : '节点1.3.1'
					}, {
						text : '节点1.3.2'
					} ]
				}, {
					text : '节点1.4'
				} ]
			}, {
				text : '节点2'
			}, {
				text : '节点3'
			}, {
				text : '节点4'
			} ],
			onSelect : function(node) {
				if (!node.data.url)
					return;
				var tabid = $(node.target).attr("tabid");
				if (!tabid) {
					tabid = new Date().getTime();
					$(node.target).attr("tabid", tabid)
				}
				f_addTab(tabid, node.data.text, node.data.url);
			}

		});

		tab = $("#framecenter").ligerGetTabManager();
		//  accordion = $("#accordion1").ligerGetAccordionManager();
		tree = $("#tree1").ligerGetTreeManager();
		$("#pageloading").hide();
	});
</script>
<style type="text/css"> 
    body,html{height:100%;}
    body{ padding:0px; margin:0;   overflow:hidden;}  
    .l-link{ display:block; height:26px; line-height:26px; padding-left:10px; text-decoration:underline; color:#333;}
    .l-link2{text-decoration:overline; color:white; margin-left:2px;margin-right:2px;}
    .l-link3{color:white}
    .l-layout-top{background:#102A49; color:White;}
    .l-layout-bottom{ background:#E5EDEF; text-align:center;}
    #pageloading{position:absolute; left:0px; top:0px; background:white url('images/loading.gif') no-repeat center; width:100%; height:100%;z-index:99999;}
    .l-link{ display:block; line-height:22px; height:22px; padding-left:16px;border:1px solid white; margin:4px;}
    .l-link-over{ background:#FFEEAC; border:1px solid #DB9F00;} 
    .l-winbar{ background:#2B5A76; height:30px; position:absolute; left:0px; bottom:0px; width:100%; z-index:99999;}
    .space{ color:#E7E7E7;}
    /* 顶部 */ 
    .l-topmenu{ margin:0; padding:0; height:31px; line-height:31px; background:url('images/top.jpg') repeat-x bottom;  position:relative; border-top:1px solid #1D438B;  }
    .l-topmenu-logo{ color:#E7E7E7; padding-left:35px; line-height:26px;background:url('images/topicon.gif') no-repeat 10px 5px;}
    .l-topmenu-welcome{  position:absolute; height:24px; line-height:24px;  right:30px; top:2px;color:#070A0C;}
    .l-topmenu-welcome a{ color:#E7E7E7; text-decoration:underline} 

 </style>
</head>
<body style="padding:0px;background:#EAEEF5;">  
<!-- <div id="pageloading"></div>   -->
<div id="topmenu" class="l-topmenu">
    <div class="l-topmenu-logo">客户关系管理系统</div>
    <div class="l-topmenu-welcome">
    	<span class="l-link3">当前登录用户：${user.trueName }</span>
        <a href="index.aspx" class="l-link2">服务器版本</a>
        <span class="space">|</span>
        <a href="https://me.alipay.com/daomi" class="l-link2" target="_blank">捐赠</a> 
        <span class="space">|</span>
         <a href="http://bbs.ligerui.com" class="l-link2" target="_blank">论坛</a>
    </div> 
</div>
  <div id="layout1" style="width:99.2%; margin:0 auto; margin-top:4px; "> 
 	<div style="width:200px; height:300px; margin:0px; float:left;  overflow:auto;  ">
    	
    	</div> 
        <div position="left"  title="" id="accordion1"> 
                  	<ul id="tree1"></ul>
        </div>
        <div position="center" id="framecenter" style="color:black;"> 
            <div tabid="home" title="我的主页" style="height:300px" >
                <iframe frameborder="0" name="home" id="home" src="<c:url value="views/welcome.htm"/>"></iframe>
            </div> 
        </div> 
        
    </div>
    <div  style="height:32px; line-height:32px; text-align:center;">
            Copyright   &copy; 2011-2012 www.ligerui.com
    </div>
    <div style="display:none"></div>
</body>
</html>
