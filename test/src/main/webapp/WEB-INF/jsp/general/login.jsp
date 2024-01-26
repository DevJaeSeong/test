<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/general/common/commonHead.jsp" />
	
	<script type="text/javascript" defer>
		$(function() {
			
			showLoginError();
		})
		
		function showLoginError() {
			
			const errorMsg = '${errorMsg}';
			
			if (errorMsg) { alert(errorMsg); }
		}
	</script>
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

		<jsp:include page="/WEB-INF/jsp/general/common/createAccountHeader.jsp" />

        <!-- location_box -->
        <div class="location_box">
            <!-- innerWrap -->
            <div class="locWrap">
                <!-- breadcrumb -->
                <div class="breadcrumb">
                    <strong class="hideEl">현재 위치</strong>
                    <a href="#none" class="btHomeBtn"><span class="hideTxt">HOME</span></a>
                    <!-- location_gb -->
                    <div>
                        <em>로그인</em>
                    </div>
                    <!-- location_gb -->

                </div>
                <!-- //breadcrumb -->
            </div>
            <!-- //innerWrap -->
        </div>
        <!-- //location_box -->
        <!-- S: mainContent -->
        <div id="mainContent" class="mt_20 mb_20">
            <!-- member -->
            <div class="member">
                <!-- login_box -->
                <div class="login_box">
                    <!-- title_form -->
                    <div class="title_form">
                        <h2>로그인</h2>
                        <p class="summary">이데아인포 홈페이지에 오신것을 환영합니다.</p>
                    </div>
                    <!-- //title_form -->
                    <!-- input_form -->
                    <div class="input_form">
                        <!-- input_box -->
                        <form id="loginForm" method="post" action="/loginConfirm">
	                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                        <div class="input_box mb_10">
	                            <input name="userId" title="아이디" class="input_log" type="text" placeholder="아이디">
	                        </div>
	                        <div class="input_box mb_10">
	                            <input name="password" title="비빌번호" class="input_log" type="password" placeholder="패스워드">
	                        </div>
                        </form>
                        <!-- //input_box -->
                        <!-- check_all -->
                        <div class="check_all mt_10 mb_10">
                        <input class="form-inputPop" type="checkbox" id="checkbox01">
                        <i></i>
                        <label for="checkbox01" title="아이디저장">아이디저장</label>
                        </div>
                        <!-- //check_all -->
                        <a href="#" class="login_Btn" title="로그인" onclick="loginForm.submit();">로그인</a>
                    </div>
                    <!-- //input_form -->
                    <!-- //link_form -->
                    <ul class="link_form">
                        <li><a href="#none" title="회원가입">회원가입</a></li>
                        <li><a href="#none" title="아이디 찾기">아이디 찾기</a></li>
                        <li><a href="#none" title="비밀번호 찾기">비밀번호 찾기</a></li>
                    </ul>
                    <!-- //link_form -->
                </div>
                <!-- //login_box -->
            </div>
            <!-- //member -->
        </div>
        <!-- E: mainContent -->

		<jsp:include page="/WEB-INF/jsp/general/common/commonFooter.jsp" />

    </div>
	<!-- //wrap -->
	
	<jsp:include page="/WEB-INF/jsp/general/common/createAccountPopup.jsp" />
	
</body>
</html>