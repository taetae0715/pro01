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
<title>ESG경영</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ESG경영</title>

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
   .tit {position: relative; margin-top: -350px; text-align: center; line-height: 40vh; color:#fff;
 	  font-size:80px; text-shadow: 1px 1px 10px #e1e1e1;}
    .lb { display:block;  font-size:36px !important; text-align: center; margin-bottom: 25px; margin-top: 25px;
   	 background: url('<%=path %>/images/tit_h2.png') no-repeat center bottom; padding-bottom: 20px;}
  	.lb_content {text-align: center; font-size: 18px; color: #666; padding: 0 20%; margin-bottom: 50px;}
  	.pcl { color: #dc2c34; font-size: 28px; text-align: center; margin-bottom: 20px; }
  	
  	.rody { position: relative; margin-left: 650px; margin-top: -450px; margin-bottom: 130px;}
  	.rody2 { position: relative; margin-right: 650px; margin-top: -400px; margin-bottom: 130px;}
  	.img {margin-bottom: 200px; }
  	.img2 {margin-bottom: 200px; margin-left: 650px; margin-top: 200px;}
  	.img3 {margin-top: 200px; margin-bottom: 50px; }
  	.imgpro {margin-left: 70px;}
  	
  	.env { position: relative; margin-right: 650px;  margin-bottom: 50px;}
  	.env2 { position: relative; margin-left: 700px;  margin-top: -200px; margin-bottom: 50px;}
  	.env3 { position: relative; margin-left: 700px;  margin-top: -225px; margin-bottom: 50px;}
  	.imgev2 { position: relative; margin-left: 700px;  margin-top: -270px; margin-bottom: 50px;}
  	
  	.btmBrn06{background:#5e4d44 url('<%=path %>/images/bg_bottomBrn6.jpg') no-repeat center 0; min-height:520px; height:auto; background-size:cover; padding-top:75px; padding-bottom:40px; width: 1900px; margin-left: -300px;}
	.btmBrn06 dl {text-align:left; padding: 0 0 0 35px; width: 100%; margin-left: 940px;}
	.btmBrn06 dt {font-size:36px; color:#fff; padding-bottom:30px;}
	.btmBrn06 dd {font-size:18px; color:#fff; line-height:1.8; padding-left:25px; position:relative; display:block;}
	.btmBrn06 dd span {width:20px; position:absolute; left:0; }
	.btmBrn06 dd span.h {height:26px;}
	
	.lp {text-align: center; line-height: 1.4; font-size:18px;}
	.esgpg4 {width:1000px; height:400px; margin-left: 100px; margin-bottom: 60px;}
	
	.h3tit {font-size:20px; font-weight: 700; margin-top: 50px; margin-bottom:10px; color: #333; line-height: 1.1;}
	.pg4row { line-height: 1.5; }
  	
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
                    <img src="../images/visual_08.jpg" alt="esg 경영 이미지">
                </div>
            </figure>
            <h1 class="tit">ESG경영</h1>
            <section class="page" id="page1">
                <h2 class="page_tit">ESG경영소개</h2>
                <h2 class="lb"></h2>
                <article class="grid3" style="margin:10px auto;">
	                <div class="row system1 fix mt50">
						<div class="col s12 m6"><p class="img"><img src="<%=path %>/images/img_esg1.jpg" alt=""></p></div>
						<div class="col s12 m6">
							<dl class="rody">
								<dt class="pcl">개요</dt>
								<dd style="word-break:keep-all;">오뚜기의 지속가능경영은 지속적으로 사회와 소통하여, 다양한 이해관계자들이 원하는 가치를 창출하는 것입니다.<br>
								더 나아가 ‘인류 식생활 향상에 기여하여 행복한 세상을 만든다’는 사명을 바탕으로, 건강한 식문화를 함께하는 글로벌 오뚜기가 되기 위해 사업을 추진해 나가고 있습니다.</dd>
							</dl>
						</div>
					</div>
				<div class="row system1 fix">
					<div class="col s12 m6 mt40">
					<div class="col s12 m6 mt40"><p class="img2"><img src="<%=path %>/images/img_esg2.jpg" alt=""></p></div>
						<dl class="rody2">
							<dt class="pcl">비전</dt>
							<dd style="word-break:keep-all;">오뚜기는 지속가능경영을 통해 사회적 가치를 실현하고 있습니다.<br>
							‘머리 쓰고, 땀 흘리자’라는 오뚜기 창립정신을 되새기며, 앞으로도 50년, <br>100년 이상 지속성장할 수 있도록 미래를 설계하고 프로세스를 구축해 나가고 있습니다.<br>
							오뚜기의 지속가능경영 목표는 조직의 안정된 경영과 성장을 바탕으로 고객만족과 사회공헌을 실천하고, 더 나아가 인류 공동의 발전에 기여하는 것입니다. </dd>
							<dd></dd>
						</dl>
					</div>
				</div>	
				<div class="col s12 m6 mt40"><p class="img3"><img src="<%=path %>/images/img_esg3.jpg" alt=""></p></div>
	            </article>
			</section>
			
            <section class="page" id="page2">
                <h2 class="page_tit">환경</h2>
                <article class="grid3" style="margin:10px auto;">
                	<h2 class="lb">선포 및 실천방침</h2>
                	<div class="row system1 fix mt50">
						<div class="env">
							<dl>
								<dt class="pcl">환경경영 선포</dt>
								<dd style="word-break:keep-all;">오뚜기는 전사 차원에서 환경경영을 체계적으로 추진하기 위해 환경경영 전략 수립과 함께 전 임직원이 참여하는 가운데 2010년 9월 1일 환경경영 선포식을 개최하였습니다.<br><br>
		최고 경영자는 선포식을 통해 오뚜기가 글로벌 기업으로 도약하는 시점에서 환경경영의 중요성을 강조하고 임직원들에게 무엇보다 실천이 중요함을 강조하였습니다. 오뚜기는 이를 계기로 ‘자연과 함께 맛으로 행복한 세상’을 만들기 위한 의미 있는 걸음을 내디뎠습니다.</dd>
							</dl>
						</div>
						<div class="env2">
							<dl>
								<dt class="pcl">환경경영 실천방침</dt>
								<dd style="word-break:keep-all;">오뚜기의 환경 방침은 제품 전과정의 환경영향 저감, 법규 준수, 업무 프로세스와 환경의 통합, 내부 역량강화, 이해관계자 참여, 시설물 운영 등 기업활동 전반에 적용되고 있습니다.<br><br>
		오뚜기가 창립 이래 꾸준히 성장·발전해오면서 오뚜기의 경영철학을 담고 있는 사시(社是)가 임직원들이 추구해야 할 궁극적인 목표를 제시해주었던 것처럼, 환경방침은 임직원들이 환경경영을 실천하면서 어떻게 머리쓰고 땀 흘려야 하는지에 대한 방향을 알려줍니다. 이를 위해 2010년 9월 오뚜기의 환경 방침으로서 ‘환경경영 실천방침’을 공표하고 전 임직원이 그 내용을 공유하였습니다.</dd>
							</dl>
						</div>
					</div>
	                <div class="row system1">
						<div class="row value mt30">
							<div class="col s12 m6 l6">
								<p class="imgev1"><img src="<%=path %>/images/nature_img1.png" alt="환경경영 선포"></p>
							</div>
							<div class="col s12 m6 l6 right-align">
								<p class="imgev2"><img src="<%=path %>/images/nature_img2.png" alt="환경경영 실천방침"></p>
							</div>
						</div>
					</div>	
					<div class="section btmBrn06 mt50">
					<div class="container fix">
						<div class="row">
							<div class="col s12 m6 l6  right">
								<dl class="container" style="word-break:keep-all;">
									<dt>환경경영 실천 방침</dt>
									<dd><span class="h">1.</span> 우리는 에너지 절감 및 낭비요소를 제거하고, 온실가스를 포함한 배출가스를 줄이기 위해<br> 끊임없이 노력한다.</dd>
									<dd><span class="h">2.</span>  우리는 제품개발로부터 사용 후 폐기까지 사전오염 예방 및 환경오염물질의 발생을 최소화하여<br> 고객의 환경에 대한 기대에 부응한다.</dd>
									<dd><span class="h">3.</span>  우리는 환경법규를 준수하고 법적 기준보다 엄격한 내부 기준을 만들어 이를 충실히 이행한다.</dd>
									<dd><span class="h">4.</span>  우리는 업무시설과 업무절차를 철저히 분석하여 환경성과가 개선될 수 있게 한다.</dd>
									<dd><span class="h">5.</span> 우리는 환경영향을 줄일 수 있는 조치들을 시행하고 공급업체 및 협력업체에도 요청한다.</dd>
									<dd><span class="h">6.</span>  우리는 모든 시설물 및 시설물 운영에 있어 환경을 고려한다.</dd>
									<dd><span class="h">7.</span>  우리는 환경경영활동의 정보화로 내외부 의사소통체계를 강화하고, <br>전략 목표와 과제를 반드시 실행한다.</dd>
									<dd><span class="h">8.</span>  우리는 환경보전에 대한 사회적 책임을 깊이 인식하고 지역사회의 환경보전활동에 적극 참여한다.</dd>
									<dd><span class="h">9.</span>  우리는 업무 및 제품, 서비스와 관련된 환경관점과 법률적 요건을 철저히 파악한다.</dd>
									<dd><span class="h">10.</span> 우리는 환경목표를 지속적으로 달성하기 위하여 필요한 교육과 충분한 자료를 확보한다.</dd>
								</dl>
								</div>
							</div>
						</div>
					</div>
	            </article>
			</section>
            <section class="page" id="page3">
                <h2 class="page_tit">사회</h2>
                <article class="grid3" style="margin:10px auto;">
                	<h2 class="lb">인권 정책 선언</h2>
                	<div class="row system1 fix mt50">
						<div class="env">
							<dl>
								<dd style="word-break:keep-all;">주식회사 오뚜기는 ‘보다 좋은 품질, 보다 높은 영양, 보다 앞선 식품으로 인류식생활 향상에 이바지한다.’는 것을 기업 경영의 목표로 삼고 있습니다.<br><br><br>
								주식회사 오뚜기의 모든 임직원은 제품 개선 및 개발을 통한 ‘인류식생활 향상’은 물론, 나아가 모든 경영 활동에서 다양한 이해관계자들의 인권을 보호하고, 인류가 공통적으로 추구하는 가치를 향상시키기 위해 노력하고 있습니다.<br><br><br>
								주식회사 오뚜기는 세계인권선언, UN 기업과 인권에 관한 이행원칙, OECD 다국적기업 가이드라인 등 국제적으로 통용되는 인권관련 국제기준을 존중하고 지지합니다.</dd>
							</dl>
						</div>
						<div class="env3">
							<dl>
								<dd style="word-break:keep-all;">모든 인간은 존엄하게 대우받을 권리가 있으며, 이러한 권리에는 생명과 신체적 안전, 사상/표현/종교의 자유, 결사의 자유, 일과 가정생활의 균형, 사생활 보장, 식량과 물 안보 확보, 고문/노예제도 또는 강제노동으로부터의 자유, 공정하고 품위 있는 근로 조건에 대한 권리, 차별금지 등이 포함되어 있습니다.
								<br><br><br>
								이에 주식회사 오뚜기는 타인의 인권을 침해하는 것을 방지하고 회사의 경영활동 과정에서 인권에 대한 부정적 영향의 방지와 해결을 위해 적절한 조치를 취하고자 노력하고 있으며, 그러한 노력을 명확히 밝히기 위해 다음과 같이 인권경영 가이드라인을 공개합니다.</dd>
							</dl>
						</div>
					</div>
					<img src="<%=path %>/images/bhr_img1.gif" alt="인권경영 관리 프로세스" class="imgpro">
					<p class="pcl"><br><br><br>적용대상<br></p>
					<p class="lp">본 가이드라인은 주식회사 오뚜기의 임직원은 물론 관계사와 협력사에도 적용됩니다.<br>
						주식회사 오뚜기의 전 임직원은 본 인권정책을 준수하며, 또한 협력사 등<br>
						주식회사 오뚜기와 거래 관계를 유지하는 모든 이해관계자 역시 본 인권정책을 존중하기를 기대합니다.<br><br>
					</p>
				</article>
			</section>
            <section class="page" id="page4">
                <h2 class="page_tit">지배구조</h2>
				<article class="grid3" style="width:1280px; margin:10px auto;">
				<h2 class="lb">기업지배구조헌장</h2>
				<div class="pg4row">
						<div class="col s12">
							<h3 class="h3tit">전   문</h3>
							<p>오뚜기는 “보다 좋은 품질, 보다 높은 영양, 보다 앞선 식품으로 인류 식생활 향상에 이바지한다”는 경영철학을 바탕으로, 건강한 식문화로 세계와 함께 하는 지속가능한 기업이 되기 위하여 기업지배구조헌장을 제정한다. 오뚜기는 이 헌장에 따라 독립적인 이사회의 관리감독 아래 공정하고 투명한 책임경영을 실현함으로써 주주, 고객, 직원 및 협력사를 포함한 모든 이해관계자의 권익을 증진하는 건전한 지배구조의 기업으로 도약하고자 한다.</p>
						</div>
						<div class="col s12">
							<h3 class="h3tit">제1장 이사회</h3>
							<p><b>제1조 (이사회의 역할 및 책임)</b><br>
							① 주식회사 오뚜기의 이사회는 중장기적인 기업가치 향상을 목표로 주주가치를 창출하고 지속가능한 성장에 기여하여야 한다.<br>
							② 이사회와 경영진은 지속가능한 성장과 중장기적인 기업가치 향상을 촉진하고 수익성 및 자본 효율성 등의 개선을 도모하기 위해 기업의 목표 및 경영전략을 수립하고, 지속가능성을 추구하는 기업 문화 조성을 위해 리더십을 발휘하여야 한다. <br>
							③ 이사회는 회사경영에 관한 포괄적인 권한을 가지며, 회사의 경영의사결정 기능과 경영 감독 기능을 수행하여야 한다.<br>
							④ 이사회는 지배주주 등 다른 주주, 경영진의 부당한 내부거래 및 자기거래로부터 일반주주의 이익을 보호하여야 한다.</p>
							<p></p>
							<p><b>제2조 (이사의 의무)</b><br>
							① 이사는 선량한 관리자의 주의의무를 다하여 직무를 수행하여야 한다. 이사는 충분한 정보를 바탕으로 충분한 시간 및 노력을 투입하여 합리적 의사결정을 하여야 한다.<br>
							② 이사는 직무수행과 관련하여 알게 된 회사의 비밀을 외부에 누설하거나, 자기 또는 제3자의 이익을 위하여 이용해서는 안 된다.<br>
							③ 이사는 자기 또는 제3자의 이익을 위하여 그 권한을 행사하여서는 안 되고, 항상 회사와 주주에게 최선의 이익이 되는 결과를 추구하여야 한다.<br>
							④ 이사가 법령이나 정관을 위반하거나 그 임무를 소홀히 한 때에는 회사에 대하여 손해배상책임을 지며, 이사에게 고의 또는 중과실이 있는 때에는 제3자에 대하여도 손해배상책임을 진다. 그러나 적절한 절차와 성실하고 합리적인 판단에 따른 이사의 경영판단은 존중되어야 한다.</p>
							
							<p><b>제3조 (이사회의 구성)</b><br>
							① 이사회는 효과적이고 신중한 토의 및 의사결정이 가능하도록 3인 이상으로 구성한다. <br>
							② 이사회에는 실질적인 경영감독 기능을 수행하기에 충분한 수의 독립적인 사외이사를 둔다. </p>
							
							<p><b>제4조 (사외이사)</b><br>
							① 사외이사는 회사와 중대한 관계가 없어야 하며, 경영진과 지배주주로부터 독립적인 의사결정을 할 수 있는 자이어야 한다.<br>
							② 사외이사는 충실한 직무수행을 위하여 과도한 겸직을 하여서는 안 된다.<br>
							③ 사외이사는 직무수행을 위하여 충분한 시간을 투입하여야 하며, 이사회가 개최될 때에는 사전에 관련 자료를 검토한 후 참석하여야 한다.<br>
							④ 회사는 사외이사의 직무수행에 필요한 정보를 충분히 제공하여야 하며, 사외이사는 직무수행에 필요한 정보를 신속하게 제공하도록 요청할 수 있다.<br>
							⑤ 사외이사는 필요한 경우 적절한 절차에 의하여 임･직원이나 외부 전문가 등의 지원을 받을 수 있으며, 회사는 이에 소요되는 비용을 지원하여야 한다.<br>
							⑥ 사외이사는 효율적인 직무수행을 위하여 주기적으로 사내･외 교육에 임하여야 한다.</p>
							
							<p><b>제5조 (이사회의 운영)</b><br>
							① 이사회는 회사와 주주의 이익을 위한 최선의 경영의사결정을 위해 효율적이고 합리적으로 운영되어야 한다. <br>
							② 이사회 의장은 적극적인 토론문화를 장려하고 이사회를 건설적으로 이끌어야 하며, 사외이사가 정확하고 시의적절한 정보를 토대로 의사결정에 참여할 수 있도록 지원하여야 한다.<br>
							③ 원활한 이사회 운영을 위하여 이사회의 권한과 책임, 운영절차 등을 구체적으로 규정한 이사회규정을 마련하여야 한다.<br>
							④ 이사회는 원칙적으로 정기적으로 개최되어야 하며, 이사회 및 위원회는 매 회의 마다 의사록을 작성하여 이를 유지･보존하여야 한다.<br>
							⑤ 이사회는 대표이사, 대표집행임원 또는 이사회 내 위원회에 권한을 위임할 수 있다. 다만 법령, 정관 또는 이사회규정에서 정하는 주요한 사항은 제외한다.</p>
							
							<p><b>제6조 (이사회 내 위원회)</b><br>
							① 이사회 내부에 특정 기능과 역할을 수행하는 적정 수의 인원으로 구성된 위원회를 설치할 수 있다. <br>
							② 모든 위원회의 조직, 운영 및 권한에 대하여는 명문으로 규정하여야 하며, 위원회는 결의한 사항을 이사회에 보고하여야 한다.</p>
						</div>
						<div class="col s12">
							<h3 class="h3tit">제2장 주주</h3>
							<p><b>제7조 (주주의 권리)</b><br>
							① 주주는 회사의 소유자로서 다음의 권리를 포함한 관련 법령에서 보장하는 기본적인 권리를 가진다.<br>
							&nbsp;&nbsp;&nbsp;&nbsp;1. 이익배당 및 잔여재산 분배 참여권<br>
							&nbsp;&nbsp;&nbsp;&nbsp;2. 주주총회 참석 및 의결권 <br>
							&nbsp;&nbsp;&nbsp;&nbsp;3. 주주권 행사에 필요한 충분한 정보를 시의적절하게 제공받을 권리<br>
							② 정관의 변경, 합병 등 회사의 존립 및 주주권에 중대한 변화를 가져오는 사항은 주주총회에서 주주의 권리를 최대한 보장하는 방향으로 결정되어야 한다. <br>
							③ 회사는 1주 1의결권을 보장하여야 한다. 다만 특정 주주에 대한 의결권 제한은 법률이 정하는 바에 따라 제한적으로 이루어져야 한다.<br>
							④ 이사회는 합병, 영업의 양수도 등 중요한 구조변경에 반대하는 주주가 법령이 정하는 바에 따라 그 지분의 실질가치를 반영하는 공정한 가액에 의한 주식매수청구권을 행사할 수 있도록 하여야 한다.<br>
							⑤ 회사의 경영에 영향력을 행사하는 지배주주는 회사와 모든 주주의 이익을 위하여 행동하여야. 한다.</p>
							
							<p><b>제8조 (주주총회)</b><br>
							① 이사회는 다양한 주제의 의제 또는 의안이 주주총회에 상정될 수 있는 환경을 조성하기 위해 노력하여야 한다.<br>
							② 주주총회에서 임원을 선임하거나 정관을 변경할 때에는 의안을 분리하여 상정하여야 한다.<br>
							③ 회사는 주주에게 주주총회의 일시, 장소 및 의안에 관한 충분한 정보를 충분한 기간 전에 제공하여야 한다. <br>
							④ 회사는 주주가 이사 및 감사후보에 대한 충분한 정보와 판단 시간을 가지고 의결권을 행사할 수 있도록 하여야 한다.<br>
							⑤ 주주총회의 결의는 투명하고 공정하게 이루어져야 하며, 이사회는 주주가 주주총회에서 의안에 대하여 질의하고 설명을 요구할 때 성실히 답변하여야 한다.</p>
						</div>
						<div class="col s12">
							<h3 class="h3tit">제3장 감사기구</h3>
							<p><b>제9조 (내부감사)</b><br>
							① 감사위원은 회사와 중대한 관계가 없어야 하며, 경영진과 지배주주로부터 독립적인 의사결정을 할 수 있는 자이어야 한다.<br>
							② 감사위원회는 독립성과 전문성을 유지하기 위하여 3분의 2 이상은 사외이사로 구성하여야 하고 감사업무에 관한 전문적 식견을 가진 자를 최대한 포함하여야 한다. <br>
							③ 감사위원회는 감사업무를 충실히 수행하여야 한다.<br>
							④ 이사회는 감사위원회의 목표, 조직, 권한과 책임 그리고 업무 등에 관한 규정을 명문화하여야 한다.<br> 
							⑤ 감사위원회는 매 회의마다 회의록을 작성하여야 하며, 회의록에는 주요 토의사항과 결의내용을 상세하고 명확하게 기재하여야 한다. 감사위원회는 감사내용을 구체적으로 기록한 감사록을 작성하여야 한다.<br>
							⑥ 감사위원회 위원은 감사업무에 필요한 정보에 자유롭게 접근할 수 있어야 하고, 필요한 경우 외부전문가의 자문을 받을 수 있어야 한다.<br>
							⑦ 감사위원회 또는 감사는 자신의 독립성에 대한 평가내용과 주요 활동내용을 주주총회에 보고하여야 하며, 대표이사는 사업보고서를 통해 이를 공시하여야 한다.</p>
							
							<p><b>제10조 (외부감사)</b><br>
							① 회사는 외부감사인이 회사와 그 경영진, 지배주주로부터 법적, 실질적 독립성을 유지하도록 하여야 한다.<br>
							② 회사는 감사보고서에 관한 주주의 질문이 있는 경우에 용이한 설명이 가능하도록 외부감사인을 주주총회에 참석시켜야 한다.<br>
							③ 감사위원회는 외부감사인이 주요사항을 보고하도록 하고 외부감사인과 주기적으로 소통해야 한다.</p>
						</div>
						<div class="col s12">
							<h3 class="h3tit">제4장 주주 및 이해관계자와의 소통</h3>
							
							<p><b>제11조 (주주 및 이해관계자와의 직접 소통)</b><br>
							이사회와 경영진은 회사의 지속가능한 성장에 이바지하기 위해 주주 및 이해관계자와의 건설적인 대화에 관심을 기울여야 한다.</p>
							
							<p><b>제12조 (정보 공개)</b><br>
							① 회사는 주주에게 필요한 회사의 정보를 적시에, 충분히, 공평하게 제공하여야 하며, 공시 의무가 없는 정보를 공개할 경우에도 모든 주주에게 공평하게 제공하여야 한다.<br>
							② 회사는 이해관계자에게 법령이 허용하는 범위 내에서 이해관계자의 권리보호에 필요한 정보를 제공하여야 하며, 이해관계자는 관련 정보에 접근할 수 있어야 한다.<br>
							③ 회사는 법령에 의해 요구되는 공시사항 외에도 주주 및 이해관계자의 의사결정에 중대한 영향을 미치거나 미칠 수 있는 사항은 공시하여야 한다.<br>
							④ 회사는 정보 공개 내용을 이해하기 쉽게 작성하고, 이해관계자가 이용하기 용이하도록 노력하여야 한다.</p>
						</div>						
					</div>
				</article>
			</section>
            <section class="page" id="page5">
                <h2 class="page_tit">지속가능경영 보고서</h2>
				<article class="grid3" style="width:1280px; margin:10px auto;">
				<h2 class="lb"></h2>
				<img alt="지속가능경영보고서" src="<%=path %>/images/esgpg4.png" class="esgpg4">
				</article>
			</section>
		</div>
        <%@ include file="../footer.jsp" %>
	</div>
</body>
</html>