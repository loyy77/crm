<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="GBK"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE>login_</TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=GBK">
<style>
	th{
		font-size:12px;
		text-align:right;
		font-weight:normal;
	}
	td{
		font-size:12px;
		text-align:left;
	}
	input{
		width:100px;
		font-size:12px;
		border:solid 1px lightblue;
	}
</style>
</HEAD>
<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0 style="text-align:center;padding-top:20px;">


<TABLE WIDTH=800 BORDER=0 CELLPADDING=0 CELLSPACING=0>
    <tr><td>
            <form:form id="loginf" method="POST" action="login"  >
        <table width="100%">
        <tr> 
          <th>用户名</th>
          <td><input name="loginName"/></td>
        </tr>
        <tr> 
          <th>密码</th>
          <td><input name="loginPass"/></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><input type="submit" title="登录"/></td>
        </tr>
       
      </table>
</form:form>
</td></tr>
</TABLE>
</BODY>
</HTML>