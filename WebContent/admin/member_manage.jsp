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
<meta charset="utf-8">
<title>관리자 페이지 - 회원 관리</title>
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
	table { display:table; width:900px; margin:10px auto; 
	border-bottom:1px solid #333; 
	border-collapse:collapse; }
	tr { display:table-row; }
	th, td { display:table-cell; border-top:1px solid #333;
	text-align:center; line-height:36px; }
	th { background-color:#333; color:#fff; }
    .table { width:900px; margin:4px auto; padding-top:20px;  }
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
    .page_tit { text-align:center; font-size:32px; padding-top:80px; padding-bottom:30px; }
    .tb_wrap { clear:both; width:900px; margin:10px auto; border-top:2px solid #333; padding-top:15px; }
   	.detail { display:block; text-align:center; max-width:120px; min-width:90px; padding:12px; font-size:24px; background-color: rgba(7, 93, 70, 0.9);
   	color:#fff; border-radius:30px; margin:42px auto; }
   	#page2, #page4 { background-color:rgba(240,240,240,0.8); }
   	.table.dataTable thead>tr>th { text-align:center; }
   	table.dataTable tbody tr td:last-child { text-align:center; padding-left:50px; }
   	.reg {margin-left: 200px;}
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
                <h2 class="page_tit">회원관리</h2>
                <div class="tb_wrap">
					<table class="table" id="tb1">
						<thead>
							<tr><th>연번</th><th>아이디</th><th>회원명</th><th>연락처</th><th>가입일</th></tr>
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
		String kid = "";
		int i = 0;
		try {
			Class.forName(driver);
			try {
				conn = DriverManager.getConnection(url, user, pass);
				sql = "select * from member order by regdate desc";
				try {
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();	
						if(rs==null){
%>
							<tr><td colspan="5">회원이 존재하지 않습니다.</td></tr>
<%							
						}	
						while(rs.next()){
							++i;
							kid = rs.getString("id");
%>
							<tr>
								<td><%=i %></td>
								<td><%=kid %></td>
								<td>
									<a href='<%=path %>/admin/member_Detail.jsp?id=<%=kid %>'><%=rs.getString("name") %></a>
								</td>
								<td><%=rs.getString("tel") %></td>
								<td class="reg"><%=rs.getString("regdate") %>
									<% if(!kid.equals("admin")) { %>
									<a href='<%=path %>/admin/member_del.jsp?id=<%=kid %>' class="btn btn-cancle">탈퇴</a>
									<% } %>
								</td>
							</tr>
<%							
						}
%>	
						</tbody>
					</table>
					<div class="grp_btn" style="width:1280px; margin:20px auto;">
<%
							if(pid.equals("admin")){
%>						
						<a href="<%=path %>/admin/member_Insert.jsp" class="btn btn-primary">신규 회원 등록</a>
<%
							} else {
%>
						<h3 class="data">현재 사용자는 관리자가 아닙니다.</h3>
<%
							}
%>
					</div>
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
