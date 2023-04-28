<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String pid = "";
	if(session.getAttribute("id")!=null){
		pid = (String) session.getAttribute("id");
	}
	String Dpath = request.getContextPath();

	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";
	int bno = Integer.parseInt(request.getParameter("bno"));
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String compId = "";
	String sql = "";
	try {
		Class.forName(driver);
		try {
			conn = DriverManager.getConnection(url, user, pass);
			sql = "select board.bno as bno, board.title as title, board.content as content, member.name as name, board.resdate as resdate, board.author as author from board, member where board.author=member.id and board.bno=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bno);
				rs = pstmt.executeQuery();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>데이터베이스 게시판 목록 테스트</title>
<meta name="subject" content="오뚜기 벤치마킹 사이트">
    <meta name="keywords" content="오뚜기, 오뚝이, 진라면, 짜슐랭, 스파게티, 스파게티소스  ">
    <meta name="description" content="오뚜기 인기상품. 오뚜기의 인기상품들을 소개 합니다. 프레스코 미트 스파게티소스 조미소스/식품스파게티소스. 프레스코 미트 스파게티소스.">
    <meta name="author" content="ms. jo">

    <!-- 파비콘(favicon) 설정 -->
    <link rel="shortcut icon" href="<%=Dpath %>/images/favicon.ico">

    <!-- https://taetae0715.github.io/web1 -->
    <!-- 오픈그래프 설정 -->
    <meta name="og:site_name" content="오뚜기">
    <meta name="og:title" content="포트폴리오 - 오뚜기">
    <meta name="og:description" content="오뚜기 인기상품. 오뚜기의 인기상품들을 소개 합니다. 프레스코 미트 스파게티소스 조미소스/식품스파게티소스. 프레스코 미트 스파게티소스.">
    <mata name="og:url" content="https://taetae0715.github.io/web1">
    <mata name="og:image" content="./images/img_visual50.jpg">  

    <!-- 스타일 초기화 reset.css나 normalize.css --> 
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">  
    <link rel="stylesheet" href="<%=Dpath %>/common.css">
    <link rel="stylesheet" href="<%=Dpath %>/main.css">
    <!-- 기본 폰트 및 초기화 로딩 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Dongle:wght@300&family=Nanum+Brush+Script&family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Sono&display=swap" rel="stylesheet">
<style>
   .vs, .img_box { height:50vh; margin-top: -45px; }
    #page { padding-top: 50px;}
    #page1 { height:auto;}
	table { display:table; width:1000px; margin:30px auto; 
	border-bottom:1px solid #333; border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; border-top:1px solid #333;
	text-align:center; line-height:36px; padding-top:16px; padding-bottom:16px; }
	th { background-color:#333; color:#fff; width: 150px;}
    .table { width:900px; margin:4px auto; padding-top:20px; border-top:2px solid #333; }
    .lb { display:block;  font-size:20px; }
    .indata { display:inline-block; width:300px; height:24px; line-height:24px; padding:10px; }
    .btn { display:inline-block; outline:none; border:none; border-radius:8px; margin:16px;
         text-align: center; padding:10px 20px;  cursor:pointer; }
    .btn-primary { background: -moz-linear-gradient(top, #00b7ea 0%, #009ec3 100%); 
        background: -webkit-linear-gradient(top, #00b7ea 0%,#009ec3 100%); 
        background: linear-gradient(to bottom, #00b7ea 0%,#009ec3 100%); color:#fff; }
    .btn-cancle { background: -moz-linear-gradient(top, #a90329 0%, #8f0222 44%, #6d0019 100%); 
        background: -webkit-linear-gradient(top, #a90329 0%,#8f0222 44%,#6d0019 100%); 
        background: linear-gradient(to bottom, #a90329 0%,#8f0222 44%,#6d0019 100%);
        color:#fff;
    }
    .page_tit { text-align:center; font-size:32px; padding-top:60px; padding-bottom:16px; margin-left: 100px;}
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
                <h2 class="page_tit">게시글 상세보기</h2>
				<table>
					<tbody>
<%
						if(rs.next()){
							compId = rs.getString("author");
%>					
						<tr>
							<th>글 번호</th>
							<td><%=rs.getInt("bno") %></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><%=rs.getString("title") %></td>
						</tr>
						<tr>
							<th>내용</th>
							<td>
								<p><%=rs.getString("content") %></p>
							</td>
						</tr>
						<tr>
							<th>작성자</th>
							<td>
								<p><%=rs.getString("name") %></p>
							</td>
						</tr>
						<tr>
							<th>작성일</th>
							<td>
								<p><%=rs.getString("resdate") %></p>
							</td>
						</tr>
<%
						}
%>
						<tr>
							<td colspan="2">
								<a href="<%=Dpath %>/board/prcenter.jsp#page4" class="btn btn-primary">글 목록</a> &nbsp; &nbsp; &nbsp;
<%
							if(pid.equals(compId) || pid.equals("admin")){
%>
								<a href="<%=Dpath %>/board/boardUpdate.jsp?bno=<%=bno %>" class="btn btn-cancle">수정</a>								
								<a href="<%=Dpath %>/board/boardDel.jsp?bno=<%=bno %>" class="btn btn-primary">삭제</a>
<%
							}
%>							
							</td>
						</tr>
					</tbody>
				</table>
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
				System.out.println("SQL 전송 실패");
			}
		} catch(SQLException e){
			System.out.println("데이터베이스 연결 실패~!");
		}
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로딩 실패~!");
	}
%>