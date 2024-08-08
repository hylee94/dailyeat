<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>파일 첨부형 게시판</title>
</head>
<body>
<h2>게시글 조회</h2>

<table border="1" width="90%">
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td>번호</td> <td>${ dto.num }</td>
        <td>작성자</td> <td>${ dto.id }</td>
    </tr>
    <tr>
        <td>작성일</td> <td>${ dto.postdate }</td>
        <td>조회수</td> <td>${ dto.visitcount }</td>
    </tr>
    <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">
            ${ dto.content }
            <c:if test="${not empty dto.ofile and isImage eq true}">
                <br>
                <img src="../upload/${dto.sfile}" style="max-width: 100%;"/>
            </c:if>
        </td>
    </tr>
    <tr>
        <td>댓글</td>
        <td colspan="3"></td>
    </tr>
    <!-- 첨부파일 -->
<%--    <tr>--%>
<%--        <td>첨부파일</td>--%>
<%--        <td>--%>
<%--            <c:if test="${ not empty dto.ofile }">--%>
<%--                ${ dto.ofile }--%>
<%--                <a href="../../mvcboard/download.do?ofile=${ dto.ofile }&sfile=${ dto.sfile }&num=${ dto.num }">--%>
<%--                    [다운로드]--%>
<%--                </a>--%>
<%--            </c:if>--%>
<%--        </td>--%>
<%--        <td>다운로드수</td>--%>
<%--        <td>${ dto.downcount }</td>--%>
<%--    </tr>--%>

    <!-- 하단 메뉴(버튼) -->
    <tr>
        <td colspan="4" align="center">
            <button type="button" onclick="location.href='../../mvcboard/pass.do?mode=edit&num=${ param.num }';">
                수정하기
            </button>
            <button type="button" onclick="location.href='../../mvcboard/pass.do?mode=delete&num=${ param.num }';">
                삭제하기
            </button>
            <button type="button" onclick="location.href='../../mvcboard/list.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
</body>
</html>