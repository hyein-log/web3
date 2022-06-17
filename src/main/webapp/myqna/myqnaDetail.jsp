<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
html {
	position: relative;
	min-height: 100%;
	margin: 0;
	font-family: 'Nanum Gothic';
}

body {
	min-height: 100%;
}	

.wrap {
	width:35%;
	margin: auto;
	padding-top: 5rem;
} 

.sendForm{
    width: 40%;
    margin-left: 520px;
  /*   font-family: 'Nanum Gothic', sans-serif; */
    padding: 3%;
    margin-top: 2%;
    margin-bottom: 10%;
    margin-left: 400px;
 /*    margin: auto; */
    border: 10px solid #B6D9FF;
}

.h2{
	margin-left: 400px;
	margin-top: 100px; 
	color: #007bff;
}
	
	
.admin{
	width: 40px;
}	
	
.time{
	width: 12px;
}

.user{
	width: 15px;
}

.num{
	width: 13px;
}


.sendbtnDiv{
    margin-bottom: 10px;
    margin-left: 380px;
    color: #007bff;
}
.btnList, #updateBtn, .deleteBtn{
    background-color: white;
    border: 1px solid #007bff;
    color: #007bff;
    font-size: 15px;
    border-radius: 15px;
    padding: 10px 20px;
    font-weight: 400;
    height: 46px;
} 

.btnList {
    background-color: #007bff;
    border: none;
    color: #fff;
    font-size: 15px;
    border-radius: 15px;
    padding: 10px 20px;
    font-weight: 400;
    height: 46px;
} 

 #updateBtn:hover, .deleteBtn:hover {
    background-color: #007bff;
    border: none;
    color: #fff;
    font-size: 15px;
    border-radius: 15px;
    padding: 10px 20px;
    font-weight: 400;
    height: 46px;
} 

.title{
	font-size: 15px;
	color: black;
	font-family: 'Nanum Gothic', sans-serif;
}

.title2{
	border: none;
	font-size: 25px;
	font-weight: bold;
	color:#007bff;
	width: 500px;
	margin-left: 20px;
	font-family: 'Nanum Gothic', sans-serif;
}
.num2{
	color: gray;
	font-size: 13px;
	font-weight: bold;
	font-family: 'Nanum Gothic', sans-serif;
	
}

.user2{
	margin-left: 30px;
	color: gray;
	font-size: 13px;
	font-weight: bold;
	font-family: 'Nanum Gothic', sans-serif;
}

.date{
	margin-left: 30px;
	color: gray;
	font-size: 13px;
	font-weight: bold;
	font-family: 'Nanum Gothic', sans-serif;
}

.content{
	border: none;
	font-size: 14px;
	 font-weight: bold; 
	color: #424242;
	resize: none;
	font-family: 'Nanum Gothic', sans-serif;
	line-height: 25px;
}

.content2{
	font-size: 15px;
	color: black;
	font-family: 'Nanum Gothic', sans-serif;
	
}


</style>
</head>
<body>
	<jsp:include page="../finances-master/header/mainHeader.jsp"></jsp:include>
	
<div id="wrab">
<h2 class="h2">[문의 내용]</h2>	

<form action="myqnaUpdate.do" method="post" class="sendForm">

<span class="title">제목 :</span> 
<input type="text" name="title"  value="${myqna.qa_title }"  class="title2">
<hr style="width: 480px;margin-left: 2px">


<!-- 글번호 -->
<img alt="" src="../finances-master/images/num5.png" class="num">
<span class="num2"> ${myqna.qa_id} 
<input type="hidden" name="qaid" value="${myqna.qa_id}"></span>

<!-- 작성자 -->
<span class="user2">
<img alt="" src="../finances-master/images/user2.png" class="user"> ${member.id}</span>

<!-- 작성일 -->
<span class="date">
<img src="../finances-master/images/time1.png" class="time"> ${myqna.qa_date}</span>

<br><br><br><br>

<span class="content2">내용 :</span> <br><br>
<textarea rows="5" cols="70" name="content" class="content">${myqna.qa_content }</textarea>
<%-- <input type="text" name="content"  value="${myqna.qa_content }" class="content">  --%>


<br><br>

<hr style="color: gray;">

<p>
<span><img alt="" src="../finances-master/images/admin.jpg" class="admin">
<span style="font-weight: bold;color: gray;">관리자 &nbsp; </span> <span style="color: gray;font-size: 12px;"><img src="../finances-master/images/time1.png" class="time"> ${myqna.qa_date }</span> 
<br><br><span style="margin-left: 40px;font-size: 14px; ">${myqna.qa_answer}</span></span>
</p>

<br><br><br>
<div class="sendbtnDiv">
	<input type="button"   class="btnList" value="목록"> 
	<input type="submit" id="updateBtn" value="수정">
	<input type="button" class="deleteBtn" data-qaid="${myqna.qa_id}" value="삭제">
</div>


</form>
</div>
	<script type="text/javascript">
	$("#answer_btn").on("click",function(){
		location.href = "UpdateAnswer.do?qa_id="+$("#qaid").val()
										+"&qa_content="+$("#qna_answer").val();
	});
	jQuery(function ($) {

        $.fn.getUrlParameter = function (sParam) {

            var sPageURL = decodeURIComponent(window.location.search.substring(1)),

                    sURLVariables = sPageURL.split('&'),

                    sParameterName,

                    i;



            for (i = 0; i < sURLVariables.length; i++) {

                sParameterName = sURLVariables[i].split('=');



                if (sParameterName[0] === sParam) {

                    return sParameterName[1] === undefined ? true : sParameterName[1];

                }

            }

        };
        var admin = $.fn.getUrlParameter('admin');
		if(admin == "1"){
			$("#user_detail").hide();
			$("#admin_detail").show();
		}else{
			$("#user_detail").show();
			$("#admin_detail").hide();
		}
	});
		//목록가기
		$(function() {
			$(".btnList").click(function() {
				location.href = "../myqna/myqnalist.do";
			});
			//수정가기
			/* $("#updateBtn").click(function() {
				location.href = "../myqna/myqnaUpdate.do?qaid=" + ${myqna.qa_id};
			}); */

			//삭제하기
			$(".deleteBtn").click(function() {
				var qaid = $(this).attr("data-qaid");
				if (confirm(qaid + "번을 정말 삭제하시겠습니까?")) {
					location.href = "../myqna/myqnaDelete.do?qaid=" + qaid;
				}
			});

		});
	</script>
</body>
<jsp:include page="../finances-master/footer/footer.jsp"></jsp:include>
</html>