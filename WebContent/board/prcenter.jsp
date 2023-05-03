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
<title>홍보센터</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>홍보센터</title>

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
    .page { height: auto; }
   .vs, .img_box { height:50vh; margin-top: -45px; }
   .tit { position: relative; margin-top: -420px; text-align: center; line-height: 40vh; color:#fff; font-size:80px; text-shadow: 1px 1px 10px #e1e1e1;}
	table { display:table; width:1000px; margin:10px auto; border-bottom:1px solid #333; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; border-top:1px solid #333; text-align:center; line-height:36px; }
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
   	
   	#page1 { background-color: #fff;}
	.board_fr { clear:both; width: 1280px; margin:0px auto;  padding-top: 20px; }
	.tb1 { clear:both; display:table; border-collapse: collapse;  }
	.tb1 tr { display:table-row;  width: 1280px; }
	.tb1 td { display:table-cell; min-height:50px; padding-top: 20px; padding-bottom: 20px; 
	border-top:1px solid #ccc; }
	.tb1 tr:last-child td { border-bottom:1px solid #ccc; }
	.tb1 td.td1 { vertical-align:top; width:100px; text-align:left; font-size:28px; 
	   color:hwb(37 16% 7%); font-weight: 200; }
	.tb1 td a { display:block; color:#333; transition-duration:0.4s; }
	.tb1 td a .td_tit { width:1100px; font-size:24px; line-height:1.4; font-weight:200;  padding-right: 36px;
	   white-space: nowrap; overflow:hidden; text-overflow: ellipsis; }
	.tb1 td a .td_com { width:1100px; font-size:17px; line-height:2.2; font-weight:100; 
	  color:#999;  padding-right: 36px; white-space: nowrap; overflow:hidden; text-overflow: ellipsis; }
	.tb1 td a:hover { color:darkorange; }
	.tb1 td a:hover .td_com { color:darkorange;}
	
	#page2 { background-color: #fff; color:#222;}
	#page2 .page_wrap { width: 1280px;}
	.grid_fr { clear:both; width: 1280px; }
	.grid_fr .grid_box { clear:both; width: 1280px; padding-top: 20px; }
	.grid_box li { width: 288px; margin-right: 12px; float:left; height: 288px; margin-bottom: 20px;}
	.grid_box li:last-child { margin-right: 0; }
	.grid_box li a { display:block; color:#f1f1f1; background-position:center center; 
	background-repeat: no-repeat; margin-top: 15px; height: 288px;
	padding-top:3em;  padding-left: 2.5em; font-size:32px; box-sizing:border-box; font-weight: bold; }
	.grid_box li a.item1 { height: 288px; background-image: url("<%=path %>/images/pcbm1.jpg"); background-size:auto 100%;}
	.grid_box li a.item2 { height: 288px; background-image: url("<%=path %>/images/prbm2.jpg"); background-size:auto 100%;}
	.grid_box li a.item3 { height: 288px; background-image: url("<%=path %>/images/prbm3.jpg"); background-size:auto 100%;}
	.grid_box li a.item4 { height: 288px; background-image: url("<%=path %>/images/prbm4.jpg"); background-size:auto 100%;}

	.grid_box li a.item5 { height: 288px; background-image: url("<%=path %>/images/prbm5.jpg"); background-size:auto 100%;}
	.grid_box li a.item6 { height: 288px; background-image: url("<%=path %>/images/prbm6.jpg"); background-size:auto 100%;}
	.grid_box li a.item7 { height: 288px; background-image: url("<%=path %>/images/prbm7.jpg"); background-size:auto 100%;}
	.grid_box li a.item8 { height: 288px; background-image: url("<%=path %>/images/prbm8.jpg"); background-size:auto 100%;}
	.grid_box li a .grid_tit { font-size:16px; line-height: 20;}
	
	#page2 { height: 800px; }
	</style>
</head>
<body>
    <div class="container">
		<%@ include file="../header.jsp" %>  
        <div class="content">
            <figure class="vs">
                <div class="img_box">
                    <img src="../images/visual_04.jpg" alt="홍보센터이미지">
                </div>
            </figure>
			<h1 class="tit">홍보센터</h1>
            <section class="page" id="page1">
                <h1 class="page_tit">오뚜기 뉴스</h1>
				<div class="page_wrap">
                    <article class="board_fr">
                        <table class="tb1">
                            <tbody>
                                <tr>
                                    <td class="td1">5</td>
                                    <td class="td2">
                                        <a href="">
                                            <h3 class="td_tit">'스위트홈 제 26회 오뚜기 가족요리 페스티벌' 접수</h3>
                                            <p class="td_com">㈜오뚜기는 가정의 달을 맞아 오는 5월 13일 과천 서울랜드 피크닉장에서 ‘스위트홈 제 26회 오뚜기 가족요리 페스티벌’을 개최합니다.올해 26회를 맞이한 ‘오뚜기 가족요리 페스트벌’은 요리라는 경험을 통해 가정의 행복한 스위트홈을 실현하고...</p>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td1">4</td>
                                    <td class="td2">
                                        <a href="">
                                            <h3 class="td_tit">오뚜기 소비기한 적용 제품 현황 안내</h3>
                                            <p class="td_com">오뚜기 소비기한 적용 제품 현황 안내당사 소비기한 적용 제품 현황(2023.03.31 기준)을 첨부파일로 안내드립니다.</p>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td1">3</td>
                                    <td class="td2">
                                        <a href="">
                                            <h3 class="td_tit">[신동아] 장미란 금메달 숨은 조력자 함태호 오뚜기 명예회장</h3>
                                            <p class="td_com">많은 분들이 베이징 올림픽에서 장미란 선수가 금메달을 들어올리던 감격의 순간을 기억하실 겁니다당시 저는 고등학생이었는데 저도 그 모습을 보면서 좀만 더 좀만 더를 외치곤 했습니다 마치 제가 역기를들어 올리는 것처럼이 얼굴을 막 찌푸리면서요이...</p>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td1">2</td>
                                    <td class="td2">
                                        <a href="">
                                            <h3 class="td_tit">오뚜기 참기름 출시 40주년…"제품 개발 이어간다"</h3>
                                            <p class="td_com">오뚜기는 1983년 고소한 참기름을 출시했고 2011년 옛날 참기름을 선보였다. 시장조사업체 닐슨IQ코리아에 따르면 오뚜기 참기름은 1990년부터 2020년까지 31년 연속 판매 1위를 기록했다.</p>
                                        </a>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td1">1</td>
                                    <td class="td2">
                                        <a href="">
                                            <h3 class="td_tit">오뚜기, 작년 매출 3조 첫 돌파…"창립 이후 53년만"</h3>
                                            <p class="td_com">오뚜기가 지난해 처음으로 연 매출 3조원을 넘기며 식품업계의 이른바 '3조원 클럽'에 입성했다.</p>
                                        </a>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </article>
                </div>
			</section>
            <section class="page" id="page2">
                <h1 class="page_tit">오뚜기 광고</h1>
                <div class="page_wrap">
                    <article class="grid_fr">
                        <ul class="grid_box">
                            <li>
                                <a href="https://youtu.be/Bpfd7ouMI1g" class="item1">
                                    <h3 class="grid_tit">진비빔면</h3>
                                </a>
                            </li>    
                            <li>
                                <a href="https://youtu.be/IbQZZxhPYD0" class="item2">
                                    <h3 class="grid_tit">진라면</h3>
                                </a>
                            </li>
                            <li>
                                <a href="https://youtu.be/jnXHTU-rpzk" class="item3">
                                    <h3 class="grid_tit">송민호 카레</h3>
                                </a>
                            </li>
                            <li>
                                <a href="https://youtu.be/_rkmS_4jRp4" class="item4">
                                    <h3 class="grid_tit">오뚜기 진비빔면</h3>
                                </a>
                            </li>  
                             <li>
                                <a href="https://youtu.be/ltZRDTAEw7o" class="item5">
                                    <h3 class="grid_tit">조인성 X.O 만두</h3>
                                </a>
                            </li>    
                            <li>
                                <a href="https://youtu.be/DuDoTSHZgWE" class="item6">
                                    <h3 class="grid_tit">요즘 매운맛, 열라면이 진리야!</h3>
                                </a>
                            </li>
                            <li>
                                <a href="https://youtu.be/XmFppOdXz7c" class="item7">
                                    <h3 class="grid_tit">오뚜기 BIG 육개장</h3>
                                </a>
                            </li>
                            <li>
                                <a href="https://youtu.be/5J4xTgrUzO0" class="item8">
                                    <h3 class="grid_tit">진라면이 진리야!</h3>
                                </a>
                            </li> 
                        </ul>
                    </article>
                </div>
			</section>
            <section class="page" id="page3">
                <h2 class="page_tit">투자정보</h2>
				<table>
					<thead>
						<tr><th>NO</th><th>제목</th><th>날짜</th><th>다운로드</th></tr>
					</thead>
					<tbody>
						<tr>
						<td>1</td>
						<td>2022년 제52기 결산공고</td>
						<td>2023-03-29</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>2</td>
						<td>2022년 제52기 재무제표</td>
						<td>2023-03-29</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>3</td>
						<td>2022년 제52기 사업보고서</td>
						<td>2023-03-21</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>4</td>
						<td>2022년 제52기 연말감사보고서</td>
						<td>2023-03-21</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>5</td>
						<td>2022년 제52기 감사보고서</td>
						<td>2023-03-21</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>6</td>
						<td>52기 주총 참석 안내(코로나 관련)</td>
						<td>2023-03-14</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>7</td>
						<td>소규모합병 종료에 따른 합병보고공고(오뚜기라면지주)</td>
						<td>2022-10-05</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>8</td>
						<td>소규모합병 종료에 따른 합병보고공고(오뚜기물류서비스지주)</td>
						<td>2022-10-05</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>9</td>
						<td>합병으로 인한 채권자이의제출 공고(오뚜기물류서비스지주)</td>
						<td>2022-08-29</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
						<tr>
						<td>10</td>
						<td>합병으로 인한 채권자이의제출 공고(오뚜기라면지주)</td>
						<td>2022-08-29</td>
						<td><a href="" class="btn_down">PDF 다운로드 </a></td>
						</tr>
					</tbody>
				</table>
			</section>
            <section class="page" id="page4">
                <h2 class="page_tit">공지사항</h2>
                <div class="tb_wrap">
						<table class="table" id="tb1">
						<thead>
							<tr><th>NO</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
						</thead>
						<tbody>
<%
		String driver = "org.postgresql.Driver";
		String url = "jdbc:postgresql://localhost/pro1";
		String user = "postgres";
		String pass = "1234";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "";
		int i = 0;
		try {
			Class.forName(driver);
			try {
				conn = DriverManager.getConnection(url, user, pass);
				sql = "select board.bno as bno, board.title as title, board.content as content, member.name as name, board.resdate as resdate, board.author as author from board, member where board.author=member.id order by board.bno desc";
				try {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();	
					if(rs==null){
%>
						<tr><td colspan="4">게시글이 존재하지 않습니다.</td></tr>
<%							
					}					
						while(rs.next()){
							++i;
%>
						<tr>
							<td><%=i %></td>
							<td>
<%
							if(pid!=""){
%>							
								<a href="<%=path %>/board/boardDetail.jsp?bno=<%=rs.getString("bno") %>"><%=rs.getString("title") %></a>
<%
							} else {
%>
								<span><%=rs.getString("title") %></span>
<%
							}
%>
							</td>
							<td><%=rs.getString("name") %></td>
							<td><%=rs.getString("resdate") %></td>
						</tr>
<%							
							}
%>	
					</tbody>
				</table>
				<div class="grp_btn" style="width:1280px; margin:20px auto;">
<%
							if(pid!=""){
%>						
						<a href="<%=path %>/board/boardIns.jsp" class="btn btn-primary">글쓰기</a>
<%
							} else {
%>
						<h3 class="data">로그인 후에 글쓰기가 가능합니다.</h3>
<%
							}
%>
					</div>
				</div>
				<script>
				$(document).ready(function(){
				    $('#tb1').DataTable({'order': [[0, 'asc']]});
				});
				</script>
			</section>
		</div>
        <%@ include file="../footer.jsp" %>
	</div>
</body>
</html>
<%
				rs.close();
				pstmt.close();
				conn.close();
			} catch(SQLException e){
				System.out.println("SQL 전송 실패"+e);
			}
		} catch(SQLException e){
			System.out.println("데이터베이스 연결 실패~!");
		}
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로딩 실패~!");
	}
%>