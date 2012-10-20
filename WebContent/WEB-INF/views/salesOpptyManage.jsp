<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head><title>
</title>
    <link href="ligerUI/skins/Aqua/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="ligerUI/skins/Gray/css/all.css" rel="stylesheet" type="text/css" /> 
    <script src="js/jquery-1.3.2.min.js" type="text/javascript"></script>
     <script src="ligerUI/js/core/base.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerForm.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerDateEditor.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerComboBox.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerCheckBox.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerButton.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerDialog.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerRadio.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerSpinner.js" type="text/javascript"></script>
    <script src="ligerUI/js/plugins/ligerTextBox.js" type="text/javascript"></script> 
    <script src="ligerUI/js/plugins/ligerTip.js" type="text/javascript"></script>
    <script src="resources/jquery-validation/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="resources/jquery-validation/jquery.metadata.js" type="text/javascript"></script>
    <script src="resources/jquery-validation/messages_cn.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(function ()
        {
            $("form").ligerForm();
        }); 
    </script>
    <style type="text/css">
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-reset{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
    </style>
  

</head>
<body style="padding:10px">

    <form name="form1" method="post" action="../service/EmployeeEdit.aspx?ID=0" id="form1">
<div>
</div>
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
            <tr>
                <td align="right" class="l-table-edit-td">编号：</td>
                <td align="left" class="l-table-edit-td"><input name="txtName" type="text" id="txtName" ltype="text" /></td>
                <td align="left">机会来源：</td>
                <td align="left"><input name="txtName" type="text" id="txtName" ltype="text" /></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">客户名称：</td>
                 <td align="left"> <input name="txtName" type="text" id="txtName" ltype="text" />
                 </td><td align="left">成功几率：</td> 
                  <td align="left"><input name="txtName" type="text" id="txtName" ltype="text" /></td>
            </tr>   
            
            <tr>
                <td align="right" class="l-table-edit-td" valign="top">概要：</td>
                <td align="left" class="l-table-edit-td">
                  <input name="txtName" type="text" id="txtName" ltype="text" width="120" />
                </td><td align="left"></td>
            </tr>  
                 
           <tr>
                <td align="right" class="l-table-edit-td" valign="top">联系人：</td>
                 <td align="left"><input name="txtName" type="text" id="txtName" ltype="text" />
                 </td><td align="left">联系电话：</td> 
                  <td align="left"><input name="txtName" type="text" id="txtName" ltype="text" /></td>
            </tr>   
            
              <tr>
                <td align="right" class="l-table-edit-td">机会描述：</td>
                <td align="left" class="l-table-edit-td" colspan="3"> 
                <textarea cols="100" rows="4" class="l-textarea" style="width:400px"></textarea>
                </td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">创建人：</td>
                <td align="left" class="l-table-edit-td"><input name="txtName" type="text" id="txtName" ltype="text" /></td>
                <td align="left">创建日期：</td>
                <td align="left"><input name="txtName" type="text" id="txtName" ltype="text" /></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">部门：</td>
                <td align="left" class="l-table-edit-td">
                <select name="ddlDepart" id="ddlDepart" ltype="select">
	<option value="1">主席</option>
	<option value="2">研发中心</option>
	<option value="3">销售部</option>
	<option value="4">市场部</option>
	<option value="5">顾问组</option>
</select>
                </td>
            </tr>
         <tr>
                <td align="right" class="l-table-edit-td">指派给:</td>
                <td align="left" class="l-table-edit-td"><input name="txtName" type="text" id="txtName" ltype="text" /></td>
                <td align="left">指派日期：</td>
                <td align="left"><input name="txtName" type="text" id="txtName" ltype="text" /></td>
            </tr>
        </table>
 <br />
<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" /> 
<input type="reset" value="重置" class="l-button l-button-reset"/>
    </form>
    <div style="display:none">
    <!--  数据统计代码 --></div>
</body>

  
</html>