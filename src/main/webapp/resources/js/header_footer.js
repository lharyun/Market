 // 로그인/회원가입 a 태그 id값 : linkLogin
       function preventClick(){ 
          
          var popupX = (window.screen.width / 2) - (800 / 2);
            var popupY= (window.screen.height / 2) - (600 / 2);
            
            window.open('/member/toLogin', '로그인', 'status=no, height=600, width=800, left='+ popupX + ', top='+ popupY);
       }
       
  $("#notificationModal").on("click","#notifi_deleteBtn", function(e){//알림창 삭제
                console.log(e.target.value);
                let notification_seq = e.target.value;
                $(this).parent().parent().remove();
                $.ajax({
    		url: "/notification/notifi_delete"
    		, type: "get"
    		, data: {notification_seq : notification_seq}
    		, success: function(data){
    			if(data == "success"){
    			
    			}else if(data == "fail"){
    				alert("삭제 실패했습니다.");
    			}
    		}, error: function(e){
    			console.log(e);
    		}
    	    }) 
            })

$('#SearchForm').on('keypress', function (e) { // 인풋창 클릭후 엔터누르면 실행
    if (e.keyCode == '13') {
        if ($("#titleSearch").val() !== "") {//검색창이 널값이 아니라면
            document.getElementById("SearchForm").submit();
        }
    }
});
// 게시글 검색
$("#searchIcon").on("click", function () {
    if ($("#titleSearch").val() == "") { //검색창이 널값이라면
        alert("물품을 입력해주세요!")
    } else if ($("#titleSearch").val() != "") {//검색창이 널값이 아니라면
        document.getElementById("SearchForm").submit();
    }
})
$("#searchIcon2").on("click", function () {
    if ($("#titleSearch2").val() == "") { //검색창이 널값이라면
        alert("물품을 입력해주세요!")
    } else if ($("#titleSearch2").val() != "") {//검색창이 널값이 아니라면
        document.getElementById("SearchForm2").submit();
    }
})

//즐겨찾기 버튼
$(".bookmark").on("click", function () {
    alert(" Ctrl+D 키를 누르면 즐겨찾기에 추가하실 수 있습니다.")
})

//지역카테고리
$("#district").change(function () {
	
    console.log($(this).val());
    if($(this).val() == "지역을 선택하세요"){
	$(this).val("");
	$("#roadAddrInput").val($(this).val());
}else{
	$("#roadAddrInput").val($(this).val());
}
    console.log($(this).val());
    document.getElementById("districeForm").submit();
})

$(function() {// 로딩될때
	let test1 = $("#testSearch").val();
	if (test1 !== "") {
		console.log("no");
		$(".b_dong").addClass('d-none');
		$("#dong").addClass('d-none');

		if (test1 == "강남구") {
			$("#gangnam").removeClass('d-none');
		} else if (test1 == "강동구") {
			$("#gangdong").removeClass('d-none');
		} else if (test1 == "강서구") {
			$("#gangseo").removeClass('d-none');
		} else if (test1 == "강북구") {
			$("#gangbuk").removeClass('d-none');
		} else if (test1 == "관악구") {
			$("#Gwanak").removeClass('d-none');
		} else if (test1 == "광진구") {
			$("#Gwangjin").removeClass('d-none');
		} else if (test1 == "구로구") {
			$("#Guro").removeClass('d-none');
		} else if (test1 == "금천구") {
			$("#Geumcheon").removeClass('d-none');
		} else if (test1 == "노원구") {
			$("#Nowon").removeClass('d-none');
		} else if (test1 == "동대문구") {
			$("#Dongdaemun").removeClass('d-none');
		} else if (test1 == "동작구") {
			$("#Dongjak").removeClass('d-none');
		} else if (test1 == "마포구") {
			$("#Mapo").removeClass('d-none');
		} else if (test1 == "서대문구") {
			$("#Seodaemun").removeClass('d-none');
		} else if (test1 == "송파구") {
			$("#Songpa").removeClass('d-none');
		} else if (test1 == "영등포구") {
			$("#Yeongdeungpo").removeClass('d-none');
		} else if (test1 == "용산구") {
			$("#Yongsan").removeClass('d-none');
		} else if (test1 == "은평구") {
			$("#Eunpyeong").removeClass('d-none');
		} else if (test1 == "종로구") {
			$("#Jongno").removeClass('d-none');
		} else if (test1 == "지역을 선택하세요") {
			$("#dong").removeClass('d-none');
			return
		}
	} else {
		console.log("yes");
	}
    
}); 

//동네카테고리
$(".a_dong").change(function () {
	let test = $("#testSearch").val();
    console.log(test);
    console.log($(this).val());
    $("#roadAddrInput").val(test +" "+ $(this).val()+"동");
    document.getElementById("districeForm").submit();
})

