
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
	//$("#loginf").submit();
	//发送ajax请求登录
	$.ajax({type:'post',url:'user/login1',cache:false,dataType:'json',
		data:[{'loginName':loginName},{'loginPass':loginPass}],
            beforeSend:function(xhr, settings)
            {
             //   $("#msg-rst").html("<span>loading....</span>")
             //   alert("ajax");
                // 如果是postData方式传参，则需要设置请求参数
               // xhr.setRequestHeader("ajax-encoding", "YES");
                $("#msgLoginName").html("<span>登陆中...</span>");
           },
		    success:function(data){
			if(data=="false"){
                $("#msgLoginName").html("<span class='div-msg'>登录失败,账号或密码错误！</span>");
                $("#loginName").focus();
				return;
			}else{
               // alert("true");
             //   jQuery.ajax( {url:"/user/toMain" ,async: false} );
               // $.get("/user/toMain");
              //  window.location.href="user/toMain";
            $("#loginf").submit();
            }
			
			
		},
            complete:function(){
                $("#msgLoginName").html("");
            }
            ,error:function(result){
			alert("登录失败，系统错误"+result);
		}
	}
			);
	
	
	
}