<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>식단 관리3333</title>
    <link rel="stylesheet" href="../../css/Calendar3.css">
</head>
<body>
<div class="container">
    <div class="left-section">
        <h2>하루 식사량을 입력해주세요</h2>
        <p>음식 검색어를 입력하시고 Enter 키나 확인 버튼을 눌러주세요.</p>

        <div class="meal-buttons">
            <button class="bts">아침</button>
            <button class="bts">점심</button>
            <button class="bts">저녁</button>
            <button class="bts">간식</button>
        </div>

        <div class="search-bar">
            <input type="text" placeholder="음식 검색">
            <button class="search-button">&#128269;</button>
        </div>

        <p>** 검색창에 없는 경우 직접 입력해주세요.</p>
        <div class="manual-entry">
            <label>직접 입력하기</label>
            <label class="switch">
                <input type="checkbox" id="manual-entry-checkbox">
                <span class="slider"></span>
            </label>
            <button class="add-food">추가</button>

        </div>

        <div id="input-fields" class="input-fields">
            <p>메뉴 이름:</p>
            <input type="text">

            <p>총 칼로리:</p>
            <input type="text">

            <p>탄수화물:</p>
            <input type="text">

            <p>단백질:</p>
            <input type="text">

            <p>지방:</p>
            <input type="text">
        </div>
    </div>

    <div class="right-section">
        <div class="meal-info">
            <h2>나의 식단정보</h2>
            <p>음식 검색을 통해 음식을 추가하실 수 있습니다. 모든 음식을 입력하셨다면 입력 완료 버튼을 눌러주세요.</p>

            <div class="meal-entry" onclick="toggleMeal(this)">
                <img src="../../image/morning.png" alt="아침 식단">
                <p>아침 식단을 등록하세요</p>
                <span class="calories">총 칼로리: 0</span>
                <img class="arrow" src="/image/down.png" alt="화살표">
            </div>
            <div class="meal-content">
                <p>추가 정보가 여기에 표시됩니다.</p>
            </div>

            <div class="meal-entry" onclick="toggleMeal(this)">
                <img src="../../image/lunch.png" alt="점심 식단">
                <p>점심 식단을 등록하세요</p>
                <span class="calories">총 칼로리: 0</span>
                <img class="arrow" src="/image/down.png" alt="화살표">
            </div>
            <div class="meal-content">
                <p>추가 정보가 여기에 표시됩니다.</p>
            </div>

            <div class="meal-entry" onclick="toggleMeal(this)">
                <img src="../../image/dinner.png" alt="저녁 식단">
                <p>저녁 식단을 등록하세요</p>
                <span class="calories">총 칼로리: 0</span>
                <img class="arrow" src="/image/down.png" alt="화살표">
            </div>
            <div class="meal-content">
                <p>추가 정보가 여기에 표시됩니다.</p>
            </div>

            <div class="meal-entry" onclick="toggleMeal(this)">
                <img src="../../image/snack.png" alt="간식">
                <p>간식 식단을 등록하세요</p>
                <span class="calories">총 칼로리: 0</span>
                <img class="arrow" src="/image/down.png" alt="화살표">
            </div>
            <div class="meal-content">
                <p>추가 정보가 여기에 표시됩니다.</p>
            </div>
        </div>
        <button class="add-button" >+</button>
    </div>
</div>
<script src="/js/Calendar_3.js"></script>
</body>
</html>
