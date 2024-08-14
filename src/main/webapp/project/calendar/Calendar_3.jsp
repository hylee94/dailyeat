<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<style>
    .suggestions {
        margin-top:33px;
        border: 1px solid #ccc;
        max-height: 150px; /* 최대 높이 설정 */
        overflow-y: auto; /* 세로 스크롤 생성 */
        background-color: white;
        position: absolute;
        z-index: 1000;
        width: 100%;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    }
    .suggestion-item {
        padding: 10px;
        cursor: pointer;
    }

    .suggestion-item:hover {
        background-color: #f0f0f0;
    }
</style>
<head>
    <meta charset="UTF-8">
    <title>식단 관리</title>
    <link rel="stylesheet" href="../../css/Calendar3.css">
    <script>
        let foodData = [];

        // API로부터 데이터를 가져오는 함수
        function fetchFoodData() {
            fetch('http://openapi.foodsafetykorea.go.kr/api/e570fcacc04041baa0be/I2790/xml/1/1000')
                .then(response => response.text())
                .then(data => {
                    console.log('API 데이터를 가져왔습니다:', data);
                    const parser = new DOMParser();
                    const xmlDoc = parser.parseFromString(data, "text/xml");
                    const items = xmlDoc.getElementsByTagName('row');

                    // 데이터를 파싱하고, 각 데이터에 접근할 때 요소가 존재하는지 확인
                    foodData = Array.from(items).map(item => {
                        const name = item.getElementsByTagName('DESC_KOR')[0]?.textContent || "정보 없음";
                        const gram =item.getElementsByTagName('SERVING_UNIT')[0]?.textContent || "0";
                        const calories = item.getElementsByTagName('NUTR_CONT1')[0]?.textContent || "0";
                        const carbs = item.getElementsByTagName('NUTR_CONT2')[0]?.textContent || "0";
                        const protein = item.getElementsByTagName('NUTR_CONT3')[0]?.textContent || "0";
                        const fat = item.getElementsByTagName('NUTR_CONT4')[0]?.textContent || "0";

                        // 파싱한 데이터를 콘솔에 출력
                        console.log('음식:', name, '총내용량 단위:', gram ,'칼로리:', calories, '탄수화물:', carbs, '단백질:', protein, '지방:', fat);

                        return { name, gram,calories, carbs, protein, fat };
                    });

                    console.log('파싱된 음식 데이터:', foodData);
                })
                .catch(error => console.error('Error fetching food data:', error));
        }

        // 페이지 로드 시 데이터를 불러옴
        window.onload = fetchFoodData;

        function updateSuggestions() {
            const searchQuery = document.getElementById('foodSearch').value.toLowerCase();
            console.log(searchQuery);

            const suggestionsDiv = document.querySelector('.suggestions');
            suggestionsDiv.innerHTML = '';

            if (searchQuery) {
                const filteredFood = foodData.filter(food => food.name.toLowerCase().includes(searchQuery));
                filteredFood.forEach(food => {
                    const suggestionItem = document.createElement('div');
                    suggestionItem.textContent = food.name;
                    suggestionItem.classList.add('suggestion-item');

                    // 연관 검색어 클릭 시 검색창에 입력
                    suggestionItem.onclick = function() {
                        document.getElementById('foodSearch').value = food.name;
                        suggestionsDiv.innerHTML = '';  // 클릭 후 연관 검색어 목록 비우기
                        searchFood(); // 검색 실행
                    };
                    suggestionsDiv.appendChild(suggestionItem);
                });
            }
        }

        function searchFood() {
            const searchQuery = document.getElementById('foodSearch').value.toLowerCase();
            const resultDiv = document.getElementById('searchResult');

            // 검색어와 대조하여 음식 데이터를 찾음
            let foundFood = foodData.find(food => food.name.toLowerCase() === searchQuery);
            console.log("foundFood : " , foundFood);
            if (foundFood) {
                // 데이터가 제대로 전달되는지 확인
                console.log('검색된 음식:', foundFood);

                resultDiv.innerHTML = `
                    <h3>음식 정보</h3>
                    <p><strong>이름:</strong> \${foundFood.name}</p>
                    <p><strong>총 열량:</strong> \${foundFood.calories} kcal</p>
                    <p><strong>총 내용량단위:</strong> \${foundFood.gram} g</p>
                    <p><strong>탄수화물:</strong> \${foundFood.carbs} g</p>
                    <p><strong>단백질:</strong> \${foundFood.protein} g</p>
                    <p><strong>지방:</strong> \${foundFood.fat} g</p>

                `;
            } else {
                resultDiv.innerHTML = `<p>검색된 음식이 없습니다. 다시 시도해 주세요.</p>`;
            }

            console.log('결과 HTML:', resultDiv.innerHTML); // 결과 HTML을 콘솔에 출력
        }
    </script>
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

        <div class="search-bar" style="position: relative;">
            <input type="text" id="foodSearch" placeholder="음식 검색" oninput="updateSuggestions()">
            <button class="search-button" onclick="searchFood()">&#128269;</button>
            <div class="suggestions"></div>
        </div>

        <p>** 검색창에 없는 경우 직접 입력해주세요.</p>
        <div class="manual-entry">
            <label>직접 입력하기</label>
            <label class="switch">
                <input type="checkbox" id="manual-entry-checkbox">
                <span class="slider"></span>
            </label>
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
        <button class="add-button">+</button>
    </div>
</div>

<!-- 검색 결과를 표시할 부분 -->
<div id="searchResult"></div>

<script src="/js/Calendar_3.js"></script>
</body>
</html>
