<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

<title>만나다</title>
<link rel="stylesheet" href="/resources/css/view.css">
<script src="/resources/js/view.js"></script>

 
<script>
$(function() {
    $(".my-nav li").eq(0).click(function() {
       $(".my-nav li").css("text-decoration", "unset");
       $(".my-nav li").eq(0).css("text-decoration", "underline");
       $(".my-set").css("display", "none");
       $("#my-post").css("display", "unset");
    });

    $(".my-nav li").eq(1).click(function() {
       $(".my-nav li").css("text-decoration", "unset");
       $(".my-nav li").eq(1).css("text-decoration", "underline");
       $(".my-set").css("display", "none");
       $("#my-question").css("display", "unset");
    });
 });
</script>
<style>
#my-question{
	display: none;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<div class="container">
		<div class="title">${manager.nickname}의 페이지</div>
		<header class="profile-box">
			<div class="mg-button">
				<c:if test="${sessionScope.manager == null}">
					<a href="/login">정보변경</a>
					<a href="/login">비밀번호변경</a>
					<a href="/login">회원관리</a>
				</c:if>
				
				<c:if test="${sessionScope.manager != null}">
					<a href="../update/${sessionScope.manager.id}"><button type="button" class="update">정보변경</button></a>
					<a href="../password/${sessionScope.manager.id}"><button type="button" class="password">비밀번호변경</button></a>
					<a href="../../user/list"><button type="button" class="list">회원관리</button></a>
				</c:if>
			</div>			
		</header>
		
		<nav class="my-nav">
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">공지사항</li>
				<li class="tab-link" data-tab="tab-2">Q n A</li>
			</ul>
				
			<div id="tab-1" class="tab-content current">
				<div class="tabcontent">
					<div class="my-set" id="my-post">
						<table border="1" class="table table-hover table_table" id="table_size">
							<thead>
								<tr class="table_menu_2">
									<th>No</th>
									<th>공지</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${myNotice.size() < 1}">
									<tr>
										<td colspan="5">등록 된 게시글이 없습니다.</td>
									</tr>
								</c:if> 
								<c:forEach var="item" items="${myNotice}"> 
									<tr>
				 						<td>${item.id}</td>
										<td><a href="/notice/detail/${item.id}">${item.title}</a></td>
										<td>${item.nickname}</td>
										<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd" /></td>
										<td>${item.viewCnt}</td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot> 
								<tr>
									<td colspan="5">
										<ol class="pagination pagination-sm justify-content-center"
											style="margin-bottom: 5%; margin-top: 5%;">
											<li class="page_nation_item"><a href="?page=1${pager.query}"
												class="page-link">처음</a></li>
											<li class="page_nation_item"><a
												href="?page=${pager.prev}${pager.query}" class="page-link">이전</a></li>
				
											<c:forEach var="page" items="${pager.list}">
												<li class="page_nation_item"><a
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
						</table>
					</div>
	      		</div>								
			</div>
			

			<div id="tab-2" class="tab-content">					
				<div>
					<table border="1" class="table table-hover table_table" id="table_size" id="my-question">
						<thead>
							<tr class="table_menu_2">
								<th>No</th>
								<th>질문</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>조회수</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
		                   	<c:if test="${myQnA.size() < 1}">
								<tr>
									<td colspan="5">등록 된 게시글이 없습니다.</td>
								</tr>
							</c:if>  
							<c:forEach var="item" items="${myQnA}">      	
			  					<tr>
									<td>${item.id}</td>
									<td><a href="/qna/detail/${item.id}">${item.title}</a></td>
									<td>${item.nickname}</td>
									<td><fmt:formatDate value="${item.regDate}" pattern="yyyy-MM-dd" /></td>
									<td>${item.viewCnt}</td>
									<td>${item.status_}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="5">
									<ol class="pagination pagination-sm justify-content-center"
										style="position: relative;left: 12%;margin-bottom: 5%; margin-top: 5%;">
										<li class="page_nation_item"><a href="?page=1${pager.query}"
											class="page-link">처음</a></li>
											<li class="page_nation_item"><a
											href="?page=${pager.prev}${pager.query}" class="page-link">이전</a></li>
				
										<c:forEach var="page" items="${pager.list}">
											<li class="page_nation_item"><a
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
					</table>
				</div>
			</div>
		</nav>
	</div>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>