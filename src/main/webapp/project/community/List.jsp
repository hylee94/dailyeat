<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8"
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>커뮤니티 게시판</title>
    <style>
        a{text-decoration: none;}
    </style>
</head>
<body>
<div class="info">
    <h2>커뮤니티</h2>
    <p>공유하고 싶은 정보를 서로 공유하세요!</p>
</div>

<%--검색 폼--%>
<form method="get">
    <table class="search">
        <tr>
            <td align="center">
                <select name="searchField">
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" name="searchWord">
                <input type="submit" value="검색">
            </td>
        </tr>
    </table>
</form>

<%--글쓰기 버튼--%>
<table>
    <tr align="center">
        <td>
            ${map.pagingImg}
        </td>
        <td width="100">
            <button type="button" onclick="location.href='../mvcboard/write.do';">
                글쓰기
            </button>
        </td>
    </tr>
</table>


<%--게시물 목록 테이블--%>
<table border="1" width="90%">
    <tr>
        <%--글 번호--%>
        <th width="10%">번호</th>
            <%--제목--%>
        <th width="*">제목</th>
            <%--작성자--%>
        <th width="15%">작성자</th>
            <%--조회수--%>
        <th width="10%">조회수</th>
            <%--작성일--%>
        <th width="15%">작성일</th>
            <%--첨부파일--%>
<%--        <th width="8%">첨부파일</th>--%>
    </tr>

    <c:choose>
        <c:when test="${empty boardList}">
            <%--게시글이 없을 때--%>
            <tr>
                <td colspan="5" align="center">
                    등록된 게시물이 없습니다.
                </td>
            </tr>
        </c:when>
        <c:otherwise>
            <%--게시글이 있을 때--%>
            <c:forEach items="${boardList}" var="row" varStatus="loop">
                <tr align="center">
                    <td>${row.num}</td>
                    <td align="left">
                        <a href="../mvcboard/view.do?num=${row.num}">${row.title}</a>
                    </td>
                    <td>${row.name}</td>
                    <td>${row.visitcount}</td>
                    <td>${row.postdate}</td>
<%--                    <td>--%>
<%--                        <c:if test="${not empty row.ofile}">--%>
<%--                        <a href="../mvcboard.do?ofile=${ofile}&sfile=${row.sfile}&num=${row.num}">--%>
<%--                            [DOWN]--%>
<%--                        </a>--%>
<%--                        </c:if>--%>
<%--                    </td>--%>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>


</table>

</body>
</html>
