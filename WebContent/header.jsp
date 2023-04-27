<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String id = "";
	if(session.getAttribute("id")!=null) {
		id = (String) session.getAttribute("id");
	}
	String hdpath = request.getContextPath();
%>
        <header class="hd">
            <nav class="tnb">
                <div class="tnb_wrap">
                    <ul class="left_tnb">
<% if(id.equals("admin") && id != "") { %>
						<li><a href="<%=hdpath %>/admin.jsp">관리자</a></li>
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
                                	<br><br><br><br>
                                	<br><br>메렁<br><br>
                                	<br><br><br>메렁<br><br><br><br>
                                	<br><br><br><br>메렁
                            </div>
                        </div>
                    </ul>  
                </div>
            </nav>
            <nav class="gnb">
                <div class="gnb_wrab">
                    <ul class="menu_gnb">
                        <li><a href="<%=hdpath %>/company.jsp">회사소개</a>
                           <div class="sub item1">
                                <ul class="dp2">
                                    <li><a href="<%=hdpath %>/company.jsp#page1">(주)오뚜기</a></li>
                                    <li><a href="<%=hdpath %>/company.jsp#page2">인재 채용</a></li>
                                    <li><a href="<%=hdpath %>/company.jsp#page3">사업장 소개</a></li>
                                    <li><a href="<%=hdpath %>/company.jsp#page4">찾아오시는 길</a></li>
                                 </ul>
                             </div>
                        </li>
                        <li><a href="<%=hdpath %>/esg.jsp">ESG경영</a>
                            <div class="sub item2">
                                <ul class="dp2">
                                    <li><a href="<%=hdpath %>/esg.jsp#page1">ESG경영소개</a></li>
                                    <li><a href="<%=hdpath %>/esg.jsp#page2">환경</a></li>
                                    <li><a href="<%=hdpath %>/esg.jsp#page3">사회</a></li>
                                    <li><a href="<%=hdpath %>/esg.jsp#page4">지배구조</a></li>
                                    <li><a href="<%=hdpath %>/esg.jsp#page5">지속가능경영 보고서</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="<%=hdpath %>/product.jsp">제품정보</a>
                            <div class="sub item3">
                                 <ul class="dp2">
                                    <li><a href="<%=hdpath %>/product.jsp#page1">신제품 소개</a></li>
                                    <li><a href="<%=hdpath %>/product.jsp#page2">제품 소개</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="<%=hdpath %>/prcenter.jsp">홍보센터</a>
                            <div class="sub item4">
                                <ul class="dp2">
                                    <li><a href="<%=hdpath %>/prcenter.jsp#page1">오뚜기 뉴스</a></li>
                                    <li><a href="<%=hdpath %>/prcenter.jsp#page2">오뚜기 광고</a></li>
                                    <li><a href="<%=hdpath %>/prcenter.jsp#page3">즐거운 오뚜기</a></li>
                                    <li><a href="<%=hdpath %>/prcenter.jsp#page4">투자 정보</a></li>
                                    <li><a href="<%=hdpath %>/prcenter.jsp#page5">오뚜기 창립 50주년</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="<%=hdpath %>/customer.jsp">고객서비스</a>
                            <div class="sub item5">
                                <ul class="dp2">
                                    <li><a href="<%=hdpath %>/customer.jsp#page1">자주 묻는 질문</a></li>
                                    <li><a href="<%=hdpath %>/customer.jsp#page2">고객 한마디</a></li>
                                    <li><a href="<%=hdpath %>/customer.jsp#page3">공장 견학</a></li>
                                </ul>
                            </div> 
                        </li>
                    </ul> 
                </div>
            </nav>  
        </header>