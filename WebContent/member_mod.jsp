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
	String wid = (String) session.getAttribute("id");
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
				System.out.println("SQL 전송 실패");
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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보 수정</title>

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
   .vs, .img_box { height:50vh; margin-top: -45px; }
    #page1 .page_tit { padding-top: 50px; }
    #page1 {height:750px;}
    .table { width:800px; margin:4px auto; padding-left:20px; border-top:2px solid #333; text-align: center;}
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
    .page_tit { text-align:center; font-size:32px; }
    </style>
</head>
<body>
    <div class="container">
		<%@ include file="./header.jsp" %>  
        <div class="content">
            <figure class="vs">
                <div class="img_box">
                    <img src="./images/img_visual50.jpg" alt="로그인 이미지">
                </div>
            </figure>
            <section class="page" id="page1">
                <h2 class="page_tit">회원 정보 수정</h2>
                <div class="page_wrap">
                    <form name="modify_form" id="modify_form" action="member_modify_pro.jsp" method="post" onsubmit="return form_check(this)">
						<table class="table">
							<tbody>
								<tr>
									<th><label for="id" class="lb">아이디</label></th>
									<td>
										<input type="text" name="id" id="id" class="indata" value="<%=wid %>" readonly>
									</td>
								</tr>
								<tr>
									<th><label for="pw" class="lb">비밀번호</label></th>
									<td><input type="password" name="pw" id="pw" class="indata" pattern="^[A-Za-z\d$!%*#?&]{4,8}$" value="<%=wpw %>" required></td>
								</tr>
								<tr>
									<th><label for="pw2" class="lb">비밀번호 확인</label></th>
									<td><input type="password" name="pw2" id="pw2" class="indata" pattern="^[A-Za-z\d$!%*#?&]{4,8}$" required></td>
								</tr>
								<tr>
									<th><label for="name" class="lb">이름</label></th>
									<td><input type="text" name="name" id="name" pattern="^[가-힣A-Za-z]{2,12}$" class="indata" value="<%=wname %>" required></td>
								</tr>
								<tr>
									<th><label for="tel" class="lb">전화번호</label></th>
									<td><input type="tel" name="tel" id="tel" maxlength="13" value="<%=tel %>" class="indata"></td>
								</tr>
								<tr>
									<th><label for="email" class="lb">이메일</label></th>
									<td><input type="email" name="email" id="email" value="<%=email %>" class="indata"></td>
								</tr>
								<tr>
									<th><label for="email" class="lb">주소</label></th>
									<td><input type="text" name="addr" id="addr" value="<%=addr %>" class="indata"></td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="submit" value="수정" class="btn btn-primary"> &nbsp; &nbsp; &nbsp; &nbsp;
										<a href="mypage.jsp?id=<%=wid %>" class="btn btn-cancle">취소</a>
									</td>
								</tr>
							</tbody>
						</table>
                    </form>
                    <script>
                    function form_check(f){
                    	if(f.pw.value!=f.pw2.value){
                    		alert("비밀번호와 비밀번호 확인이 서로 다릅니다.");
                    		return false;
                    	}
                    }
                    </script>
                </div>
            </section>
        </div>
        <%@ include file="./footer.jsp" %>
    </div>
</body>
</html>                    