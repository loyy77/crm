
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
	//$("#loginf").submit();
	//����ajax�����¼
	$.ajax({type:'post',url:'user/login1',cache:false,dataType:'json',
		data:[{'loginName':loginName},{'loginPass':loginPass}],
            beforeSend:function(xhr, settings)
            {
             //   alert("ajax");
                // �����postData��ʽ���Σ�����Ҫ�����������
                xhr.setRequestHeader("ajax-encoding", "YES");
            },
		success:function(data){
            //alert(date);
			if(data=="false"){
               // alert(data);
				//alert("��¼ʧ��,�˺Ż��������")

               // $("#msg-rst").html("<span class='div-msg'>��¼ʧ��,�˺Ż��������</span>");
                $("#msgLoginName").html("<span class='div-msg'>��¼ʧ��,�˺Ż��������</span>");



                $("#loginName").focus();
				return;
			}else{
               // alert("true");
             //   jQuery.ajax( {url:"/user/toMain" ,async: false} );
               // $.get("/user/toMain");
              //  window.location.href="user/toMain";
            $("#loginf").submit();
            }
			
			
		},error:function(result){
			alert("��¼ʧ�ܣ�ϵͳ����"+result);
		}
	}
			);
	
	
	
}