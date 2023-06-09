<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
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
<meta charset="utf-8">
<title>제품소개</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>제품소개</title>

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
    .page {height: auto;}
   .vs, .img_box { height:50vh; margin-top: -45px; }
   .tit {position: relative; margin-top: -430px; text-align: center; line-height: 40vh; color:#fff;
 	  font-size:80px; text-shadow: 1px 1px 10px #e1e1e1;}
    .lb { display:block;  font-size:24px;text-align: center; margin-bottom: 25px; color: #666;
   	 background: url('<%=path %>/images/tit_h2.png') no-repeat center bottom; padding-bottom: 20px;}
  	.lb_content {text-align: center; font-size: 18px; color: #666; padding: 0 20%; margin-bottom: 50px;}
  	.pcl { color: #dc2c34; }
  	
  	.prolist { width: 1280px; margin-bottom: 30px;}
  	
	table { display:table; width:1000px; margin:10px auto; 
	border-bottom:1px solid #333; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; border-top:1px solid #333;
	text-align:center; line-height:36px; }
	th { background-color:#333; color:#fff; }
    .table { width:1000px; margin:4px auto; padding-top:20px;  }
    .lb { display:block;  font-size:20px; }
    .indata { display:inline-block; width:300px; height:24px; line-height:24px; padding:10px; }
    .btn { display:inline-block; outline:none; border:none; border-radius:8px;
         text-align: center; padding:10px 20px;  cursor:pointer; }
    .btn-primary { background: -moz-linear-gradient(top, #00b7ea 0%, #009ec3 100%); 
        background: -webkit-linear-gradient(top, #00b7ea 0%,#009ec3 100%); 
        background: linear-gradient(to bottom, #00b7ea 0%,#009ec3 100%); color:#fff; }
    .btn-cancle { background: -moz-linear-gradient(top, #a90329 0%, #8f0222 44%, #6d0019 100%); 
        background: -webkit-linear-gradient(top, #a90329 0%,#8f0222 44%,#6d0019 100%); 
        background: linear-gradient(to bottom, #a90329 0%,#8f0222 44%,#6d0019 100%);
        color:#fff;}
    .page_tit { text-align:center; font-size:50px; padding-top:60px; padding-bottom: 10px; font-weight: 600;}
    .tb_wrap { clear:both; width:900px; margin:10px auto; border-top:2px solid #333; padding-top:15px; }
   	.detail { display:block; text-align:center; max-width:120px; min-width:90px; padding:12px; font-size:24px; background-color: rgba(7, 93, 70, 0.9);
   	color:#fff; border-radius:30px; margin:42px auto; }
	</style>
</head>
<body>
    <div class="container">
		<%@ include file="../header.jsp" %>  
        <div class="content">
            <figure class="vs">
                <div class="img_box">
                    <img src="../images/visual_02.jpg" alt="제품정보 이미지">
                </div>
            </figure>
            <h1 class="tit">제품정보</h1>
            <section class="page" id="page1">
                <h2 class="page_tit">신제품소개</h2>
                <article class="grid3" style="margin:10px auto;">
                <h3 class="lb">오뚜기에서 새롭게 선보이는 신제품을 소개해 드립니다</h3>
                <img src="<%=path %>/images/proins1.png" alt="신제품리스트" class="prolist">
	            </article>
			</section>
            <section class="page" id="page2">
                <h2 class="page_tit">제품소개</h2>
                <article class="grid3" style="margin:10px auto;">
                <h3 class="lb">아래 분류 기능을 이용하여 편리하게 제품을 검색하세요</h3>
                <img src="<%=path %>/images/proins2.png" alt="신제품리스트" class="prolist">
	            </article>
			</section>
		</div>
        <%@ include file="../footer.jsp" %>
	</div>
</body>
</html>