<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous">
</script>
</head>
<body>
<form id="joinForm" name="joinForm">
	아이디<input type="text" name="id" id="id" onkeydown="inputIdChk()" required>
	<button id="dbCheckId" onclick="fn_dbCheckId();" class="checkId">중복확인</button>
	<input type="hidden" id="idDuplication" name="idDuplication" value="idUncheck"><br>
	비밀번호<input type="text" name="password1" id="password1" required><br>
	비밀번호 확인<input type="text" name="password2" id="password2" required><br>
	이름<input type="text" name="name" id="name" required><br>
	이메일<input type="text" name="email" id="email" onkeydown="inputEmailChk()" required>
	<button id="dbCheckEmail" onclick="fn_dbCheckEmail();" class="checkEmail">중복확인</button>
	<input type="hidden" id="emailDuplication" name="emailDuplication" value="emailUncheck"><br>
	주소<input id="member_post"  type="text" placeholder="Zip Code" readonly onclick="findAddr()">
  		<input id="member_addr" type="text" placeholder="Address" readonly> <br>
  		<input type="text" placeholder="Detailed Address" id="addressDetail"> <br>
	전화번호<input type="text" name="phone" id="phone" required><br>
	<input type="button" id="join_btn" value="가입하기"><br>
</form>
<script>
	$("#join_btn").on("click",function(){
		if($("#id").val().length < 1){
			alert("아이디를 입력해주세요!");	
			return false;
		}
		if($("#idDuplication").val() != "idCheck"){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		if($("#password1").val().length < 1){
			alert("패스워드를 입력해주세요!");
			return false;
		}
		if($("#password2").val().length < 1){
			alert("패스워드 확인을 입력해주세요!");
			return false;
		}
		if($("#password1").val() != $("#password2").val()){
			alert("비밀번호 확인 실패.");
			return false;
		}
		if($("#name").val().length < 1){
			alert("이름을 입력해주세요!");
			return false;
		}
		if($("#email").val().length < 1){
			alert("이메일을 입력해주세요!");
			return false;
		} 
		if($("#member_addr").val().length < 1){
			alert("주소를 입력해주세요!");
			return false;
		} 
		if($("#phone").val().length < 1){
			alert("휴대폰번호를 입력해주세요!");
			return false;
		}
		location.href = "InsertMember.do?id="+$("#id").val()
				+"&password="+$("#password1").val()
				+"&name="+$("#name").val()
				+"&email="+$("#email").val()
				+"&address="+$("#member_addr").val()
				+"&addressDetail="+$("#addressDetail").val()
				+"&phone="+$("#phone").val();
	});
	function fn_dbCheckId(){
		var joinForm = document.joinForm;
		var f_id = document.getElementById("id").value;
		if(f_id.length==0 || f_id==""){
			alert("아이디를 입력해주세요.");
			joinForm.id.focus();
		}else{
			window.open("idCheck.do?id="+f_id,"checkForm","width=300","height=100");
		}
	}
	function inputIdChk(){
		//var frm = document.joinForm;
		var f_dbCheckId = document.getElementById('dbCheckId');
		document.getElementById("idDuplication").value = "idUncheck";
		f_dbCheckId.disabled=false;
		f_dbCheckId.style.opacity=1;
		f_dbCheckId.style.cursor="pointer";
	}
	function fn_dbCheckEmail(){
		var joinForm = document.joinForm;
		var f_email = document.getElementById("email").value;
		if(f_email.length==0 || f_email==""){
			alert("이메일을 입력해주세요.");
			joinForm.email.focus();
		}else{
			window.open("emailCheck.do?email="+f_email,"checkForm","width=300","height=100");
		}
	}
	function inputEmailChk(){
		//var frm = document.joinForm;
		var f_dbCheckEmail = document.getElementById('dbCheckEmail');
		document.getElementById("emailDuplication").value = "emailUncheck";
		f_dbCheckEmail.disabled=false;
		f_dbCheckEmail.style.opacity=1;
		f_dbCheckEmail.style.cursor="pointer";
	}
</script>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>

</html>