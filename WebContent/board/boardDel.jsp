<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %> 
<%
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=utf-8");
	
	int bno = Integer.parseInt(request.getParameter("bno"));
	
	String driver = "org.postgresql.Driver";
	String url = "jdbc:postgresql://localhost/pro1";
	String user = "postgres";
	String pass = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	String passId = "";
	
	try {
		Class.forName(driver);
		try {
			conn = DriverManager.getConnection(url, user, pass);
			sql = "delete from board where bno=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bno);
				int n = pstmt.executeUpdate();
				if(n>0){
					response.sendRedirect("board_manage.jsp");
				} else {
					response.sendRedirect("board_Detail.jsp?bno="+bno);
				}
				pstmt.close();
				conn.close();
			} catch(SQLException e){
				System.out.println("SQL 전송 실패"+e);
			}
		} catch(SQLException e){
			System.out.println("데이터베이스 연결 실패~!"+e);
		}
	} catch(ClassNotFoundException e){
		System.out.println("드라이버 로딩 실패~!"+e);
	}
%>