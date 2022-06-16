<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	
.sendForm{
    width: 40%;
    margin-left: 520px;
  /*   font-family: 'Nanum Gothic', sans-serif; */
    padding: 3%;
    margin-top: 2%;
    margin-bottom: 10%;
    margin-left: 400px;
 /*    margin: auto; */
    border: 1px solid #E0E0E0;
}

.h2{
	margin-left: 400px;
	margin-top: 100px; 
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


.sendDiv {
    margin-bottom: 30px;
    color: #007bff;
}
/* 
.btnList, #updateBtn, .deleteBtn {
    background-color: #007bff;
    border: none;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    color: #fff;
    font-size: 16px;
    border-radius: 30px;
    padding: 10px 30px;
    font-weight: 400;
    height: 46px;
} */
</style>
</head>
<body>
	<jsp:include page="../finances-master/header/mainHeader.jsp"></jsp:include>
	

<h2 class="h2">문의 상세보기</h2>	

<form action="myqnaUpdate.do" method="post" class="sendForm">

<span style="font-size: 15px;color: gray;">제목 :</span> 
<input type="text" name="title"  value="${myqna.qa_title }" style="border: none;font-size: 30px;font-weight: bold;color:#007bff; ">
<br><br>

<!-- 글번호 -->
<img alt="" src="../finances-master/images/num5.png" class="num"><span style="color: gray;font-size: 13px;font-weight: bold;"> ${myqna.qa_id} 
<input type="hidden" name="qaid" value="${myqna.qa_id}"></span>

<!-- 작성자 -->
<span style="margin-left: 30px;color: gray;font-size: 13px;font-weight: bold;">
<img alt="" src="../finances-master/images/user2.png" class="user"> ${member.id}</span>

<!-- 작성일 -->
<span style="margin-left: 30px;color: gray;font-size: 13px;font-weight: bold;">
<img src="../finances-master/images/time1.png" class="time"> ${myqna.qa_date}</span>

<br><br><br><br>

<span style="font-size: 15px;color: gray;">내용 :</span> <br><br>
<input type="text" name="content"  value="${myqna.qa_content }" style="border: none;font-size: 20px;font-weight: bold;color: #424242;">

<br><br><br><br>

<hr style="color: gray;">

<p>
<span><img alt="" src="../finances-master/images/admin.jpg" class="admin"><span style="font-weight: bold;color: gray;">관리자 &nbsp; </span> <span style="color: gray;font-size: 12px;"><img src="../finances-master/images/time1.png" class="time"> ${myqna.qa_date }</span> 
<br><br><span style="margin-left: 40px;font-size: 14px; ">${myqna.qa_answer}</span></span>
</p>

<br><br>
<div class="sendbtnDiv">
	<input type="button"   class="btnList" value="목록"> 
	<input type="submit" id="updateBtn" value="수정">
	<input type="button" class="deleteBtn" data-qaid="${myqna.qa_id}" value="삭제">
</div>


</form>

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