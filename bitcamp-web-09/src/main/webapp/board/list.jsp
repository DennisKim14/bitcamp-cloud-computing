<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>게시물 목록</title>
</head>
<body>
<h1>게시물 목록2</h1>
<p><a href='form.html'>새 글</a></p>
<table border='1'>
<tr>
    <th>번호</th><th>제목</th><th>등록일</th>
</tr>
<c:forEach items="${list}" var="board">
<tr>
    <td>${board.no}</td><td><a href='view?no=${board.no}'>${board.title}</a></td><td>${board.createdate}</td>

</tr>
</c:forEach>
</table>
</body>
</html>
