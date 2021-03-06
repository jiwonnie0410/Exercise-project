<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>challengeContents.jsp</title>

<!-- 로그인한사람의 id,닉네임,캐릭터코드 저장 -->
<sec:authentication property="principal.username" var="id"/>
<sec:authentication property="principal.m_nick" var="nick"/>
<sec:authentication property="principal.m_image_cd" var="image"/>
		
<!-- 수림 개인 js/css -->
<script src="${pageContext.request.contextPath }/resources/js/surim/default.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/css/surim/default.css">

<script>
//아작스용
$(function(){
	insertChallenge(); // 참가하기 버튼 클릭시; 기본챌린지->참가완료, 스페셜챌린지-> 결제하기 창으로 이동
	
	function insertChallenge(){
		//기본챌린지 참가버튼
	    $("#basic-btn").click(function(){
	    	if ( $(this).attr('class')!='join-btn start-challenge' ) {
	    		$("#basicModal").modal(); //기본챌린지용 모달 팝업
	    	}
	    });
		
		// 기본챌린지 모달에서 "join"버튼 클릭 -> 챌린지 참가완료 
	    $("#basic-join-add").click(function(){
	    	$("#basic-btn").toggleClass('start-challenge');
		    $("#basic-btn").hasClass('start-challenge') ?
			  $("#basic-btn").text('참가중') :
			  $("#basic-btn").text('참가하기'); //모달의 "join"버튼 클릭시 페이지상 참가버튼이 참가중으로 변경
	    	
			// 아작스 시작; ChallengeHist 테이블에 참가이력 추가
	    	var param = JSON.stringify($("#frm").serializeObject());; //디비에 넣을값; 해당 챌린지정보
	    	console.log(param + "sdfsd");
	    	
	    	$.ajax({
	    		url: "ajax/insertChallenge.json",
	    		method: "post",
	    		dataType: "json",
	    		data: param,
	    		contentType: "application/json"
	    	});
	    });
	
	    //스페셜 챌린지 참가버튼
	    $("#special-btn").click(function(){
	    	if ( $(this).attr('class')!='join-btn start-challenge' ) {
	       		 $("#specialModal").modal();	// 스페셜챌린지 모달팝업
	       }
	    });
		
	    // 스페셜챌린지 모달에서 "join"클릭 -> 결제페이지로 이동
	    $("#special-join-add").click(function(){
	    	$("#special-btn").toggleClass('start-challenge');
	
			$("#special-btn").hasClass('start-challenge') ?
				$("#special-btn").text('참가중') :
				$("#special-btn").text('참가하기'); //모달의 "join"버튼 클릭시 페이지상 참가버튼이 참가중으로 변경
	    });	
	};
});

</script>

<style>

.container {
	max-width: 500px;
}

.image-div {
	position : relative;
}

.sports-div img {
	border-radius: 10px;
	height: auto;
}

.join-mark {
	position: absolute;
    top: 5%;
    right: 5%;
}

.start-challenge {
	background: #59b6a3;
}


</style>

</head>    
<body>
 		<!-- 뒤로가기 버튼 --> 
