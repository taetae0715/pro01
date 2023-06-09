<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
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
   <title>관리자 페이지</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지</title>

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
    <mata name="og:url" content="https://taetae0715.github.io/web1">
    <mata name="og:image" content="./images/img_visual50.jpg">  

    <!-- 스타일 초기화 reset.css나 normalize.css --> 
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">  
    <link rel="stylesheet" href="<%=path %>/common.css">
    <link rel="stylesheet" href="<%=path %>/sub_common.css">
    <link rel="stylesheet" href="<%=path %>/sublayout.css">
    <script src="<%=path %>/jquery-1.10.1.min.js"></script>
    <script src="<%=path %>/datatables.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/datatables.min.css">
    <!-- 기본 폰트 및 초기화 로딩 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Brush+Script&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Sono&display=swap" rel="stylesheet">
    <style>
    /* 내부 스타일 */
    .ad_img_box { height:300px; margin-top: -450px; margin-bottom: 480px;}
   	.tit {position: relative; margin-top: -350px; margin-left:70px; text-align: left; line-height: 40vh; color:#fff;
 	  font-size:80px; text-shadow: 1px 1px 10px #e1e1e1;}
 	.page { height: auto; }  
 	  
    .lb { display:block;  font-size:36px !important; text-align: center; margin-bottom: 25px;
   	 background: url('<%=path %>/images/tit_h2.png') no-repeat center bottom; padding-bottom: 20px;}
  	.lb_content {text-align: center; font-size: 18px; color: #666; padding: 0 20%; margin-bottom: 50px;}
  	.pcl { color: #dc2c34; }
  	
    .table { width:800px; margin:4px auto; padding-left:20px; border-top:2px solid #333; }
    th {  text-align: justify;  line-height: 0; width:220px; padding-top:10px; padding-bottom: 10px;}
    td { padding-top:10px; padding-bottom: 10px; }
    th:after {  content: "";  display: inline-block;  width: 100%; }
    th:before {  content: "";  display: inline-block;  width: 100%; }
    .lb { display:block;  font-size:20px; margin-left: 100px; }
    .indata { display:inline-block; width:250px; height:15px; line-height:15px; margin-left: 60px; padding:10px; }
    .btn { display:inline-block; outline:none; border:none; border-radius:8px; margin:16px;
         text-align: center; padding:10px 20px;  cursor:pointer; }
    .btn-primary { background: -moz-linear-gradient(top, #00b7ea 0%, #009ec3 100%); 
        background: -webkit-linear-gradient(top, #00b7ea 0%,#009ec3 100%); 
        background: linear-gradient(to bottom, #00b7ea 0%,#009ec3 100%); color:#fff; }
    .btn-cancle { background: -moz-linear-gradient(top, #a90329 0%, #8f0222 44%, #6d0019 100%); 
        background: -webkit-linear-gradient(top, #a90329 0%,#8f0222 44%,#6d0019 100%); 
        background: linear-gradient(to bottom, #a90329 0%,#8f0222 44%,#6d0019 100%);
        color:#fff; }
    .page_tit { text-align:center; font-size:32px; padding-top:50px; padding-bottom:30px; }
    .detail { display:block; text-align:center; max-width:120px; min-width:90px; padding:10px; font-size:24px; background-color: darkorange;
   	color:#fff; border-radius:15px; margin:20px auto; }
   	
   	.table.dataTable thead>tr>th { text-align:center; }
   	.gnb:hover > ul > li:before { visibility:hidden;}
   	
   	.page_tit { text-align:center; font-size:32px; padding-top:60px; padding-bottom:16px; }
    </style>
</head>
<body>
    <div class="container">
		<%@ include file="./admin_header.jsp" %>  
        <div class="content">
            <figure class="vvs">
                <div class="ad_img_box">
                    <img src="<%=path %>/images/join.png" alt="관리자 이미지">
               		<h1 class="tit">ADMIN PAGE</h1>
                </div>
              </figure>
            <section class="page" id="page1">
                <h2 class="page_tit">회원 등록 현황</h2>
                <article class="grid3" style="margin:10px auto;">

	                <a href="member_manage.jsp" class="detail">바로가기</a>
	            </article>
			</section>
            <section class="page" id="page2">
                <h2 class="page_tit">게시판 현황</h2>
                <article class="grid3" style="margin:10px auto;">
	               
	                <a href="board_manage.jsp" class="detail">바로가기</a>
	            </article>
			</section>
            <section class="page" id="page3">
                <h2 class="page_tit">제품정보 현황</h2>
				<article class="grid3" style="width:1280px; margin:0 auto;">

					<a href="#" class="detail">더 보기</a>
				</article>
			</section>
            <section class="page" id="page4">
                <h2 class="page_tit">홍보센터 현황</h2>
				<article class="grid3" style="width:1280px; margin:0 auto;">

					<a href="#" class="detail">더 보기</a>
				</article>
			</section>
            <section class="page" id="page5">
                <h2 class="page_tit">고객서비스 현황</h2>
				<article class="grid3" style="width:1280px; margin:0 auto;">

					<a href="#" class="detail">더 보기</a>
				</article>
			</section>
		</div>
        <%@ include file="../footer.jsp" %>
	</div>
</body>
</html>