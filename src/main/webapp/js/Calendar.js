// Date 객체 생성
let date = new Date();

const renderCalendar = () => {
    const viewYear = date.getFullYear();
    const viewMonth = date.getMonth();

//선택한 날짜 캘린더 상단에 표시
    document.querySelector('.year-month').textContent = `${viewYear}년 ${viewMonth + 1}월`;


//지난 달 마지막 날짜(PLDate)와 요일(PLDay), 이번 달 마지막 날짜(TLDate)와 요일(TLDay) 가져오기
    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);

    const PLDate = prevLast.getDate();
    const PLDay = prevLast.getDay();

    const TLDate = thisLast.getDate();
    const TLDay = thisLast.getDay();

//전체 달력에 필요한 날짜 만들기
//날짜 담을 배열 만들기
    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1);
    const nextDates = [];


// prevDates 계산

    if (PLDay !== 6) {
        for (let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }

// nextDates 계산
    for (let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i)
    }

//세 배열 합치고 반복문 돌면서 html 코드 수정
    const dates = prevDates.concat(thisDates, nextDates);

    // Dates 정리
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(TLDate);
    dates.forEach((date, i) => {
        const condition = i >= firstDateIndex && i < lastDateIndex + 1
            ? 'this'
            : 'other';

        dates[i] = `<div class="date"><span class="${condition}">${date}</span></div>`;
    })

    // Dates 그리기
    document.querySelector('.dates').innerHTML = dates.join('');

}

renderCalendar();

//지난 달로 이동하는 함수
const prevMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
}

//다음 달로 이동하는 함수
const nextMonth = () => {
    date.setDate(1);
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
}

//오늘로 이동하는 함수
const goToday = () => {
    date = new Date();
    renderCalendar();
}

