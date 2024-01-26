<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/general/common/commonHead.jsp" />
</head>

<body>

    <!-- accessibility -->
    <ul id="accessibility">
        <li><a href="#contents">본문 바로가기</a></li>
        <li><a href="#gnb">주메뉴 바로가기</a></li>
    </ul>
    <!-- //accessibility -->

    <!-- wrap -->
    <div id="wrap">
		
		<jsp:include page="/WEB-INF/jsp/general/common/commonHeader.jsp" />
		
        <!-- mainContent -->
        <div id="mainContent" class="mt_20 mb_20">
            <!-- S: slide_Box -->
            <div class="slide_Box">
                <div class="swiper mySwiper">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide"><img src="/static/general/images/new/banner.png" alt="배너이미지"></div>
                        <div class="swiper-slide"><img src="/static/general/images/new/banner_02.png" alt="배너이미지"></div>
                        <div class="swiper-slide"><img src="/static/general/images/new/banner.png" alt="배너이미지"></div>
                        <div class="swiper-slide"><img src="/static/general/images/new/banner_02.png" alt="배너이미지"></div>
                    </div>
                    <div class="controlBox">
                        <div class="arrowBox">
                            <div class="swiper-button-next"></div>
                            <div class="swiper-button-prev"></div>
                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- E: slide_Box -->
            <div class="m_Row mt_10">
                <div class="m_auth_board_L">
                    <!-- brd_box -->
                    <div class="brd_box">
                        <div class="n_tab_box">
                            <div class="tab_on">공지사항</div>
                            <div class="tabCon">
                                <ul>
                                    <li><a href="#none"><em class="news_board">N</em>공지사항 내용입니다. 공지사항 내용입니다. 공지사항
                                            내용입니다.</a><span class="date">2024.01.10</span></li>
                                    <li><a href="#none"><em class="news_board">N</em>공지사항 내용입니다. 공지사항 내용입니다. 공지사항
                                            내용입니다.</a><span class="date">2024.01.10</span></li>
                                    <li><a href="#none">공지사항 내용입니다. 공지사항 내용입니다. 공지사항 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                    <li><a href="#none">공지사항 내용입니다. 공지사항 내용입니다. 공지사항 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                    <li><a href="#none">공지사항 내용입니다. 공지사항 내용입니다. 공지사항 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                    <li><a href="#none">공지사항 내용입니다. 공지사항 내용입니다. 공지사항 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                </ul>
                                <a class="more" href="#none" title="공지사항 더보기"></a>
                            </div>
                        </div>
                    </div>
                    <!-- brd_box -->
                </div>

                <div class="m_auth_board_R">
                    <!-- brd_box -->
                    <div class="brd_box">
                        <div class="n_tab_box">
                            <div class="tab_on">FAQ</div>
                            <div class="tabCon">
                                <ul>
                                    <li><a href="#none"><em class="news_board">N</em>FAQ 내용입니다. FAQ 내용입니다. FAQ
                                            내용입니다.</a><span class="date">2024.01.10</span></li>
                                    <li><a href="#none">FAQ 내용입니다. FAQ 내용입니다. FAQ 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                    <li><a href="#none">FAQ 내용입니다. FAQ 내용입니다. FAQ 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                    <li><a href="#none">FAQ 내용입니다. FAQ 내용입니다. FAQ 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                    <li><a href="#none">FAQ 내용입니다. FAQ 내용입니다. FAQ 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                    <li><a href="#none">FAQ 내용입니다. FAQ 내용입니다. FAQ 내용입니다.</a><span
                                            class="date">2024.01.01</span></li>
                                </ul>
                                <a class="more" href="#none" title="AUTH업무공지사항 더보기"></a>
                            </div>
                        </div>
                    </div>
                    <!-- brd_box -->
                </div>
            </div>
        </div>
        <!-- //mainContent -->

		<jsp:include page="/WEB-INF/jsp/general/common/commonFooter.jsp" />

    </div>
	<!-- //wrap -->
	
	<jsp:include page="/WEB-INF/jsp/general/common/mainPopup.jsp" />
	
</body>
</html>