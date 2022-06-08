<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>계좌개설</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<h1>계좌개설</h1>	

<input type="radio" name="bank_account" value="0" checked="checked">입출금통장
<input type="radio" name="bank_account" value="1">적금통장
<input type="radio" name="bank_account" value="2">예금통장

<br><br>

<form action="acc_create.do" method="post">

<!-- 입출금통장 -->
<div id="selectIp_account">
종류 : <input type="text" name="accountType" value="입출금통장" readonly="readonly"><br>
이름 : <input type="text" name="userid"><br>
계좌 비밀번호 : <input type="password" name="acc_pass"><br>
<input type="submit" value="개설하기" >
<input type="reset" value="취소하기" >
</div>

<!-- 적금통장 -->
<div id="selectSaving_account">
종류 : <input type="text" name="accountType" value="적금통장" readonly="readonly"><br>
이름 : <input type="text" name="userid"><br>
계좌 비밀번호 : <input type="password" name="acc_pass"><br>
<input type="submit" value="개설하기" >
<input type="reset" value="취소하기" >
</div>

<!-- 예금통장 -->
<div id="selectYe_account">
종류 : <input type="text" name="accountType" value="예금통장" readonly="readonly"><br>
이름 : <input type="text" name="userid"><br>
계좌 비밀번호 : <input type="password" name="acc_pass"><br>
<input type="submit" value="개설하기" >
<input type="reset" value="취소하기" >
</div>

</form>


<script>
//입출금통장 - id= Ip_account  / 적금통장 : saving_account  / 예금통장 : ye_account

	$(function(){
		$("#selectSaving_account").hide();
		$("#selectYe_account").hide();
		//var selectCheck = $("input[name='bank_account']:checked").val();
		
		$("input[name='bank_account']").change(function(){
		//	 alert("ok");
		
			 //적금통장 선택시
			if($("input[name='bank_account']:checked").val() == "1"){
				$("#selectIp_account").hide();
				$("#selectYe_account").hide();
				$("#selectSaving_account").show();
				
			}
			//예금통장 선택시
			else if($("input[name='bank_account']:checked").val() == "2"){
				$("#selectIp_account").hide();
				$("#selectSaving_account").hide();
				$("#selectYe_account").show();
				
			}
			//입출금통장 선택시
			else if($("input[name='bank_account']:checked").val() == "0"){
				$("#selectYe_account").hide();
				$("#selectSaving_account").hide();
				$("#selectIp_account").show();
				
			}
		});
	});
</script>


</body>
</html>