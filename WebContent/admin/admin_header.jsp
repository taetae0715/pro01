<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id = "";
	String name = "";
	if(session.getAttribute("id")!=null) {
		id = (String) session.getAttribute("id");
		name = (String) session.getAttribute("name");
	}
	String hdpath = request.getContextPath();
%>
        <header class="hd">
            <nav class="tnb">
                <div class="tnb_wrap">
                    <ul class="left_tnb">
<% if(id.equals("admin") && id != "") { %>
						<li><a href="<%=hdpath %>/admin/admin_index.jsp">관리자</a></li>
<% } %>
<% if(id != "") { %>
                        <li><a href="<%=hdpath %>/mypage.jsp"><%=id %>님의 마이페이지</a></li>
                        <li><a href="<%=hdpath %>/logout.jsp">로그아웃</a></li>
<% } else if(!(id.equals("admin"))){ %>
                        <li><a href="<%=hdpath %>/login.jsp">로그인</a></li>
                        <li><a href="<%=hdpath %>/agreement.jsp">회원가입</a></li>
<% } %>                   
                    </ul>
                    <ul class="center_tnb">
                        <li><a href="<%=hdpath %>/index.jsp">logo</a></li>
                    </ul>  
                     <ul class="right_tnb">
                        <li><a href="https://www.ottogi.co.kr/eng/main/main.asp" class="icon2">영문페이지</a></li>
                        <li><a href="https://v2.coginsight.net/service/#/aa15f11b-60b0-470a-90df-c84d1af43be9?" class="icon3">챗봇</a></li>
                        <li><label for="sitemap_ck" class="sitemap_btn">사이트맵</label></li>
                        <input type="checkbox" id="sitemap_ck">
                        <div class="sitemap">
                            <div class="sitemap_fr">
                                <label for="sitemap_ck" class="close_btn">닫기</label>
								<table>
									<thead>
										<tr><th>회사소개</th><th>ESG경영</th><th>제품정보</th><th>홍보센터</th><th>고객서비스</th></tr>
									</thead>
									<tbody>
										<tr><td>(주)오뚜기</td><td>ESG경영 소개</td><td>신제품 소개</td><td>오뚜기 뉴스</td><td>자주 묻는 질문</td></tr>
										<tr><td>인재 채용</td><td>환경/사회</td><td>제품소개</td><td>오뚜기 광고</td><td>고객 한마디</td></tr>
										<tr><td>사업장 소개</td><td>지배구조</td><td></td><td>투자정보</td><td>공장견학</td></tr>
										<tr><td>찾아오시는 길</td><td>지속가능경영 보고서</td><td></td><td>공지사항</td><td>공장위치</td></tr>
									</tbody>
								</table>
                            </div>
                        </div>
                    </ul>  
                </div>
            </nav>
            <nav class="gnb">
                <div class="gnb_wrab">
                    <ul class="menu_gnb">
                        <li><a href="<%=hdpath %>/admin/member_manage.jsp">회원 관리</a></li>
                        <li><a href="<%=hdpath %>/admin/board_manage.jsp">게시판 관리</a></li>
                        <li><a href="#">제품정보 관리</a></li>
                        <li><a href="#">홍보센터 관리</a></li>
                        <li><a href="#">고객 서비스 관리</a></li>
                    </ul> 
                </div>
            </nav>  
        </header>