<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	
<form action="myqnaUpdate.do" method="post">
글번호 : ${myqna.qa_id} 
<input type="hidden" name="qaid" id="qaid" value="${myqna.qa_id}"><br>
제목 : ${myqna.qa_title}
 <span style="margin-left: 30px;">질문일 : ${myqna.qa_date}</span>
<br>
내용 : ${myqna.qa_content}
<br>


<input type="button"   class="btnList" value="목록"> 
<input type="button" class="deleteBtn" data-qaid="${myqna.qa_id}" value="삭제"><br>
<hr>


<span name="user_detail" id="user_detail">답변 : ${myqna.qa_answer }</span>
<span name="admin_detail" id="admin_detail">
	답변하기 : <input type="text" name="qna_answer" id="qna_answer">
	<input type="button" id="answer_btn" value="답변하기">
</span>
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

</html>