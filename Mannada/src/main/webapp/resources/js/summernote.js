
	// window.onload = 
    $(document).ready(function() {
        //여기 아래 부분
        $('#summernote').summernote({
            'width': '90%',
              height: 300,              // 에디터 높이
              minHeight: null,             // 최소 높이
              maxHeight: null,             // 최대 높이
              focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
              lang: "ko-KR",					// 한글 설정
              placeholder: '내용을 입력해주세요.'	//placeholder 설정
              
        });
    });