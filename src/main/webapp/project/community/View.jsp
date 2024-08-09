<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>DailyEat 커뮤니티</title>
    <!-- CSS 파일 링크 -->
    <link rel="stylesheet" type="text/css" href="/css/CommuView.css">
    <!-- Font Awesome 스크립트 추가 -->
    <script src="https://kit.fontawesome.com/849bb0fdc9.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- 전체 컨테이너 -->
<div class="container">
    <!-- 헤더 섹션 -->
    <header>
        <h1>DailyEat</h1>
        <!-- 내비게이션 메뉴 -->
        <nav>
            <ul>
                <li><a href="#">홈</a></li>
                <li><a href="#">나의 기록</a></li>
                <li><a href="#">커뮤니티</a></li>
                <li><a href="#">마이페이지</a></li>
            </ul>
        </nav>
        <!-- 로그인 버튼 -->
        <button class="login-btn">로그인</button>
    </header>

    <!-- 게시글 영역 구분선 -->
    <hr class="section-divider">

    <!-- 메인 콘텐츠 영역 -->
    <main>
        <!-- 게시글 상세보기 섹션 -->
        <section class="post-detail">
            <div class="post-info">
                <div class="info-item">
                    <span class="label">번호:</span>
                    <span class="value">${ dto.num }</span>
                    <span class="label">작성자:</span>
                    <span class="value">${ dto.id }</span>
                    <span class="label">작성일:</span>
                    <span class="value">${ dto.postdate }</span>
                    <span class="label">조회수:</span>
                    <span class="value">${ dto.visitcount }</span>
                </div>
            </div>
            <div class="post-title">
                <span class="label">제목</span>
                <span class="value">${ dto.title }</span>
            </div>
            <hr class="content-divider">
            <div class="post-content">
                <span class="label">내용</span>
                <div class="content">
                    ${ dto.content }
                    <c:if test="${not empty dto.ofile and isImage eq true}">
                        <br>
                        <img src="../upload/${dto.sfile}" style="max-width: 100%;"/>
                    </c:if>
                </div>
            </div>
            <div class="post-actions">
                <button type="button" onclick="location.href='../../mvcboard/pass.do?mode=edit&num=${ param.num }';">수정하기</button>
                <button type="button" onclick="location.href='../../mvcboard/pass.do?mode=delete&num=${ param.num }';">삭제하기</button>
                <button type="button" onclick="location.href='../../mvcboard/list.do';">목록 바로가기</button>
            </div>
        </section>

        <!-- 댓글 입력 섹션 -->
        <section class="comment-section">
            <textarea placeholder="댓글을 쓰려면 로그인이 필요합니다."></textarea>
            <button class="comment-btn">댓글쓰기</button>
        </section>

        <!-- 댓글 목록 섹션 -->
        <section class="comments">
            <div class="comment">
                <span class="author">강아지(닉네임)</span>
                <span class="time">24분 전</span>
                <p>댓글 내용: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
            </div>
            <div class="comment">
                <span class="author">강아지(닉네임)</span>
                <span class="time">24분 전</span>
                <p>댓글 내용: ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~</p>
            </div>
        </section>
    </main>

    <!-- 푸터 섹션 -->
    <footer>
        <hr class="footer-divider">
        <p>DailyEat</p>
    </footer>
</div>
</body>
</html>
