<%@page import="semi.dao.SmartDao"%>
<%@page import="semi.dto.SmartDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Gothic&family=Poor+Story&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
   table tr th{
      font-family: 'Nanum Gothic';
      font-size: 15px;
      text-align: center;
   }
   
   div.boardf, div.boardt, div.boardb{
      display: inline-block;
   }
   
   div button{
      border: 1px solid black;
      width: 35px;
      height: 40px;
      background-color: white;
      line-height: 15px;
      
   }
   
   /*table caption{
      font-size: 22px;
      color: black;
      margin-left: 390px;
   }*/
   
   div button.boardbtn:hover{
      background: black;
      color: white;
   }
   
   div.page_wrap ul.pagination   li a{
      padding: 4px;
      margin-right: 3px;
      width: 30px;
      height: 30px;
      color: #000;
      font: 12px;
      border: 1px solid gray;
      text-align: center;
      text-decoration: none;
      line-height: 20px;
      background-color: white;
   }
   
   div.page_wrap ul.pagination   li a:hover, div.page_wrap ul.pagination   li a:focus{
      color:   #fff;
      border: 1px solid black;
      background-color: black;
   }
   
   #mytable td:hover{
      font-size: 13pt;
      font-weight: bold;
      text-decoration: none;
   }
</style>
</head>
<%

   //로그인 상태 확인후 입력폼 나타내기
   String loginok=(String)session.getAttribute("loginok");


   SmartDao dao=new SmartDao();
   //페이징 처리에 필요한 변수선언
   int perPage=10;//한페이지에 보여질 글의 갯수
   int totalCount; //총 글의 수
   int currentPage;//현재 페이지번호
   int totalPage;//총 페이지수
   int start;//각페이지에서 불러올 db 의 시작번호
   int perBlock=10;//몇개의 페이지번호씩 표현할것인가
   int startPage; //각 블럭에 표시할 시작페이지
   int endPage; //각 블럭에 표시할 마지막페이지
   
   //총 갯수
   totalCount=dao.getTotalCount();
   //현재 페이지번호 읽기(단 null 일경우는 1페이지로 설정)
   if(request.getParameter("currentPage")==null)
      currentPage=1; 
   else
      currentPage=Integer.parseInt(request.getParameter("currentPage"));
   
   //총 페이지 갯수 구하기
   totalPage=totalCount/perPage+(totalCount%perPage==0?0:1); 
   //각 블럭의 시작페이지
   startPage=(currentPage-1)/perBlock*perBlock+1;
   endPage=startPage+perBlock-1;
   if(endPage>totalPage)
      endPage=totalPage;
   //각 페이지에서 불러올 시작번호
   start=(currentPage-1)*perPage;
   //각페이지에서 필요한 게시글 가져오기
   List<SmartDto> list=dao.getList(start, perPage);  
   
   //현재페이지의 list가 더이상 없을경우 이전페이지로 이동한다
   if(list.size()==0 && totalCount>0)
   {%>
      <script type="text/javascript">
         location.href="index.jsp?main=board/boardlist.jsp?currentPage=<%=currentPage-1%>";      
      </script>
   <%}
   
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
   //각페이지에 출력할 시작번호
   int no=totalCount-(currentPage-1)*perPage;
%>
<body>

<!--/////// 게시판 출력 //////-->
<h3 align="center" style="padding-top: 40px;">Q & A</h3>
<table class="tab table table-striped" style="width: 900px;margin-left: 350px;margin-top: 40px;">
   <tr align="center">
      <th width="70">NO.</th>
      <th width="350">TOTLE</th>
      <th width="100">POSTED BY</th>
      <th width="150">DATE</th>
   </tr>
   <tbody id="mytable">      
   <%
   if(totalCount==0)
   {%>
      <tr height="40">
         <td colspan="5" align="center">
            <b>등록된 게시글이 없습니다</b>
         </td>   
      </tr>
   <%}else{
      for(SmartDto dto:list)
      {%>
         <tr>
            <td align="center"><%=no--%></td>
            <td>
               <a style="color: black;" 
               href="index.jsp?main=board/detail.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>&key=list">
               <%=dto.getSubject()%>
               </a>
            </td>
            <td align="center"><%=dto.getWriter()%></td>
            <td align="center"><%=sdf.format(dto.getWriteday())%></td>
         </tr>
   <%}
   }
   %>
   </tbody>
</table>

<!--///// board하단 선택, 검색, 버튼 /////-->
<div class="boardf">
   <select id="filterser" style="margin-left: 350px;height: 30px;" >
      <option value="">전체</option>
      <option value="">제목</option>
      <option value="">작성자</option>
   </select>
</div>
<div class="boardt">
   <input type="text" class="form-control" id="myinput" placeholder="Search.." style="width: 150px;height: 30px;">
</div>

<div class="boardb">
   <button type="button" class="boardbtn" style="width: 100px;margin-left: 580px;"
    onclick="location.href='index.jsp?main=board/smartform.jsp'">WRITE</button>
</div>

<!--/////// 페이징 ////// -->
<div style="width: 900px;text-align: center;margin-left: 350px;" class="page_wrap">
   <ul class="pagination">
   <%
   //이전
   if(startPage>1)
   {%>
      <li>
         <a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage-1%>">이전</a>
      </li>
   <%}
     
   for(int pp=startPage;pp<=endPage;pp++)
   {
      if(pp==currentPage)//현재페이지일때 active
      {%>
         <li class="active">
         <a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
         </li>
      <%}else{%>
         <li>
         <a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a>
         </li>
      <%}
   }
   
   //다음
   if(endPage<totalPage)
   {%>
      <li>
         <a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage+1%>">다음</a>
      </li>
   <%}
   %>  
   </ul>
</div>

<script type="text/javascript">
$(document).ready(function(){
     $("div.boardt #myinput").on("keyup", function() {
       var value = $(this).val();
       $("table.tab tbody#mytable tr").filter(function() {
         $(this).toggle($(this).text().indexOf(value) > -1)
       });
     });
   });
</script>
</body>
</html>