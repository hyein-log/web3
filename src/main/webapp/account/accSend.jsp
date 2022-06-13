<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.sendForm{
    width: 30%;
    margin: auto;
    font-family: "Open Sans";
    padding: 3%;
    margin-top: 10%;
    margin-bottom: 10%;
}

.form-accSend {
    width: 100%;
    height: 30px;
    display: block;
    border-radius: 30px;
    border: 1px solid #ced4da;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #495057;
    background-color: #fff;
}

.form-accSend:active, .form-accSend:focus {
    outline: 1px solid #007bff;
}
.sendDiv {
    margin-bottom: 30px;
}

.sendbtnDiv{
    text-align: center;
}
label{
    color:#000;
    margin-bottom: 0.5rem;
    font-size: 16px;
}
.btnSubmit {
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
}
</style>
</head>

<jsp:include page="../finances_master/header/header.jsp"></jsp:include>


<form action="#" class="sendForm">
        <div class="sendDiv align">
            <label class="accNum">이체할 대상을 입력하세요</label>
            <input type="text" class="form-accSend">
        </div>
        <div class="sendDiv align">
            <label class="accNum">이체할 계좌번호를 입력하세요</label>
            <input type="text" class="form-accSend">
        </div>
        <div class="sendDiv align">
            <label class="accMoney">이체할 금액을 입력하세요</label>
            <input type="number" class="form-accSend">
        </div>
        <div class="sendDiv align">
            <label class="accPass">계좌 비밀번호를 입력하세요</label>
            <input type="password" class="form-accSend">
        </div>
        <div class="sendbtnDiv">
            <button type="submit" class="btnSubmit">이체하기</button>
        </div>
    </form>
 
 

<jsp:include page="../finances_master/footer/footer.jsp"></jsp:include>

  



</body>
</html>
