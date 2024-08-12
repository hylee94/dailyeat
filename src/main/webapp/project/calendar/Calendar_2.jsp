<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>나의 식단정보</title>
  <link rel="stylesheet" href="../../css/Calendar2.css">
</head>
<body>
<div class="container">
  <div class="left-section">
    <!-- Left section is empty -->
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
      <!-- Add more meal entries as needed -->
    </div>

    <button class="add-button">+</button>
  </div>
</div>

<script src="/js/Calendar_2.js"></script>
</body>
</html>
