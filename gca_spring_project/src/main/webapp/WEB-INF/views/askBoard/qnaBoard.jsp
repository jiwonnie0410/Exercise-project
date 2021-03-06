<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="paging" tagdir="/WEB-INF/tags" %> <!-- 페이징을 위한 라이브러리 -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.table td {
	cursor: pointer;
}
</style>

<script>
	var m_id = "<sec:authentication property='principal.m_id'/>";
</script>

<!--데이터 테이블  -->
		<!-- Page level plugin CSS-->
		<link href="${pageContext.request.contextPath }/resources/css/admin/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
		<!-- Page level plugin JavaScript-->
		<script src="${pageContext.request.contextPath }/resources/css/admin/vendor/datatables/jquery.dataTables.js"></script>
		<script src="${pageContext.request.contextPath }/resources/css/admin/vendor/datatables/dataTables.bootstrap4.js"></script>
		<!-- Demo scripts for this page-->
		<script src="${pageContext.request.contextPath }/resources/js/admin/demo/datatables-demo.js"></script>
<sec:authentication property="principal.m_id" var="m_id" />
<script
	src="${pageContext.request.contextPath }/resources/js/board/user_Qna.js"></script>
<title>boardList_json.jsp</title>
</head>
<body>
		<nav class="fixed-top">
		<div align="center"  style="background-color: white;">
			<div align="center" class="mt-2 mb-2" style="background-color: white; " ><h4>문의</h4>
			</div>
		</div>
		</nav>
		<br><br>	


		<!------------------------------------------------------- 목록 시작 ----------------------------------->
		<!-- <h3>게시판 목록</h3> -->
		<table class="table text-center" id="userlisttb" >
			<thead>
				<tr>
					<!-- <th class="text-center">번호</th> -->
					<th>답변 여부</th>
					<th class="text-center">작성자</th>
					<th class="text-center">제목</th>
				</tr>
			</thead>
			<tbody id="asktb"></tbody>
		</table>
		<button id="write" class="btn " type="button" data-toggle="modal"
			data-target="#myModal"
			style="background-color: #FE9191; color: white;align-items: center;" >Write</button>
	</div>
	<!------------------------------------------------------- 목록  끝 ----------------------------------->


	<!----------------------------------게시판 작성  ------------------------------------------------------------>
	<!-- Modal content-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #FEBABA; color: white;">
					문의 사항 작성
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body">

					<div class="panel-group">
						<div class="panel panel-success">
							<div class="panel-body">
								<%-- form --%>
								<form role="form" action="../ajax/insertBoard" id="ad_boardWriteForm" name="ad_boardWriteForm">
									<input type="hidden" name="qb_id" value="">
									<div class="form-group">
										<div>
										<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;">질문 유형</label>
											<select name="qb_title" id="qb_title" class="btn btn-outline btn-sm dropdown-toggle">
												<option id="qn" selected value="질문 유형 선택" disabled>-질문 유형 선택-</option>
												<option  value="반짝방 문의">반짝방 문의</option>
												<option value="회원관리 문의">회원관리 문의</option>
												<option value="동호희 문의">동호희 문의</option>
											</select>
										</div>
									</div>
									<div class="form-group">
											<label  style="background-color: #FE9191; color: white;  border-radius: 10px; width:100px; text-align: center;" >내용</label>&nbsp;&nbsp;
										<div>
											<textarea cols="40" rows="10" name="qb_content" id="qb_content" placeholder="내용을 입력해주세요" style="border: 1px solid #FE9191;"></textarea>
										</div>
									</div>
									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-10">
											<button type="button" id="btnIns"
												style="background-color: #FE9191; color: white;" class="btn">저장</button>
											<button type="reset" class="btn" style="background-color: #FE9191; color: white;">초기화</button>
											<button type="button" class="btn btn-info " data-dismiss="modal" style="background-color: #FE9191; color: white;">Close</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- -------------------------------------게시물 상세보기 영역------------------------------  -->
	<!-- Modal 읽기-->
	<!-- 게시물 상세보기 영역 -->
	<div class="modal fade" id="Modalread" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #FEBABA; color: white;">
					문의게시판 읽기
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<!-- 본인이 쓴 게시물만 수정, 삭제가 가능하도록 처리 -->
					<button type="button" class="btn " id="btnDel" style="background-color: #FE9191; color: white;">삭제</button>
					<button type="button" class="btn" id="btnUpdete"  style="background-color: #FE9191; color: white;">수정</button>
					<button type="button" class="btn" data-dismiss="modal" style="background-color: #FE9191; color: white;">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>

</html>