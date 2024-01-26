<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/WEB-INF/jsp/general/common/commonHead.jsp" />
	
	<script type="text/javascript" defer>
		function createAccount() {
			
			const formData = $('#createAccountForm').serializeArray();
			const jsonData = {};
			
			$.each(formData, function() {
				
				jsonData[this.name] = this.value;
			})
			
			console.log(jsonData);
			
			fetch('/general/createAccountConfirm', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
			        'X-CSRF-TOKEN': $('meta[name="csrf"]').attr('content')
			    },
				body: JSON.stringify(jsonData)
			})
			.then(response => {
				
				if (!response.ok) { throw new Error('Network response was not ok'); }
		        return response.json();
			})
			.then(data => {
				
			})
			.catch(error => {
				
				console.log(error)
			})
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
                    <a href="/general/main.do" class="btHomeBtn"><span class="hideTxt">HOME</span></a>
                    <!-- location_gb -->
                    <div>
                        <em>회원가입</em>
                    </div>
                    <!-- location_gb -->

                </div>
                <!-- //breadcrumb -->
            </div>
            <!-- //innerWrap -->
        </div>
        <!-- //location_box -->
        <!-- S: mainContent -->
        <div id="mainContent" class="mt_20 mb_20 box_mbr">
            <!-- member_step -->
            <div class="member_step">
                <!-- titBox -->
                <div class="titBox">
                    <h2 class="tit">회원가입</h2>
                </div>
                <!-- // titBox -->

                <ul class="stepTab02 mt_20  mb_20">
                    <li><b>STEP 01</b>이용약관동의</li>
                    <li class="current"><b>STEP 02</b>개인정보</li>
                    <li><b>STEP 03</b>가입완료</li>
                </ul>
                <div class="comment_mdr">
                    <h2>개인 정보</h2>
                    <p>이용약관 및 개인정보 보호를 위한 이용자 동의사항에 모두 동의해야만 회원가입 가능합니다.</p>
                </div>

                <!-- memberInWrap -->
                <div class="memberInWrap mb_20">
                    <div class="persinforbox">
                        <h3 class="titCntTP">개인 정보</h3>
                    </div>
                    <fieldset>
                        <legend>개인 정보</legend>
                        <p class="supText blind"><span class="required">*</span> 표기 항목은 필수 입력 항목입니다.</p>
                        <div class="boardTypeForm">
                        	<form id="createAccountForm">
                            <table class="table_reset">
                                <caption>고객사 정보</caption>
                                <colgroup>
                                    <col style="width: 150px;">
                                    <col style="width: auto;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th>성명</th>
                                        <td><input id="userName" name="userName" title="아이디" class="inputText" type="text" value="성명 입력" style="width:178px"></td>
                                    </tr>
                                    <tr>
                                        <th>생년월일</th>
                                        <td>
                                            <input id="birthYear" name="birthYear" title="생년월일" class="inputText" type="text" value="년도 입력" style="width:178px">
                                            <input id="birthMonth" name="birthMonth" title="생년월일" class="inputText" type="text" value="월 입력" style="width:178px">
                                            <input id="birthDay" name="birthDay" title="생년월일" class="inputText" type="text" value="일 입력" style="width:178px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>전화번호</th>
                                        <td>
                                            <select name="phoneNumFirst" title="검색항목 선택" class="select_style" style="width:110px; " id="phoneNumFirst">
                                                <option value="010">010</option>
                                                <option value="011">011</option>
                                                <option value="016">016</option>
                                            </select>
                                            <span class="txtWrap">-</span>
                                            <select name="phoneNumMiddle" title="검색항목 선택" class="select_style" style="width:110px; " id="phoneNumMiddle">
                                                <option value="1111">1111</option>
                                                <option value="2222">2222</option>
                                            </select>
                                            <span class="txtWrap">-</span>
                                            <select name="phoneNumLast" title="검색항목 선택" class="select_style" style="width:110px; " id="phoneNumLast">
                                                <option value="11111">1111</option>
                                                <option value="2222">2222</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>
                                            <input id="emailId" name="emailId" title="성명" class="inputText" type="text" value="성명" style="width:178px">
                                            <span class="txtWrap">@</span>
                                            <input id="emailDomain" name="emailDomain" title="성명" class="inputText" type="text" value="성명" style="width:178px">
                                            <select name="eMailDomainSelect" title="검색항목 선택" class="select_style" style="width:170px; " id="eMailDomainSelect">
                                                <option value="">직접입력</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="naver.com">naver.com</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td>
                                            <input id="postCode" name="postCode" title="우편번호" class="inputText" type="text" value="우편번호" style="width:90px">
                                            <button type="button" class="btnType01" id="idChkBtn" onclick="openPopup();">우편번호</button>&nbsp;
                                            <input id="adress" name="adress" title="주소" class="inputText" type="text" value="주소" style="width:400px">
                                            <input id="adressDetail" name="adressDetail" title="상세주소" class="inputText mt_5" type="text" value="상세주소" style="width:623px">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>아이디</th>
                                        <td>
                                            <input id="userId" name="userId" title="아이디" class="inputText" type="text" value="아이디 입력" style="width:178px">
                                            <button type="button" class="btnType01" id="idChkBtn">중복확인</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>비밀번호</th>
                                        <td>
                                            <input id="password" name="password" title="비밀번호" class="inputText" type="text" value="비밀번호 입력" style="width:178px">
                                            <p class="feedback">* 영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합하여 8자리 이상으로 입력해 주세요.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>비밀번호 확인</th>
                                        <td>
                                            <input id="passwordConfirm" name="passwordConfirm" title="비밀번호 확인" class="inputText" type="text" value="비밀번호 입력" style="width:178px">
                                            <!-- <p class="feedback">* 비밀번호가 일치합니다.</p> -->
                                            <p class="feedback_retry">* 비밀번호가 일치하지 않습니다.</p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            </form>
                        </div>
                    </fieldset>
                </div>
                <!-- memberInWrap -->
                <div class="btnWrap">
                    <button type="button" class="btnType02_1" id="nextBtn" onclick="createAccount();">다음단계</button>
                </div>

            </div>
            <!-- //member_step -->
        </div>
        <!-- E: mainContent -->

		<jsp:include page="/WEB-INF/jsp/general/common/commonFooter.jsp" />

    </div>
	<!-- //wrap -->
	
	<jsp:include page="/WEB-INF/jsp/general/common/createAccountPopup.jsp" />
	
</body>
</html>