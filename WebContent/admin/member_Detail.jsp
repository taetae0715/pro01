<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<%
	String path = request.getContextPath();
%>
<%
	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "";
	String wid = request.getParameter("id");
	String wpw = "";
	String wname = "";
	String tel = "";
	String email = "";
	String addr = "";
	String regdate = "";
	try {
		Class.forName(driver);
		try {
			conn = DriverManager.getConnection(url, user, pass);
			sql = "select * from member where id=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, wid);
				rs = pstmt.executeQuery();
				if(rs.next()){
					wpw = rs.getString("pw");
					wname = rs.getString("name");
					tel = rs.getString("tel");
					email = rs.getString("email");
					addr = rs.getString("addr");
					regdate = rs.getString("regdate");
				}
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
<!DOCTYPE html>
<html>
<head>
<title>회원정보 상세보기</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

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
          
    <!-- 기본 폰트 및 초기화 로딩 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!-- 스타일 초기화 -->
    <!-- reset.css나 normalize.css를 CDN 또는 다운로드 받아 link로 연결 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.css">
    <link rel="stylesheet" href="<%=path %>/common.css">
    <link rel="stylesheet" href="<%=path %>/sub_common.css">
    <link rel="stylesheet" href="<%=path %>/sublayout.css">
    <script src="<%=path %>/jquery-1.10.1.min.js"></script>
    <script src="<%=path %>/datatables.min.js"></script>
    <link rel="stylesheet" href="<%=path %>/datatables.min.css">
    <style>
    .ad_img_box { height:300px; margin-top: -450px; margin-bottom: 480px;}
   	.tit {position: relative; margin-top: -350px; margin-left:70px; text-align: left; line-height: 40vh; color:#fff;
 	  font-size:80px; text-shadow: 1px 1px 10px #e1e1e1;}
 	.page { height: auto; }
    #page1 .page_tit { padding-top: 50px; padding-bottom: 50px; }
    .table { width:900px; margin:4px auto; padding-top:20px; border-top:2px solid #333; }
    th {  text-align: justify;  line-height: 0; width:180px; padding-top:10px; padding-bottom: 10px;}
    td { padding-top:10px; padding-bottom: 10px; }
    th:after {  content: "";  display: inline-block;  width: 100%; }
    th:before {  content: "";  display: inline-block;  width: 100%; }
    
    .lb { display:block;  font-size:20px; margin-left: 150px; }
    .lbdata { display:block;  font-size:20px; margin-left: -1000px; }
   
    .btn { display:inline-block; outline:none; border:none; border-radius:8px; margin:16px;
         text-align: center; padding:10px 20px;  cursor:pointer; }
    .btn-primary { margin-left: 250px; background: -moz-linear-gradient(top, #00b7ea 0%, #009ec3 100%); 
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
                <h2 class="page_tit">회원 상세보기</h2>
                <div class="page_wrap">
					<table class="table">
						<tbody>
							<tr>
								<th class="lb">아이디</th><td class="indata"><%=wid %></td>
							</tr>
							<tr>
								<th class="lb">비밀번호</th><td class="indata"><%=wpw %></td>
							</tr>
							<tr>
								<th class="lb">이름</th><td class="indata"><%=wname %></td>
							</tr>
							<tr>
								<th class="lb">전화번호</th><td class="indata"><%=tel %></td>
							</tr>
							<tr>
								<th class="lb">이메일</th><td class="indata"><%=email %></td>
							</tr>
							<tr>
								<th class="lb">주소</th><td class="indata"><%=addr %></td>
							</tr>
							<tr>
								<td colspan="2">
									<a href="member_mod.jsp?id=<%=wid %>" class="btn btn-primary">정보 수정</a> &nbsp; &nbsp; &nbsp; &nbsp;
									<a href="member_del.jsp?id=<%=wid %>" class="btn btn-cancle">회원 탈퇴</a>
								</td>
							</tr>
						</tbody>
					</table>

                </div>
            </section>
        </div>
        <%@ include file="../footer.jsp" %>
    </div>
</body>
</html>