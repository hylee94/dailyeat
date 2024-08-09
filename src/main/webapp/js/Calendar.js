let date = new Date();
let selectedDateElement = null;

const renderCalendar = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();

    // 캘린더 상단에 연도와 월 표시
    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

    // 지난 달 마지막 날짜와 요일, 이번 달 마지막 날짜와 요일 가져오기
    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);

    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();
    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

    // 날짜 배열 생성
    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];

    // 이전 달 날짜 계산
    if (PLDay !== 6) {
        for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }

    // 다음 달 날짜 계산
    for (let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }

    // 날짜 배열 합치기
    const dates = prevDates.concat(thisDates, nextDates);

    // 날짜 HTML 코드 생성
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);
    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1
            ? 'this'
            : 'other';

        dates[i] = `<div class="date"><span class="${condition}">${date}</span></div>`;
    });

    // 날짜를 HTML에 그리기
    document.querySelector('.dates').innerHTML = dates.join('');

    // 오늘 날짜 강조 표시
    const today = new Date();
    if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
        for (let date of document.querySelectorAll('.this')) {
            if (+date.innerHTML === today.getDate()) {
                date.classList.add('today');
                break;
            }
        }
    }

    // 날짜 클릭 이벤트 추가
    document.querySelectorAll('.date').forEach(dateWrapper => {
        dateWrapper.addEventListener('click', function () {
            const dateSpan = this.querySelector('span');

            // 이전에 선택된 날짜의 스타일 초기화
            if (selectedDateElement) {
                selectedDateElement.classList.remove('selected');
            }

            // 현재 클릭된 날짜의 스타일 변경
            dateSpan.classList.add('selected');

            // 선택된 날짜 요소 저장
            selectedDateElement = dateSpan;
        })
    })
}

renderCalendar();

// 지난 달로 이동하는 함수
const prevMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
}

// 다음 달로 이동하는 함수
const nextMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
}

// 오늘로 이동하는 함수
const goToday = () => {
    date = new Date();
    renderCalendar();
}