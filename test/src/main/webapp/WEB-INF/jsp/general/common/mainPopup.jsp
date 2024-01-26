<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function closePopup() {
	
	$('.mainPop').css('display', 'none');
}
</script>

<div class="mainPop" style="display: block;">
    <div class="mainLayer">
    	<a href="javascript:closePopup();" class="closeLayer2" title="닫기">
    		<em class="hideTxt">닫기</em>
    	</a>
        <img src="/static/general/images/new/popup.png" alt="팝업 이미지">
        <div class="closeBox">
            <input type="checkbox" id="closeWindow">
            <label for="closeWindow">오늘 하루 이창을 열지 않음</label>
        </div>
    </div>
</div>