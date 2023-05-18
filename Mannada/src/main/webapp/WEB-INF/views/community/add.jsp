<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>community_add</title>
<link rel="stylesheet" href="/resources/css/community_add.css">
<jsp:include page="../header.jsp"></jsp:include>
<!--jQuery 최신버전-->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- include summernote css/js -->
<link href="/resources/summernote/summernote-lite.css" rel="stylesheet">
<script src="/resources/summernote/summernote-lite.js"></script>
<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<script src="/resources/js/summernote.js"></script>
</head>
<body>
	<div class="banner">
		<ul class="banner_text">
			<li>커뮤니티</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>글쓰기</li>
		</ul>
		<h3 class="page_title">커뮤니티</h3>
		<p class="page_text">자유롭게 서로의 생각을 글로 표현 해주세요.</p>
	</div>
	<div class="container">
		<form method="post">
			<table class="box">
				<colgroup>
					<col width="10%" />
					<col width="35%" />
				</colgroup>

				<tbody>
					<tr style="border-bottom: 1px solid #ccc;">
						<th id="interval">제 목</th>
						<td class="title" >
						<select name="category" class="select">
								<option value="1">후기</option>
								<option value="2">소통</option>
						</select> 
						<input id="title" name="title" type="text">${item.id}</td>

					</tr>



					<tr>
						<th id="interval">본문내용</th>
						<td class="detail"><textarea id="summernote" name="content"
								placeholder="텍스트 내용을 입력해주세요"></textarea></td>
					</tr>
				</tbody>
			</table>
			<!-- 하단:lower -->
			<div class="lower">
				<button class="raise_btn">등록</button>
				<a href="list"><button type="button" class="cancel_btn">취소</button></a>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>