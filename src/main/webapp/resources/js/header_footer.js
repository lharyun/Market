  $("#notificationModal").on("click","#notifi_deleteBtn", function(e){
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

    $(".b_dong").addClass('d-none');
    $("#dong").addClass('d-none');

    if ($(this).val() == "강남구") {
        $("#gangnam").removeClass('d-none');
    } else if ($(this).val() == "강동구") {
        $("#gangdong").removeClass('d-none');
    } else if ($(this).val() == "강서구") {
        $("#gangseo").removeClass('d-none');
    } else if ($(this).val() == "강북구") {
        $("#gangbuk").removeClass('d-none');
    } else if ($(this).val() == "관악구") {
        $("#Gwanak").removeClass('d-none');
    } else if ($(this).val() == "광진구") {
        $("#Gwangjin").removeClass('d-none');
    } else if ($(this).val() == "구로구") {
        $("#Guro").removeClass('d-none');
    } else if ($(this).val() == "금천구") {
        $("#Geumcheon").removeClass('d-none');
    } else if ($(this).val() == "노원구") {
        $("#Nowon").removeClass('d-none');
    } else if ($(this).val() == "동대문구") {
        $("#Dongdaemun").removeClass('d-none');
    } else if ($(this).val() == "동작구") {
        $("#Dongjak").removeClass('d-none');
    } else if ($(this).val() == "마포구") {
        $("#Mapo").removeClass('d-none');
    } else if ($(this).val() == "서대문구") {
        $("#Seodaemun").removeClass('d-none');
    } else if ($(this).val() == "송파구") {
        $("#Songpa").removeClass('d-none');
    } else if ($(this).val() == "영등포구") {
        $("#Yeongdeungpo").removeClass('d-none');
    } else if ($(this).val() == "용산구") {
        $("#Yongsan").removeClass('d-none');
    } else if ($(this).val() == "은평구") {
        $("#Eunpyeong").removeClass('d-none');
    } else if ($(this).val() == "종로구") {
        $("#Jongno").removeClass('d-none');
    } else if ($(this).val() == "지역을 선택하세요") {
        $("#dong").removeClass('d-none');
        return
    }
    $("#roadAddrInput").val($(this).val());
    document.getElementById("districeForm").submit();
})

//동네카테고리
$(".a_dong").change(function () {
    console.log($(this).val());
    $("#extraAddrInput").val($(this).val());
    document.getElementById("districeForm").submit();
})

