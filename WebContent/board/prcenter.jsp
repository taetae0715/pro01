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
   .vs, .img_box { height:50vh; margin-top: -45px; }
	table { display:table; width:1000px; margin:10px auto; 
	border-bottom:1px solid #333; 
	border-collapse:collapse; }
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
        color:#fff;
    }
    .page_tit { text-align:center; font-size:32px; padding-top:60px; padding-bottom: 30px;}
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
                    <img src="../images/img_visual50.jpg" alt="대표 이미지">
                </div>
            </figure>
            <section class="page" id="page1">
                <h2 class="page_tit">오뚜기 뉴스</h2>
				<table>
					<thead>
						<tr><th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
					</thead>
					<tbody>
						<tr><td colspan="4">게시된 뉴스가 없습니다.</td></tr>
					</tbody>
				</table>
			</section>
            <section class="page" id="page2">
                <h2 class="page_tit">오뚜기 광고</h2>
				<table>
					<thead>
						<tr><th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
					</thead>
					<tbody>
					<tbody>
						<tr><td colspan="4">게시된 광고가 없습니다.</td></tr>
					</tbody>
				</table>
			</section>
            <section class="page" id="page3">
                <h2 class="page_tit">투자정보</h2>
				<table>
					<thead>
						<tr><th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
					</thead>
					<tbody>
						<tr><td colspan="4">게시된 정보가 없습니다.</td></tr>
					</tbody>
				</table>
			</section>
            <section class="page" id="page4">
                <h2 class="page_tit">공지사항</h2>
                <div class="tb_wrap">
						<table class="table" id="tb1">
						<thead>
							<tr><th>글번호</th><th>제목</th><th>작성자</th><th>작성일</th></tr>
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
%>
						<tr>
							<td><%=rs.getString("bno") %></td>
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
				    $('#tb1').DataTable({'order': [[0, 'desc']]});
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