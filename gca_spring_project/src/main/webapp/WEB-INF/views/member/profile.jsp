<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<!-- 반응형 -->
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">
		<meta name="author" content="">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- FONT AWESOME 아이콘 가져오기 -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
		
		<!-- security에서 캐릭터 이미지 가져오기 -->
		<sec:authentication property="principal.m_image_cd" var="image" />
		
		<script>
			// 비밀번호 변경 후 확인 메시지 띄우기
			if('${pwMessage}' != ''){
				alert('${pwMessage}');
			}
		</script>
		
		<style>
				.div-frame {
						background-image:url("${pageContext.request.contextPath }/resources/images/Characters/frame.png"); 
					    height: 140px;
					    width: 120px;
				}
				
				.div-info {
						background: #FFE08C;
					    border: 2px solid #FFE08C;
					    border-radius: 7px;
					    font-size: 12px;
					    font-weight: bolder;
					    margin: 0.3em auto;
					    padding: 2px 4px;
					    position: relative;
					    height: 30px;
					    width: 300px;
				}
				
				.div-button {
						background: #BDBDBD;
					    border: 2px solid #BDBDBD;
					    border-radius: 7px;
					    font-size: 12px;
					    font-weight: bolder;
					    margin: 0.3em auto;
					    padding: 2px 4px;
					    height: 30px;
					    width: 130px;
				}
				#button-button:active {
						color: white;
						cursor: point;
				}
				#button-button {
						font-size: 20px;
						cursor: pointer;
				}
				#button-message {
						color: gray;
						font-size: 24px;
						cursor: pointer;
				}
				#button-message:active {
						color: #4374D9;
				}
		</style>
</head>
<body>
	<div>
		<div class="col-50">
			<div class="card">
				<div class="card-header" style="background-color: #FEBABA;"> <b>${dto.m_name }</b> 님의 정보 </div>
				<div class="card-body">
				
					<!-- 알림, 알림설정, 사용자 캐릭터, 레벨, 랭킹보기, 환경설정 -->
					<div align="center">
					<table>
						<tr>
							<!-- 사용자 캐릭터 표시 -->
							<td rowspan="3" height="70"><div class="div-frame" align="center">	<p /><p />&nbsp;<p />
									<img style="padding-bottom:5px;" width="65px" height="65px"src="${pageContext.request.contextPath }/resources/images/Characters/${dto.m_image_cd}.gif">				
								</div></td>
								<td></td>
						</tr>
						<tr>
							<!-- 랭킹보기 링크 -->	
							<td><img style="padding-bottom:5px;" width="30px" height="30px"src="${pageContext.request.contextPath }/resources/images/level/${dto.m_level_cd}.png">
							<a href="${pageContext.request.contextPath }/history/rank"><font size="2"><b> 나의 랭킹 보기> </b></font></a></td>
						</tr>
						<tr>
						<td align="right" width="170">
								<!-- 알림 쪽지 보기 버튼 -->
								<span onclick="location.href='${pageContext.request.contextPath }/member/alert'"><i id="button-message" class="fas fa-comment"></i></span>&nbsp;&nbsp;
								<!-- 설정 버튼 -->
								<span onclick="location.href='${pageContext.request.contextPath }/member/option'"><i id="button-message" class="fas fa-bell"></i></span>&nbsp;&nbsp;
								<!-- 환경설정 버튼 -->
								<span onclick="location.href='${pageContext.request.contextPath }/member/updateform'"><i id="button-message" class="fas fa-user-edit"></i></span></td>
						</tr>
					</table>
					</div>
					
					<!-- 사용자 기본 정보 -->
					<div>	
						<div class="div-info" align="left">
								&nbsp;&nbsp;<font color="gray">아이디 |</font>&nbsp;&nbsp;&nbsp;${dto.m_id} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								&nbsp;&nbsp;<font color="gray">닉네임 |</font>&nbsp;&nbsp;&nbsp;${dto.m_nick}
						</div>
						<div class="div-info" align="left">
								&nbsp;&nbsp;<font color="gray">이메일 |</font>&nbsp;&nbsp;&nbsp;${dto.m_email}
						</div>
						<div class="div-info" align="left">
								&nbsp;&nbsp;<font color="gray">현주소 |</font>&nbsp;&nbsp;&nbsp;${dto.m_location}
						</div>
						<div class="div-info" style="background:#B2CCFF; border:#B2CCFF;" align="left">
								&nbsp;&nbsp;<font color="gray">포인트 |</font>&nbsp;&nbsp;&nbsp;${score} 점 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<span onclick="location.href='${pageContext.request.contextPath }/history/score'"> 확인하러 가기 <i id="button-button" class="fas fa-coins"></i></span>
						</div>
					</div>
					<br /><br />
					
					<!-- 각종 페이지로 넘어가는 버튼 -->
					<!-- 비밀번호 변경 -->
					<div class="div-button" align="left" style="position:relative; left:80px;">
						비밀번호 변경 &nbsp;&nbsp;&nbsp;&nbsp;
						<span onclick="location.href='${pageContext.request.contextPath }/member/changePassword'"><i id="button-button" class="fas fa-key"></i></span>
					</div>
					<!-- 로그아웃 -->
					<div class="div-button" align="left" style="position:relative; left:80px;">
						로그아웃 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span onclick="location.href='${pageContext.request.contextPath }/logout'"><i id="button-button" class="fas fa-sign-out-alt"></i></span>
					</div>
					
							<div style="color: red;">${message}</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>