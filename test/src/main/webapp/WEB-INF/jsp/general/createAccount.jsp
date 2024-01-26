<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
			
			//if(!validate(jsonData)) { return; }
			
			fetch('/general/createAccountConfirm', {
				method: 'POST',
				headers: {
					'Content-Type': 'application/json',
			        'X-CSRF-TOKEN': $('meta[name="csrf"]').attr('content')
			    },
				body: JSON.stringify(jsonData)
			})
			.then(response => {
				
				if (response.ok)
					{ return response.json(); }
				else
					{ return response.text().then(errorMsg => { throw new Error(errorMsg); }) }
			})
			.then(data => {
				
				switch (data.result) {
				
					case "success": 
						alert('성공적으로 등록되었습니다.');
						location.href = '/general/main';
						break;
						
					default:
						alert('등록에 실패하였습니다.');
				}
			})
			.catch(error => {
				
				console.error(error)
				alert(error);
			})
		}
		
		function validate(jsonData) {
			
			if (!jsonData.userId) { 
				
				alert('아이디를 입력해주세요.'); 
				$('#userId').focus();
				return false;
			}
			
			if (!idCondition(jsonData.userId)) { 
				
				alert('아이디가 조건에 맞지않습니다.'); 
				$('#userId').focus();
				return false;
			}
			
			if (!jsonData.password) { 
				
				alert('비밀번호를 입력해주세요.'); 
				$('#password').focus();
				return false;
			}
			
			if (!passwordCondition(jsonData.password)) { 
				
				alert('비밀번호 조건이 만족하지 않습니다.'); 
				$('#password').focus();
				return false;
			}
			
			if (jsonData.password != jsonData.passwordConfirm) { 
				
				alert('비밀번호 확인이 일치하지 않습니다.'); 
				$('#passwordConfirm').focus();
				return false;
			}
			
			return true;
		}
		
		function checkDuplicateId() {
			
			const jsonData = {'userId': $('#userId').val()};
			
			fetch('/general/checkDuplicateId', {
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
				
				switch (data.result) {
				
					case "exists": 
						alert('이미 등록된 아이디 입니다.');
						break;
				
					case "not_exists": 
						alert('사용가능한 아이디 입니다.');
						break;
				
					case "error": 
						alert('아이디 조회에 에러가 발생하였습니다.');
						break;
						
					default:
						alert('알 수 없는 결과입니다.');
				}
			})
			.catch(error => {
				
				console.log(error)
			})
		}
		
		function onlyNumber(inputElement) {
			
	        $(inputElement).val(($(inputElement).val()).replace(/[^0-9]/g, ''));
		}
		
		function domainSelect() {
			
			$('#emailDomain').val($('#eMailDomainSelect').val());
		}
		
		function idCondition(input) {
			
			const regex = /^[a-zA-Z0-9]+$/;
			
		    return regex.test(input);
		}
		
		function passwordCondition(input) {
			
		    // 영어 대문자, 소문자, 숫자, 특수문자 각각 하나 이상 포함하는지 검사
		    const uppercaseRegex = /[A-Z]/;
		    const lowercaseRegex = /[a-z]/;
		    const numberRegex = /[0-9]/;
		    const specialCharRegex = /[!@#$%^&*()_+{}\[\]:;<>,.?~\\/-]/;

		    // 조건을 만족하는지 확인
		    const hasUppercase = uppercaseRegex.test(input);
		    const hasLowercase = lowercaseRegex.test(input);
		    const hasNumber = numberRegex.test(input);
		    const hasSpecialChar = specialCharRegex.test(input);

		    // 3종류 이상의 문자 조합과 8자리 이상의 길이를 확인
		    return (hasUppercase + hasLowercase + hasNumber + hasSpecialChar >= 4) && (input.length >= 8);
		}
		
		function checkId() {
			
			if (idCondition($('#userId').val())) { $('#idFeedback').css('display', 'none'); }
			else								 { $('#idFeedback').css('display', 'block'); }
		}
		
		function checkPassword() {
			
			if (passwordCondition($('#password').val())) { $('#passwordFeedback').css('display', 'none'); }
			else										 { $('#passwordFeedback').css('display', 'block'); }
		}
		
		function checkPasswordConfirm() {
			
			if ($('#password').val() == $('#passwordConfirm').val()) { 
				
				$('#passwordConfirmSuccessFeedback').css('display', 'block');
				$('#passwordConfirmFailFeedback').css('display', 'none');
				
			} else { 
				
				$('#passwordConfirmSuccessFeedback').css('display', 'none');
				$('#passwordConfirmFailFeedback').css('display', 'block');
			}			
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
                        <p class="supText"><span class="required">*</span> 표기 항목은 필수 입력 항목입니다.</p>
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
                                        <td><input id="userName" name="userName" title="아이디" class="inputText" type="text" placeholder="성명 입력" style="width:178px"></td>
                                    </tr>
                                    <tr>
                                        <th>생년월일</th>
                                        <td>
                                        	<select id="birthYear" name="birthYear" title="검색항목 선택" class="select_style" style="width:110px; ">
												<c:forEach var="i" begin="1940" end="2030">
												    <option value="${i}">${i}</option>
												</c:forEach>
                                            </select>
                                        	<select id="birthMonth" name="birthMonth" title="검색항목 선택" class="select_style" style="width:110px; ">
												<c:forEach var="i" begin="1" end="12">
												    <option value="${i}">${i}</option>
												</c:forEach>
                                            </select>
                                        	<select id="birthDay" name="birthDay" title="검색항목 선택" class="select_style" style="width:110px; ">
												<c:forEach var="i" begin="1" end="31">
												    <option value="${i}">${i}</option>
												</c:forEach>
                                            </select>
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
                                            <input id="phoneNumMiddle" name="phoneNumMiddle" class="inputText" type="text" maxlength="4" style="width:110px" oninput="onlyNumber(this);">
                                            <span class="txtWrap">-</span>
                                            <input id="phoneNumLast" name="phoneNumLast" class="inputText" type="text" maxlength="4" style="width:110px" oninput="onlyNumber(this);">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>
                                            <input id="emailId" name="emailId" class="inputText" type="text" style="width:178px">
                                            <span class="txtWrap">@</span>
                                            <input id="emailDomain" name="emailDomain" class="inputText" type="text" style="width:178px">
                                            <select name="eMailDomainSelect" title="검색항목 선택" class="select_style" style="width:170px;" id="eMailDomainSelect" onchange="domainSelect();">
                                                <option value="">직접입력</option>
                                                <option value="gmail.com">gmail.com</option>
                                                <option value="naver.com">naver.com</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td>
                                            <input id="postCode" name="postCode" title="우편번호" class="inputText" type="text" style="width:90px" readonly>
                                            <button type="button" class="btnType01" onclick="daumPostcode();">우편번호</button>&nbsp;
                                            <input id="adress" name="adress" title="주소" class="inputText" type="text" style="width:400px" readonly>
                                            <input id="adressDetail" name="adressDetail" title="상세주소" class="inputText mt_5" type="text" placeholder="상세주소" style="width:623px">
                                            <input id="extraAdress" name="extraAdress" type="hidden">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="required">*</span>아이디</th>
                                        <td>
                                            <input id="userId" name="userId" oninput="checkId(this);" title="아이디" class="inputText" type="text" placeholder="아이디 입력" style="width:178px">
                                            <button type="button" class="btnType01" onclick="checkDuplicateId();">중복확인</button>
                                            <p class="feedback" id="idFeedback" style="display: none">* 영어 대문자, 소문자, 숫자만 사용 가능합니다.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="required">*</span>비밀번호</th>
                                        <td>
                                            <input id="password" name="password" title="비밀번호" class="inputText" type="password" placeholder="비밀번호 입력" style="width:178px" oninput="checkPassword();">
                                            <p class="feedback" id="passwordFeedback" style="display: none">* 영어 대문자, 소문자, 숫자, 특수문자 중 3종류 조합하여 8자리 이상으로 입력해 주세요.</p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th><span class="required">*</span>비밀번호 확인</th>
                                        <td>
                                            <input id="passwordConfirm" name="passwordConfirm" title="비밀번호 확인" class="inputText" type="password" placeholder="비밀번호 입력" style="width:178px" oninput="checkPasswordConfirm();">
                                            <p class="feedback" id="passwordConfirmSuccessFeedback" style="display: none">* 비밀번호가 일치합니다.</p>
                                            <p class="feedback_retry" id="passwordConfirmFailFeedback" style="display: none">* 비밀번호가 일치하지 않습니다.</p>
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
	
	<%--   
	<jsp:include page="/WEB-INF/jsp/general/common/createAccountPopup.jsp" />
	--%>
	<jsp:include page="/WEB-INF/jsp/general/common/daumPostCodePopup.jsp" />
	
</body>
</html>