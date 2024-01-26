<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header -->
<div id="header">
    <!-- innerwrap -->
    <div class="innerWrap">
        <h1><a href="/general/main.do"><span class="hideTxt">이데아인포</span></a></h1>
        <!-- 로그인 -->
        <div class="log">
            <button class="btn_top_02 " type="button" title="로그인">로그인</button>
            <button class="btn_top_02 " type="button" title="회원가입" onclick="location.href='/general/createAccount'">회원가입</button>
        </div>
        <!-- 로그인 -->
        <!-- 로그아웃 -->
        <!-- <div class="m_Login_info">
            <div class="log_box">
                <span class="userName">홍길동 님</span>
                <div class="my_service">
                    <button type="button" class="btnType01_4">로그아웃</button>
                    <button type="button" class="btnType01_4">개인정보변경</button>
                </div>
            </div>
        </div> -->
        <!-- 로그아웃 -->
    </div>
    <!-- //innerwrap -->
    <!-- gnbWrap -->
    <div id="gnbWrap" class="gnb_personal">
        <ul>
            <li class="first"><a href="#none" class="dep01">메뉴-1</a></li>
            <li class="first"><a href="#none" class="dep01">메뉴-2</a></li>
            <li class="first"><a href="#none" class="dep01">이미지게시판</a></li>
            <li class="first"><a href="#none" class="dep01">공지사항</a></li>
            <li class="first"><a href="#none" class="dep01">FAQ</a></li>
        </ul>
    </div>
    <!-- //gnbWrap -->
    <div class="gnb_bg" style="display: none;"><span></span></div>
</div>
<!-- //header -->