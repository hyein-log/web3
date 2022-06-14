<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</head>
<body>
<!-- <form id="idSearch" method="post" action="IdSearch.do" encType="UTF-8"> -->
	이름<input type="text" name="name" id="name"><br>
	이메일<input type="text" name="email2" id="email2"><br>
  <input type="button" id="confirm_btn" value="인증번호 발송"><br>
<!-- </form> -->
<hr>
<form action="MailSend.do" method="post" id="mailsendfrm">
  <input type="hidden" name="id" id="id">
  <input type="hidden" name="email" id="email">
</form>
<script>
	$("#confirm_btn").on("click", function(){
		//var frm = $("#idSearch");	
		
		if($("#name").val().length < 1){
			alert("이름을 입력해주세요.");
			return false;
		}
		if($("#email2").val().length < 1){
			alert("이메일을 정확하게 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"IdSearch.do",
			type:"post",
			data:{"name":$("#name").val(),
				"email":$("#email2").val()},
			success:function(responseData){
				if(responseData!=0){
					$("#id").val(responseData);
					$("#email").val($("#email2").val());
					$("#mailsendfrm").submit();
				   //location.href="MailSend.do?id=" + responseData+"&email="+$("#email").val();
				}else{
					alert("해당하는 id가 없습니다.");
					$("#name").val("");
					$("#email").val("");
					$("#name").focus();
				}
			}
		});
		
	});  
	

</script>
</body>
</html>