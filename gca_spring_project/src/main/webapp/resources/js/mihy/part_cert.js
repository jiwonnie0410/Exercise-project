function getLocation(){ //참가 인증 스크립트 
	//chorm 50부터 https와 같은 보안 컨텍스트에서만 작동
    //exlorer9.0, firefox3.5, safiri5.0, opera16.0 이상 작동

	Notiflix.Report.Init({
		svgSize:'80px',
		plainText:'false'		
	});
	
	Notiflix.Confirm.Show( '참여 인증', '참여 인증을 하시겠습니까?', '확인', '취소'
		, function(){ // Yes button callback
			if (navigator.geolocation) {
				//getCurrentPosition(): 사용자의 위치를 반환
				navigator.geolocation.getCurrentPosition(showPosition, showError);
				//성공하면 매개 변수(showPosition)에 지정된 함수에 좌표 오브젝트를 리턴
				//실패하면 두 번째 매개 변수(showError)로 오류 처리
			} else {
				Notiflix.Report.Failure( 'ㅤㅤㅤㅤ', '이 브라우저에서는 GPS를 사용하실 수 없습니다.', '확인' );
				return false;
			}
		}
		, function(){ // No button callback
			return false;
		}
	);
}

//위도와 경도를 출력
function showPosition(position) {
	var sg_num_search = $('#sg_num_search').val();
	var form = { 
		cert_x: position.coords.latitude,
		cert_y: position.coords.longitude,
		sg_num: sg_num_search
	}
	$.ajax({
		url: "sgCert",
		method: "POST",
		dataType: "json",
		data: form,
		success: function(result){
			if(result.msg == "success"){
				Notiflix.Report.Success( 'ㅤㅤㅤㅤ', '참여 인증이 완료되었습니다. 즐겁게 운동하시고 건강한 하루 보내세요!', '확인' ); 
				$('#btn_cert').text("참여 인증 완료");
			} else if(result.msg == "nobody in this room"){
				 Notiflix.Report.Warning( 'ㅤㅤㅤㅤ', '해당 방에 참여한 사람이 없습니다. 다시 확인해 주세요.', '확인' ); 
			} else if(result.msg == "already"){
				Notiflix.Report.Warning( 'ㅤㅤㅤㅤ', '이미 인증되어 있습니다.', '확인' ); 
			} else if(result.msg == "badtime"){
				Notiflix.Report.Warning( 'ㅤㅤㅤㅤ', '마감 시간 전후 30분 이내에 참여 인증을 해주세요.', '확인' ); 
			} else {
				Notiflix.Report.Warning( 'ㅤㅤㅤㅤ', '모임 지점에서 거리가 멀어(' + result.msg + 'km) 참여 인증을 할 수 없습니다. 더 가까운 위치에서 인증해 주세요.', '확인' ); 
			}
		}
	});
}

//사용자의 위치를 얻지 못하면 실행
function showError(error) {
	switch(error.code) {
		case error.PERMISSION_DENIED:
			Notiflix.Report.Failure( 'ㅤㅤㅤㅤ', '사용자가 위치 정보에 대한 요청을 거절하여 확인할 수 없습니다.', '확인' )
				break;
		case error.POSITION_UNAVAILABLE:
			Notiflix.Report.Failure( 'ㅤㅤㅤㅤ', '위치 정보를 사용할 수 없습니다. GPS를 연결해 주세요.', '확인' )
				break;
		case error.TIMEOUT:
			Notiflix.Report.Failure( 'ㅤㅤㅤㅤ', '사용자 위치를 가져오기 위한 요청이 시간 초과되었습니다. 다시 시도해 주세요.', '확인' )
				break;
		case error.UNKNOWN_ERROR:
			Notiflix.Report.Failure( 'ㅤㅤㅤㅤ', '알 수 없는 오류가 발생했습니다. 계속 오류가 발생하면 관리자에게 문의해 주세요.', '확인' )
				break;
	}
}