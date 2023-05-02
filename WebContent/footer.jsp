<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String ftpath = request.getContextPath();
%>
        <footer class="ft">
            <article class="row row1">
                <div class="ft_wrap">
                    <nav class="fnb left">
                        <ul class="fnb_box">
                            <li><a href="pravacy.jsp">개인정보처리방침</a></li>
                            <li><a href="<%=ftpath %>/customer/customer.jsp">고객상담</a></li>
                            <li><a href="<%=ftpath %>/company/company.jsp#page4">찾아오시는 길</a></li>
                            <li><a href="https://www.ottogimall.co.kr/front/main">오뚜기몰</a></li>
                            <li><a href="https://v2.coginsight.net/service/#/aa15f11b-60b0-470a-90df-c84d1af43be9?">고객상담 챗봇</a></li>
                        </ul>
                    </nav>
                    <select name="favo" id="favo" class="favo right" onchange="favo(this)">
                        <option value="">FAMILY SITE</option>
                        <option value="https://ottogi.okitchen.co.kr/main/main.asp">O'kitchen</option>
                        <option value="https://blog.naver.com/ottogitoday1">Daily blog</option>
                        <option value="https://www.instagram.com/ottogi_daily/">Instagram</option>
                        <option value="https://www.facebook.com/Ottogitoday">Facebook</option>
                        <option value="https://www.youtube.com/user/Ottogimkt">Youtube</option>
                    </select>
                    <script>
                    function favo(s){
                        var hs = s.value;
                        if(hs!=""){
                            window.open(hs, "팝업");
                        }
                    }    
                    </script>
                </div>
            </article>
            <article class="row row2">
                <div class="ft_wrap">
                    <div class="slogan left">
                        (주)오뚜기 | 사업자등록번호 : 138-81-03238 | 대표이사 황성만<br>
                        주소 (14060) 경기도 안양시 동안구 흥안대로 405 (평촌동 160)<br>
                        오뚜기 고객상담실 : 080-024-2311<br>
                        오뚜기라면 고객상담실 : 080-088-1212 (월~금 08:30~17:00)
                    </div>
                    <nav class="ft_link_fr right">
                        <dl class="ft_link item1">
                            <dt>회사소개</dt>
                            <dd><a href="">(주)오뚜기</a></dd>
                            <dd><a href="">인재 채용</a></dd>
                            <dd><a href="">사업장 소개</a></dd>
                            <dd><a href="">찾아오시는 길</a></dd>
                        </dl>
                        <dl class="ft_link item2">
                            <dt>ESG경영</dt>
                            <dd><a href="">ESG경영 소개</a></dd>
                            <dd><a href="">환경</a></dd>
                            <dd><a href="">사회</a></dd>
                            <dd><a href="">지배구조</a></dd>
                            <dd><a href="">지속가능경영 보고서</a></dd>
                        </dl>
                        <dl class="ft_link item3">
                            <dt>제품정보</dt>
                            <dd><a href="">신제품 소개</a></dd>
                            <dd><a href="">제품 소개</a></dd>
                        </dl>
                        <dl class="ft_link item4">
                            <dt>홍보센터</dt>
                            <dd><a href="">오뚜기 뉴스</a></dd>
                            <dd><a href="">오뚜기 광고</a></dd>
                            <dd><a href="">투자정보</a></dd>
                            <dd><a href="">공지사항</a></dd>
                        </dl>
                        <dl class="ft_link item5">
                            <dt>고객서비스</dt>
                            <dd><a href="">자주 묻는 질문</a></dd>
                            <dd><a href="">고객 한마디</a></dd>
                            <dd><a href="">공장 견학</a></dd>
                        </dl>
                    </nav>
                </div>
            </article>
            <article class="row row3">
                <div class="ft_wrap">
                    <div class="ft_logo left"></div>
                    <address class="copyright right">
                        Copyright ⓒ OTTOGI CORPORATION.,Ltd All Rights Reserved.
                    </address>
                </div>
            </article>
        </footer>
    <div class="fix_area">
        <a href="#page5" class="cir_box counsel">고객<br>상담센터</a>
        <a href="#" class="cir_box totop">↑<br>TOP</a>
    </div>