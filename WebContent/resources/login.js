
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
		$("#msgLoginName").html("<span class='div-msg'>��¼������Ϊ�գ�</span>");
		$("#loginName").focus();
		//$("#msgLoginName").html("");
		return;
	}else if(loginPass==""){
		$("#msgLoginPass").html("<span class='div-msg'>���벻��Ϊ�գ�</span>");
		$("#loginPass").focus();
		//$("#msgLoginPass").html("");
		return;
	}
	$("#loginf").submit();
	//����ajax�����¼
	$.post({type:'post',url:'login',cachce:false,dataType:'json',
		data:[{'loginName':loginName},{'loginPass':loginPass}],
		success:function(result){
			if(!result){
				alert("��¼ʧ��,�˺Ż��������")
				$("#loginName").focus();
				return;
			}
			
			
		},error:function(result){
			alert("��¼ʧ�ܣ�ϵͳ����"+result);
		}
	}
			);
	
	
	
}