<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- Modal 읽기-->
<!-- 게시물 상세보기 영역 -->
<div class="panel-group">
	<div class="panel panel-success" style="margin-top: 10px;">
		<div class="panel-body">
			<%-- form --%>
			<form id="frm" method="GET">
				<!-- 게시물번호를 hidden으로 처리 -->
				<input type="hidden" name="qb_id" value="${dto.qb_id}">
				<div class="form-group">
					<div>
						<!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
						작성일자 :
						<fmt:formatDate value="${dto.qb_date}" pattern="yyyy-MM-dd" />
						<!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
					</div>
				</div>
				<div class="form-group">
						<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">질문 유형</label>&nbsp;&nbsp;
					<div id="qb_title">
						${dto.qb_title}
					</div>
				</div>
				<div class="form-group">
						<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">내용</label>&nbsp;&nbsp;
					<div id = "qb_content">
						${dto.qb_content}
					</div>
				</div>		
				<div class="form-group">
					<div  id="qb_an">
						<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">답변</label>&nbsp;&nbsp;
						<span id="qb_an_id" style="display: none;">${dto.qb_an_id}</span>
						${dto.qb_an}					
					</div>
				</div>
				<div style="width: 650px; text-align: center;">
					<!-- 게시물번호를 hidden으로 처리 -->
					<input type="hidden" name="qb_id" id="qb_id" value="${dto.qb_id}">
						
						<!-- 상세보기 화면에서 게시글 목록화면으로 이동 -->
					<!-- 	<button type="button" class="btn btn-primary px-5 py-3  mt-3" id="btnList">목록</button> -->
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	$("#btnUpdete").click(function() {
		$('#Modalread').modal('hide')
		$('#ad_boardWriteForm [name="qb_id"]').val($('#frm #qb_id').val());
		$('#ad_boardWriteForm [name="qb_content"]').val($('#frm #qb_content').html());
		$('#ad_boardWriteForm [name="qb_title"]').val($('#frm #qb_title').html());
		$('#myModal').modal('show')
	});

</script>

