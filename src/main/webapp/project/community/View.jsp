<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>DailyEat 커뮤니티</title>
    <!-- CSS 파일 링크 -->
    <link rel="stylesheet" type="text/css" href="/css/CommuView.css?after">
    <!-- Font Awesome 스크립트 추가 -->
    <script src="https://kit.fontawesome.com/849bb0fdc9.js" crossorigin="anonymous"></script>
</head>
<body>
<!-- 내비게이션 메뉴 -->
    <jsp:include page="../include/navbar.jsp"/>
<!-- 전체 컨테이너 -->
<div class="container">

    게시글 영역 구분선 -->
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
            <div class="comment-btn-wrapper">
            <button class="comment-btn">댓글쓰기</button>
            </div>
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

</div>
<!-- 푸터 섹션 -->
<footer>
<jsp:include page="../include/footer.jsp"/>
</footer>
</body>
</html>
