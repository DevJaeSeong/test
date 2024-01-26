<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function openPopup() {
	
	$('.mainPop').css('display', 'block');
}

function closePopup() {
	
	$('.mainPop').css('display', 'none');
}
</script>

<div class="mainPop" style="display: none;">
    <div class="layerWrap" style="width:650px; height: auto">
        <h1>주소 조회</h1>
        <!-- layercontent -->
        <div class="layercontent">
            <!-- boardSearch -->
            <div class="boardSearch">
                <div class="search_area">
                    <div class="txtC">
                        <span>시도</span>
                        <select name="sel01" title="검색항목 선택" class="select_style mr_10" style="width:130px;"
                            id="sel06">
                            <option value="1">선택</option>
                            <option value="2">1</option>
                            <option value="3">2</option>
                        </select>
                        <span>시군구</span>
                        <select name="sel01" title="검색항목 선택" class="select_style mr_10" style="width:130px;"
                            id="sel06">
                            <option value="1">선택</option>
                            <option value="2">1</option>
                            <option value="3">2</option>
                        </select>
                    </div>
                    <div class="mt_5 txtC">
                        <span>주소</span>
                        <input id="ex002" name="id" title="성명" class="inputText" type="text" placeholder="도로명 또는 건물명 입력"
                            style="width:250px">
                        <button type="button" class="btnType01_1" id="idChkBtn" title="검색">검색</button>
                    </div>
                </div>
            </div>
            <!-- //boardSearch -->
            <!-- 그리드 입력 임시테이블 -->
            <div class="pop_table mb_5 ">
                <table class="table_reset">
                    <caption>공지사항 목록</caption>
                    <colgroup>
                        <col style="width:20%">
                        <col style="width:80%">
                    </colgroup>
                    <thead>
                        <tr>
                            <th>선택</th>
                            <th>주소</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td rowspan="2">
                                <div>
                                    <input type="checkbox" id="01" type="checkbox">
                                    <label for="01" class="hideTxt">선택</label>
                                </div>
                            </td>
                            <td class="txtL">도로명 주소입니다. 도로명 주소입니다. 도로명 주소입니다. </td>
                        </tr>
                        <tr>
                            <td class="txtL">지번 주소입니다. 지번 주소입니다. 지번 주소입니다. </td>
                        </tr>
                        <tr>
                            <td rowspan="2">
                                <div>
                                    <input type="checkbox" id="02" type="checkbox">
                                    <label for="02" class="hideTxt">선택</label>
                                </div>
                            </td>
                            <td class="txtL">도로명 주소입니다. 도로명 주소입니다. 도로명 주소입니다. </td>
                        </tr>
                        <tr>
                            <td class="txtL">지번 주소입니다. 지번 주소입니다. 지번 주소입니다. </td>
                        </tr>
                        <tr>
                            <td rowspan="2">
                                <div>
                                    <input type="checkbox" id="03" type="checkbox">
                                    <label for="03" class="hideTxt">선택</label>
                                </div>
                            </td>
                            <td class="txtL">도로명 주소입니다. 도로명 주소입니다. 도로명 주소입니다. </td>
                        </tr>
                        <tr>
                            <td class="txtL">지번 주소입니다. 지번 주소입니다. 지번 주소입니다. </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- 그리드 입력 임시테이블 -->
            <div class="btnWrap mt_10">
                <button type="button" class="btnType01" id="nextBtn">취소</button>
                <button type="button" class="btnType01_1" id="nextBtn">적용</button>
            </div>
        </div>
        <!-- layercontent -->
        <button type="button" class="layerCloseBtn" onclick="closePopup();">레이어 닫기</button>
    </div>
</div>