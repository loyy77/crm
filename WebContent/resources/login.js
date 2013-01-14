
$(function(){
	
	$("input[class='login-text']").change(function(){
		$(".div-msg").html("");
		
	
	});
	$("input")
	
	$("#btnLogin").click(function(){
	doLogin();
});

});

function doLogin(){
	
	var loginName=$("#loginName").val();
	var loginPass=$("#loginPass").val();
	if(loginName==""){
		$("#msgLoginName").html("<span class='div-msg'>登录名不能为空！</span>");
		$("#loginName").focus();
		//$("#msgLoginName").html("");
		return;
	}else if(loginPass==""){
		$("#msgLoginPass").html("<span class='div-msg'>密码不能为空！</span>");
		$("#loginPass").focus();
		//$("#msgLoginPass").html("");
		return;
	}
	$("#loginf").submit();
	//发送ajax请求登录
	$.post({type:'post',url:'login',cachce:false,dataType:'json',
		data:[{'loginName':loginName},{'loginPass':loginPass}],
		success:function(result){
			if(!result){
				alert("登录失败,账号或密码错误！")
				$("#loginName").focus();
				return;
			}
			
			
		},error:function(result){
			alert("登录失败，系统错误"+result);
		}
	}
			);
	
	
	
}