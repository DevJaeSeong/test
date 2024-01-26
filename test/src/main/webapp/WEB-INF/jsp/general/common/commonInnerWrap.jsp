<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- innerwrap -->
<div class="innerWrap">
	<h1>
		<a href="/general/main"><span class="hideTxt">이데아인포</span></a>
	</h1>

	<!-- 로그인 -->
	<c:if test="${empty pageContext.request.userPrincipal}">
		<div class="log" id="loginDiv">
			<button class="btn_top_02 " type="button" title="로그인" onclick="location.href='/general/login'">로그인</button>
			<button class="btn_top_02 " type="button" title="회원가입" onclick="location.href='/general/createAccount'">회원가입</button>
		</div>
	</c:if>
	<!-- 로그인 -->

	<!-- 로그아웃 -->
	<c:if test="${not empty pageContext.request.userPrincipal}">
		<div class="m_Login_info" id="logoutDIv">
			<div class="log_box">
				<span class="userName">홍길동 님</span>
				<div class="my_service">
					<button type="button" class="btnType01_4" onclick="event.preventDefault(); document.getElementById('logoutForm').submit();">로그아웃</button>
					<button type="button" class="btnType01_4">개인정보변경</button>
				</div>
			</div>
		</div>
	</c:if>
	<!-- 로그아웃 -->

	<form id="logoutForm" action="/logoutConfirm" method="post" style="display: none;">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	</form>

</div>
<!-- //innerwrap -->