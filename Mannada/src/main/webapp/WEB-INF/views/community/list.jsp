<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_list</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/community_list.css">
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>커뮤니티</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>목록</li>
		</ul>
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">사람들과 소통하는 공간입니다.</p>
	</div>
	<div>
		<div class="menu">
			<div class="title">
				<h3>커뮤니티</h3>
			</div>
			<c:if test="${sessionScope.member.id != null }">
				<a href="add"><button>글쓰기</button></a>
			</c:if>
		</div>
		<div>
			<table border="1">
				<thead>
					<tr>
						<th>No</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${list.size() < 1}">
						<tr>
							<td colspan="5">등록된 글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="item" items="${list}">
						<tr>
							<td>${item.rnum}</td>
							<td><a href="detail/${item.id}">${item.title}</a></td>
							<td>${item.nickname}</td>
							<td><fmt:formatDate value="${item.regDate}"
									pattern="yyyy-MM-dd " /></td>
							<td>${item.viewpoint}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

		<tfoot>
			<tr>
				<td colspan="5">
					<ol class="pagination pagination-sm justify-content-center"
						style="margin: 0">
						<li class="page_nation_item"><a href="?page=1${pager.query}"
							class="page-link">처음</a></li>
						<li class="page_nation_item"><a
							href="?page=${pager.prev}${pager.query}" class="page-link">이전</a></li>

						<c:forEach var="page" items="${pager.list}">
							<li class="page_nation_item"><a
								style="color: white; background-color: #555555; border-color: #555555;"
								href="?page=${page}${pager.query}"
								class="page-link ${page eq pager.page ? 'active' : ''}">${page}</a></li>
						</c:forEach>

						<li class="page_nation_item"><a
							href="?page=${pager.next}${pager.query}" class="page-link">다음</a></li>
						<li class="page_nation_item"><a
							href="?page=${pager.last}${pager.query}" class="page-link">마지막</a></li>
					</ol>
				</td>
			</tr>
		</tfoot>
	</div>

	<div>
		<a href="add">글 등록</a> <a href="../">이전</a>
	</div>
</body>
</html>