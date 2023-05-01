<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String pid = "";
	if(session.getAttribute("id")!=null){
		pid = (String) session.getAttribute("id");
	}
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 - 글쓰기</title>

    <meta name="subject" content="오뚜기 벤치마킹 사이트">
    <meta name="keywords" content="오뚜기, 오뚝이, 진라면, 짜슐랭, 스파게티, 스파게티소스  ">
    <meta name="description" content="오뚜기 인기상품. 오뚜기의 인기상품들을 소개 합니다. 프레스코 미트 스파게티소스 조미소스/식품스파게티소스. 프레스코 미트 스파게티소스.">
    <meta name="author" content="ms. jo">

    <!-- 파비콘(favicon) 설정 -->
    <link rel="shortcut icon" href="<%=path %>/images/favicon.ico">

    <!-- https://taetae0715.github.io/web1 -->
    <!-- 오픈그래프 설정 -->
    <meta name="og:site_name" content="오뚜기">
    <meta name="og:title" content="포트폴리오 - 오뚜기">
    <meta name="og:description" content="오뚜기 인기상품. 오뚜기의 인기상품들을 소개 합니다. 프레스코 미트 스파게티소스 조미소스/식품스파게티소스. 프레스코 미트 스파게티소스.">
    <meta name="og:url" content="https://taetae0715.github.io/web1">
    <meta name="og:image" content="<%=path %>/images/img_visual50.jpg">  

    <!-- 스타일 초기화 reset.css나 normalize.css --> 
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">  
    <link rel="stylesheet" href="<%=path %>/common.css">
    <link rel="stylesheet" href="<%=path %>/main.css">
    <!-- 기본 폰트 및 초기화 로딩 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Brush+Script&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Sono&display=swap" rel="stylesheet">
    <style>
    /* 내부 스타일 */
   .vs, .img_box { height:50vh; margin-top: -275px; }
    #page1 .page_tit { padding-top: 50px; }
    #page1 {height:auto;}
    .table { width:900px; margin:4px auto; padding-left:20px; border-top:2px solid #333; }
    th {  text-align: justify;  line-height: 0; width:220px; padding-top:10px; padding-bottom: 10px;}
    td { padding-top:10px; padding-bottom: 10px; }
    th:after {  content: "";  display: inline-block;  width: 100%; }
    th:before {  content: "";  display: inline-block;  width: 100%; }
    .lb { display:block;  font-size:20px; }
    .indata { display:inline-block; width:700px; height:15px; line-height:15px; padding:10px; }
    .btn { display:inline-block; outline:none; border:none; border-radius:8px; margin:16px;
         text-align: center; padding:10px 20px;  cursor:pointer; }
    .btn-primary { background: -moz-linear-gradient(top, #00b7ea 0%, #009ec3 100%); 
        background: -webkit-linear-gradient(top, #00b7ea 0%,#009ec3 100%); 
        background: linear-gradient(to bottom, #00b7ea 0%,#009ec3 100%); color:#fff; }
    .btn-cancle { background: -moz-linear-gradient(top, #a90329 0%, #8f0222 44%, #6d0019 100%); 
        background: -webkit-linear-gradient(top, #a90329 0%,#8f0222 44%,#6d0019 100%); 
        background: linear-gradient(to bottom, #a90329 0%,#8f0222 44%,#6d0019 100%);
        color:#fff; }
    .page_tit { text-align:center; font-size:32px; }
    </style>
</head>
<body>
    <div class="container">
		<%@ include file="../header.jsp" %>  
        <div class="content">
            <figure class="vs">
                <div class="img_box">
                    <img src="../images/mbg.jpg" alt="회원가입 이미지">
                </div>
            </figure>
            <section class="page" id="page1">
                <h2 class="page_tit">공지사항 글쓰기</h2>
                <div class="page_wrap">
                    <form name="boardIns" action="boardIns_pro.jsp" method="post" id="boardIns">
                        <table class="table" id="tb1">
                            <tbody>
								<tr>
									<th><label for="title" class="lb">제목</label></th>
									<td><input type="text" name="title" id="title" class="indata" required autofocus></td>
								</tr>
								<tr>
									<th><label for="content" class="lb">내용</label></th>
									<td>
										<textarea rows="20" cols="100" name="content" id="content" class="indata"></textarea>
										<input type="hidden" name="id" value="<%=pid %>">
									</td>
								</tr>
                                <tr>
                                    <td colspan="2" style="text-align: center;">
                                        <input type="submit" value="등록" class="btn btn-primary"> &nbsp; &nbsp; &nbsp; &nbsp;
                                        <input type="reset" value="취소" class="btn btn-cancle">
									</td>
								</tr>
							</tbody>
						</table>
                    </form>
                </div>
            </section>
        </div>
        <%@ include file="../footer.jsp" %>
    </div>
</body>
</html>