<!-- 	<div class="back-div">   -->
<!-- 		<input type="button" class="back-btn" id="back-btn"> -->
<!-- 		<h3 style="font-weight: bold">챌린지</h3> -->
<!-- 	</div> -->
	<div class="container">
		<div class="row">
			<div class="col">
				<div class="content-div">
					<!-- 챌린지 기본옵션 시작 -->
					<div class="image-div">
						<div class="sports-div">
							<img src="${pageContext.request.contextPath }/resources/images/sports/${challenge.sports1_cd }.jpg" width="100%" height="200px"> 
						</div>
							<!-- 유저가 참가중인 챌린지는 참여중 마크 띄움 -->
	              			<c:if test="${challenge.cl_num == myHistory.cl_num }">
		              			<div class="join-mark">
									<img src="${pageContext.request.contextPath }/resources/images/icon/join.png">
		              			</div>
	              			</c:if>         
							<!-- 유저 참가중 마크 끝 -->
					</div>
					<span class="pinkText">
						<fmt:formatDate value="${challenge.cl_start_dttm }" type="date" /> ~ 
						<fmt:formatDate value="${challenge.cl_end_dttm }" type="date" />
					</span>
						
					<span class="mediumText">${challenge.cl_name }</span> 
					<span class="mediumText">기간내 | ${challenge.cl_cnt }회 참여
					
						<!-- 태그 시작 -->
						<a class="tags">
							<!-- D-day 태그 -->
							<input class="dDay-tag" value="D-${challenge.gap_day }">
							<!-- 참가중 태그 -->
	              			<c:if test="${challenge.cl_num == myHistory.cl_num }">
									<input class="join-tag" value="참가중">
							</c:if>
						</a>
						<!-- 태그 끝 -->
					
					</span> 
					<br>
					<!-- 점수/보증금 설명 -->
					<span style="display: flex; color: grey; font-weight: bold; ">
						<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px"> 
						성공시 점수 <span class="pinkBold">&nbsp;${challenge.cl_score }점!</span> 
					</span>
					<span class="mediumText">획득시 회원레벨과 랭킹에 반영됩니다</span>
						
					<c:if test="${challenge.cl_status != 'basic' }">
					<br>
					<span style="display: flex; color: grey; font-weight: bold; ">
						<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">
						보증금 &nbsp;
						<span class="pinkBold">1천원~5천원</span>
					</span>
					<span class="mediumText">
						스페셜챌린지에 참가하여 더 높은 점수를 획득하세요!
					</span>
					<span class="mediumText">
						성공시 보증금은 전액환불됩니다
					</span>
					</c:if>
					<!-- 보증금설명/포인트 설명 끝 -->
					<!-- 챌린지 기본옵션 끝 -->
					<hr>
					<!-- 챌린지 세부설명 -->
					<span>${challenge.cl_content}</span>

					
					<!-- 기본/스페셜챌린지버튼 시작 -->
						<!-- 계정 상태가 활동중인 사람들만 버튼 보임 -->
						<sec:authentication property='principal.m_status_cd' var='mStatus'/> <!-- 변수에 이 회원의 계정상태 대입 -->
						<c:if test="${mStatus == 'M01'}"> <!-- 계정상태가 활동중이라면 아래의 버튼 띄움 -->
								<c:if test="${challenge.cl_num == myHistory.cl_num}">
									<button class="join-btn start-challenge">참가중</button>
								</c:if>
								<!-- 챌린지 참가용 버튼 시작 -->
								<c:if test="${challenge.cl_num != myHistory.cl_num}">
									<c:choose>
										<c:when test="${challenge.cl_status == 'basic' }">
											<button class="join-btn" id="basic-btn">참가하기</button>
										</c:when>
										<c:when test="${challenge.cl_status == 'special' }">
											<button class="join-btn" id="special-btn">참가하기</button>
										</c:when>
									</c:choose>
								</c:if>
								<!--챌린지 참가용 버튼 끝  -->
						</c:if> <!-- 활동 상태 체크 끝 -->
					<!-- 기본/스페셜챌린지버튼 끝 -->
				</div>
			</div>   
		</div>
	</div>
	
	<!-- 기본챌린지용 모달 -->
		<div class="modal fade" id="basicModal" role="dialog">
			<div class="modal-dialog">
		
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">${challenge.cl_name }</h5>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<span class="pinkText"> 
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px"> ${challenge.cl_score }점
						</span>
						<br>
						<span class="mediumText">기본챌린지에 참여하시겠습니까?</span>
						<span class="mediumText">참가시 취소가 되지 않습니다</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="pink-btn"
							data-dismiss="modal" id="basic-join-add">Join</button>
						<button type="button" class="white-btn" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 스페셜챌린지용 모달 -->
		<div class="modal fade" id="specialModal" role="dialog">
			<div class="modal-dialog">
		
				<!-- Modal content-->   
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">${challenge.cl_name }</h5>
						<button type="button" class="close" data-dismiss="modal">×</button>
					</div>
					<div class="modal-body">
						<span class="pinkText">    
							<img src="${pageContext.request.contextPath }/resources/images/icon/heart.png" width="25px">
							${challenge.cl_score }점
							<img src="${pageContext.request.contextPath }/resources/images/icon/money.png" width="25px">
							보증금필요
						</span>
						<br>
						<span class="mediumText">스페셜챌린지에 참여하시겠습니까?</span>
						<span class="mediumText">참가시 소정의 보증금이 필요하며, </span>
						<span class="mediumText">결제후 취소가 되지 않습니다</span>
					</div>
					<div class="modal-footer">
						<button type="button" class="pink-btn"
							data-dismiss="modal" id="special-join-add"
							onclick="location.href='payment?num=${challenge.cl_num}'">Join</button>
						<button type="button" class="white-btn" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<form id="frm">
			<input name="cl_num" type="hidden" value="${challenge.cl_num }">
			<input name="m_id" type="hidden" value=${id }>
		</form>
		
</body>
</html>