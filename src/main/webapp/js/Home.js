document.addEventListener('DOMContentLoaded', function () {
    const navToggle = document.getElementById('nav-toggle');
    const navList = document.getElementById('nav-list');
    const startButton = document.getElementById('start-button');
    const loginButton = document.querySelector('.login-button');

    navToggle.addEventListener('click', function () {
        // 'navToggle' 요소에 클릭 이벤트 리스너를 추가
        navList.classList.toggle('active');
        // navList 요소의 클래스 목록에서 active 클래스를 토글
        // active 클래스가 요소에 없으면 추가하고 있으면 제거
    });

    // 시작하기 버튼 눌렀을 때 이벤트
    startButton.addEventListener('click', function () {
        const isLoggedIn = false; // 실제 로그인 상태를 확인하는 로직을 여기에 추가합니다.
        if (isLoggedIn) {
            window.location.href = '#'; //나의 기록 페이지로 이동
        } else {
            alert('로그인이 필요합니다.');
            window.location.href = '#'; // 로그인 페이지로 이동
        }
    });

    // 네비바 로그인 버튼 눌렀을 때 이벤트
    loginButton.addEventListener('click', function (e) {
        e.preventDefault();
        window.location.href = '#'; // 로그인 페이지로 이동
    });


});



