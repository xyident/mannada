<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="header.jsp"></jsp:include>
<title>만나다</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link rel="stylesheet" href="/resources/css/signup_ok.css">
<link rel="stylesheet" href="/resources/image/swiper1.jpg"/>

</head>
<body>
<div class="banner">
		<ul class="banner_text">
			<li>HOME</li>
			<i class="bi bi-caret-right-fill"></i>
			<li>회원가입</li>
			
		</ul>
	</div>
	
<div class="background-image">
</div>
	<div class="signup-box">
        <div class="signup_ok">
        <div>
          <img src="/resources/image/checkmark_logo.png" alt="">
        </div>
          <br>                
          회원가입 완료
      </div>
      <br>
      <div class="signup_detail">
        {닉네임}님(아이디)의 회원가입이<br>
           성공적으로 완료되었습니다.            
      </div>
      <br>
      <div class="signup_edit">
        <p>*회원가입 확인 및 수정은 <span style="color: red;">마이페이지 > 회원정보변경</span>에서 가능합니다.</p>
      </div>
      <br>
      <div class="line">
        <hr>
      </div>

		<a href="/"><button class="home_btn">홈으로</button></a>

		<a href="/login"><button class="login_btn" style="float:right;">로그인바로하기</button></a>

    </div>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>