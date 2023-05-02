<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String pid = "";
	if(session.getAttribute("id")!=null){
		pid = (String) session.getAttribute("id");
	}	
	String path = request.getContextPath();

	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int bno = Integer.parseInt(request.getParameter("bno"));
	String sql = "";
	String compId = "";
	
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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시글 수정</title>

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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
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
    #page1 .page_tit { padding-top: 50px; padding-bottom: 50px; }
    .page { height: auto; }
    .table { width:900px; margin:4px auto; padding-top:20px; border-top:2px solid #333; }
    th {  text-align: justify;  line-height: 0; width:180px; padding-top:10px; padding-bottom: 10px;}
    td { padding-top:10px; padding-bottom: 10px; }
    th:after {  content: "";  display: inline-block;  width: 100%; }
    th:before {  content: "";  display: inline-block;  width: 100%; }
    .lb { display:block;  font-size:20px; text-align: center;}
    .indata { display:inline-block; width:800px; height:24px; line-height:24px; padding:10px; }
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
    .page_tit { text-align:center; font-size:32px; }
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
                <h2 class="page_tit">게시글 수정</h2>
                <div class="page_wrap">
                    <form name="boardUpdate_form" id="boardUpdate_form" action="boardUpdate_pro.jsp" method="post">
						<table class="table">
							<tbody>
<%
						if(rs.next()){
							compId = rs.getString("author");
%>							
								<tr>
									<th><label for="title" class="lb">제목</label></th>
									<td>
										<input type="hidden" name="bno" value="<%=bno %>">
										<input type="text" name="title" id="title" class="indata" value="<%=rs.getString("title") %>" required autofocus>
									</td>
								</tr>
								<tr>
									<th><label for="content" class="lb">내용</label></th>
									<td>
										<textarea rows="20" cols="100" name="content" id="content"><%=rs.getString("content") %></textarea>
										<input type="hidden" name="id" value="<%=pid %>">
									</td>
								</tr>
								<tr>
									<td colspan="2" style="text-align: center;">
										<a href="board_Detail.jsp?bno=<%=bno %>" class="btn btn-primary">이전</a>
										<input type="submit" value="수정" class="btn btn-cancle"> &nbsp; &nbsp; &nbsp; &nbsp;
										<a href="board_manage.jsp" class="btn btn-primary">목록으로</a>
									</td>
								</tr>
<%
						}
%>								
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