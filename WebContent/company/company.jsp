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
<title>회사소개</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회사소개</title>

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
   .tit {position: relative; margin-top: -380px; text-align: center; line-height: 40vh; color:#fff;
 	  font-size:80px; text-shadow: 1px 1px 10px #e1e1e1;}
    .lb { display:block;  font-size:36px !important; text-align: center; margin-bottom: 25px;
   	 background: url('<%=path %>/images/tit_h2.png') no-repeat center bottom; padding-bottom: 20px;}
  	.lb_content {text-align: center; font-size: 18px; color: #666; padding: 0 20%; margin-bottom: 50px;}
  	.pcl { color: #dc2c34; }
  	
  	.dl_img {width:1164px; height: 300px; margin-bottom: 50px; margin-left: 56px;}
  	.dl4_img {width:1000px; height: 750px; margin-bottom: 50px; margin-left: 170px;}
  	.dl5_img {width:1164px; height: 200px; margin-bottom: 50px; margin-left: 56px;}
  	.dl6_img {width:1164px; height: 450px; margin-bottom: 50px; margin-left: 56px;}
  	
  	.row job mt30 {float: left;}
  	
  	.maplist {width:1164px; height: 700px; margin-bottom: 50px; margin-left: 56px;}
  	
  	.center2 { margin-left: 650px; margin-top: -460px; }
  	.center3 {margin-top: 50px;}
  	.center4 { margin-left: 650px; margin-top: -425px; }
  	.center5 {margin-top: 100px; margin-bottom: 50px;}
  	.center6 { margin-left: 650px; margin-top: -450px; margin-bottom: 50px;}
	
	table { display:table; width:1000px; margin:10px auto; 
	border-bottom:1px solid #333; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; border-top:1px solid #333;
	text-align:center; line-height:36px; }
	th { background-color:#333; color:#fff; }
    .table { width:1000px; margin:4px auto; padding-top:20px;  }
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
        
    .page_tit { text-align:center; font-size:50px; padding-top:40px; padding-bottom: 50px; font-weight: 600;}
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
                    <img src="<%=path %>/images/visual_01.jpg" alt="회사소개 이미지">
            		<h1 class="tit">회사소개</h1>
                </div>
            </figure>
            <section class="page" id="page1">
                <h2 class="page_tit">(주)오뚜기</h2>
                <article class="grid3" style="margin:10px auto;">
                <div>
	                <h2 class="lb">최고의 맛을 향한 열정</h2>
	                <p class="lb_content">
	                	오뚜기 전 임직원들은 '보다 좋은 품질, 보다 높은 영양, 보다 앞선 식품'으로 인류 식생활 향상에 이바지하기 위해 맡은 바 업무에 최선을 다하고 있습니다.
	                	<br>
						영업, 생산, 연구, 관리 등 모든 부서에서 스스로에게 주어진 업무를 빈틈없이 처리하고 있는 것은 물론 밝고 명랑한 직장 분위기를 만들기 위해 노력하고 있습니다.
	                	<br>
						이러한 오뚜기의 노력들이 바로 최고 품질, 최고의 맛으로 승화되는 것입니다.
					</p>
					<img src="<%=path %>/images/dl1.png" class="dl_img">
				</div>	
                <div>				
	                <h2 class="lb">맛있는 식품은 신선한 원료에서</h2>
	                <p class="lb_content">
	                	신선한 육류와 야채를 사용한 <strong class="pcl">'오뚜기 3분 요리'</strong>는 바쁜 현대인들에게 충분한 영양을 공급합니다.<br>
						정선된 원료로 만든  <strong class="pcl">'오뚜기 마요네스'와 '드레싱'</strong>은 신선한 야채를 다양하게 즐길 수 있도록 해줍니다.<br>
						갖가지 향신료로 만든  <strong class="pcl">'오뚜기 카레'</strong>는 더욱 부드럽고 향긋한 카레 특유의 풍미를 느낄 수 있습니다.<br>
						과육의 원형이 살아있는  <strong class="pcl">'오뚜기 프리저브형 쨈'</strong>은 딸기, 포도, 블루베리 등의 신선한 과실로 만듭니다.<br>
						엄선된 쌀을 깨끗하게 씻어 포장한  <strong class="pcl">'씻어나온 맛있는 오뚜기쌀'</strong>은 더 씻을 필요 없이 물만 부어 한번에 밥을 지을 수 있기 때문에 매우 간편합니다.<br>
						 <strong class="pcl">'맛있는 오뚜기밥'</strong>은 갓 지은 맛있는 밥을 무균 포장한 제품으로 간편한 식생활을 추구하는 현대인들에게 필수적인 제품입니다.<br>
					</p>
				</div>
				<div>
	                <h2 class="lb">우수한 품질은 좋은 시설에서</h2>
	                <p class="lb_content">
						우리 회사는 카레, 스프, 케챂, 마요네스 등 1등 제품이 많습니다.<br>
						이처럼 많은 제품들이 오랫동안 정상을 지켜온 비결은 고객들의 욕구를 충실히 반영한 좋은 품질의 제품을 공급해왔기 때문입니다.<br>
						우리 회사의 모든 생산라인은 자동화된 첨단설비, 위생적인 환경을 구축하고 있습니다.<br>
						이것이 바로 오뚜기의 저력이고 1등 제품의 힘입니다. 그리고 발전하는 21세기 오뚜기의 비전입니다.<br>
						이런 오뚜기의 노력이 최고 품질, 최고의 맛으로 승화되는 것입니다.<br>
					</p>
					<img src="<%=path %>/images/dl2.png" class="dl_img">
				</div>				
	            </article>
			</section>
            <section class="page" id="page2">
                <h2 class="page_tit">인재 채용</h2>
                <article class="grid3" style="margin:10px auto;">
                	<div>
		                <h2 class="lb">인재 육성</h2>
		                <p class="lb_content">
					                오뚜기의 인재육성 전략은 개인의 지속적인 성장과 발전에 기여하고,<br>
							나아가 식문화 발전에 공헌하는 조직 구성원으로 거듭나게 합니다.
						</p>
						<img src="<%=path %>/images/dl4.png" class="dl4_img">
               		 </div>
                	<div>
		                <h2 class="lb">직급 및 호칭체계</h2>
						<img src="<%=path %>/images/dl5.png" class="dl5_img">
               		 </div>
                	<div>
		                <h2 class="lb">복리후생</h2>
						<img src="<%=path %>/images/dl6.png" class="dl6_img">
               		 </div>
	                	
	            </article>
			</section>
            <section class="page" id="page3">
                <h2 class="page_tit">사업장 소개</h2>
				<article class="grid3" style="width:1280px; margin:10px auto;">
				    <div>
		                <h2 class="lb">국내 사업장 현황</h2>
					</div>
					<div class="row job mt30">
						<div class="center">
							<p><img src="<%=path %>/images/img_domestic1.jpg" alt="오뚜기 센터"></p>
							<dl>
								<dt>오뚜기 센터</dt>
								<dd>(06177) 서울특별시 강남구 영동대로 308</dd>
								<dd class="mt40">(주)오뚜기의 전사를 총괄하는 미래전략의 구심점 역할 (2010년 3월 입주)<br></dd>
								<br><br><br><br><br><br><br>
							</dl>
						</div>
						<div class="center2">
							<p><img src="<%=path %>/images/img_domestic2.jpg" alt="오뚜기 중앙연구소"></p>
							<dl>
								<dt>오뚜기 중앙연구소</dt>
								<dd>(14060) 경기도 안양시 동안구 흥안대로 395번길 49(평촌동)</dd>
								<dd class="mt40">최신의 실험 장비들과 다양한 분야의 전문서적을 구비하여 최적의 연구환경을 조성하였습니다. 특히 국제시험기관이전제도인 KOLAS*를 취득하여 공인시험 및 검사기관으로서 국제적인 공신력을 가지고 있습니다. 약 1500평의 부지에 기존 연구소를 새로 증축 및 리모델링하여 2020년 5월 입주 하였으며, 맛과 품질이 우수한 신제품 개발 및 인류 식생활 향상을 위한 연구에 매진하고 있습니다.<br>
								* KOLAS(Korea Laboratory Accreditation Scheme): 국가적 권위를 인정받은 인정기구가 발급한 시험성적서가 국제적으로 공신력을 갖추고 있음을 인정해주는 제도</dd>
							</dl>
						</div>
				</div>
				<div class="row job mt30">
					<div class="center3">
						<p><img src="<%=path %>/images/img_domestic3.jpg" alt="대풍 공장"></p>
						<dl>
							<dt>대풍 공장</dt>
							<dd>(27670) 충청북도 음성군 대소면 대풍산단로 128</dd>
							<dd class="mt40">HACCP 인증, 효율적인 물류 시스템, 최신 전산화 시스템 등을 갖춘 첨단 미래형 공장입니다.<br>
							2001년 8월 30일 부지 10만 4,000여㎡에 건축면적 2만 6868㎡ 규모로 준공하여 <br>
							현재 케챂, 마요네스, 3분류, 쌀, 밥 등을 생산하고 있습니다.<br> 
							위생수준별 Zone을 일반구역 청색, 준청정구역 적색, 청정구역 녹색으로 <br>
							구분하여 관리하는 것뿐만 아니라 창문이 없는 밀폐형 공장을 비롯하여 <br>
							창문, 벽 등의 경사와 턱을 없애 먼지가 쌓이지 않도록 건설하여 운영하고 있습니다.</dd>
						</dl>
					</div>
					<div class="center4">
						<p><img src="<%=path %>/images/img_domestic4.jpg" alt="안양 공장"></p>
						<dl>
							<dt>안양 공장</dt>
							<dd>(14060) 경기도 안양시 동안구 흥안대로 405 (평촌동 160)</dd>
							<dd class="mt40">유지, 쨈, 소스, 레토르트 식품 등 최고의 품질로 1등 제품의 신화를 이어가는 생산의 중심입니다. 1972년 6월 경기도 안양시 동안구 평촌동 160번지에 카레 공장이 준공된 이래 수 차례의 증설을 거쳐 오늘에 이르렀습니다. <br>
오뚜기 역사의 시작과 함께한 가장 오래된 최고의 생산기지로, 약 500여 종의 제품을 생산하고 있습니다. 
</dd>
						</dl>
					</div>
				</div>
				<div class="row job mt30">
					<div class="center5">
						<p><img src="<%=path %>/images/img_domestic5.jpg" alt="삼남 공장"></p>
						<dl>
							<dt>삼남 공장</dt>
							<dd>(44953) 울산광역시 울주군 삼남면 반구대로 149</dd>
							<dd class="mt40">케챂, 마요네스, 식초, 물엿 등을 생산하며, 영남권의 물류 거점이자 수출제품 생산기지입니다.<br>
							 1992년 7월 대지 1만 9,647㎡에 건평 1만 3,630㎡ 규모의 4층 건물로 건립되었습니다.<br>
							  생산 효율성을 극대화할 수 있는 최신 생산 설비를 갖추고 안양공장에서 생산하고 있는 <br>
							  주요 제품을 분산해 생산하며 세계시장 속 글로벌 품질 경쟁력을 키우고 있습니다. </dd>
						</dl>
					</div>

					<div class="center6">
						<p><img src="<%=path %>/images/img_domestic6.jpg" alt="포승 공장"></p>
						<dl>
							<dt>포승 공장</dt>
							<dd>(17958) 경기 평택시 포승읍 포승공단로 2</dd>
							<dd class="mt40">서해안 시대의 오뚜기 거점 공장으로서, 세계로 진출하기 위한 최첨단 설비로 갖춰진 유지 제품 전문 생산 공장입니다. 2019년 12월에 준공하여 팜유, 대두유를 비롯하여 식용유 등을 생산하고 있습니다. </dd>
						</dl>
					</div>
				</div>
				</article>
			</section>
            <section class="page" id="page4">
                <h2 class="page_tit">찾아오시는 길</h2>
				<article class="grid3" style="width:1280px; margin:10px auto;">
	                <h2 class="lb">오뚜기 위치 리스트</h2>
	                <img src="<%=path %>/images/maplist.png" alt="위치 리스트" class="maplist">
				</article>
			</section>
		</div>
        <%@ include file="../footer.jsp" %>
	</div>
</body>
</html>