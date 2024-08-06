document.addEventListener('DOMContentLoaded', function () {
    const navToggle = document.getElementById('nav-toggle');
    // nav-toggle 이라는 ID를 가진 요소를 선택하여 navToggle 변수에 할당
    const navList = document.getElementById('nav-list');
    // nav-list 라는 ID를 가진 요소를 선택하여 navList 변수에 할당
    const startButton = document.getElementById('start-button');

    navToggle.addEventListener('click', function () {
        // 'navToggle' 요소에 클릭 이벤트 리스너를 추가
        navList.classList.toggle('active');
        // navList 요소의 클래스 목록에서 active 클래스를 토글
        // active 클래스가 요소에 없으면 추가하고 있으면 제거
    });
    startButton.addEventListener('click', function () {
        window.location.href = '#calendar';
    });
//     시작하기 버튼 클릭 시 '나의 기록' 섹션으로 이동합니다.
});
