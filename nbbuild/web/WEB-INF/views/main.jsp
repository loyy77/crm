<%-- 
    Document   : main
    Created on : 2012-10-19, 21:06:36
    Author     : LiShixi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Layout Example</title>
<script type="text/javascript" src="../resources/jquery_ui/jquery.1.8.2.js"></script>
<script type="text/javascript" src="../resources/jquery.layout-latest.js"></script>
<script type="text/javascript">
$(document).ready(function () {
	$('body').layout({ applyDemoStyles: true });
});
</script>
</head>
<body>
<div class="ui-layout-center">Center
	<p><a href="http://layout.jquery-dev.net/demos.html">Go to the Demos page</a></p>
	<p>* Pane-resizing is disabled because ui.draggable.js is not linked</p>
	<p>* Pane-animation is disabled because ui.effects.js is not linked</p>
</div>
<div class="ui-layout-north">North</div>
<div class="ui-layout-south">South</div>
<div class="ui-layout-east">East</div>
<div class="ui-layout-west">West</div>
</body>
</html>