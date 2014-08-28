<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- spEL을 활용한 리소스 버전 관리 -->
<spring:eval expression="@baseConfig['app.version']" var="applicationVersion" />
<spring:url value="/static-{applicationVersion}" var="resourceUrl">
	<spring:param name="applicationVersion" value="${applicationVersion}" />
</spring:url>

<!--external css-->
<link href="${resourceUrl}/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="${resourceUrl}/assets/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css" href="${resourceUrl}/assets/js/gritter/css/jquery.gritter.css" />
<link rel="stylesheet" type="text/css" href="${resourceUrl}/assets/lineicons/style.css">

<!-- Custom styles for this template -->
<link href="${resourceUrl}/assets/css/style.css" rel="stylesheet">
<link href="${resourceUrl}/assets/css/style-responsive.css" rel="stylesheet">

<input id="current-accordion" type="hidden" value="board,notice" />

<!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
		<h3>
			<i class="fa fa-angle-right"></i> 공지사항
		</h3>
		<div class="row">
			<div class="col-md-12 mt">
				<div class="form-panel">
					<form id="qnaForm" action="${pageContext.request.contextPath}/management/answerWrite" class="form-horizontal style-form" method="post">
						<%-- <div class="page-header">
							<h3>
								<small>공지사항 내용</small>
							</h3>
						</div> --%>
						<div class="form-group">
							<label class="col-sm-2 control-label"><i
								class="fa fa-check fa-lg"></i> 제목</label>
							<div class="col-sm-10">
								<input type="hidden" name="state_code" value="${qna.state_code}">
								<input type="hidden" name="group_no" value="${qna.group_no}">
								<input type="hidden" name="pageSize" value="${qna.pageSize}">
								<input type="hidden" name="pageNum" value="${qna.pageNum}">
								<input type="hidden" name="searchKey" value="${qna.searchKey}">
								<input type="hidden" name="searchType" value="${qna.searchType}">
								<input type="text" class="form-control" id="title"
									name="title" value="${qna.title}">
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-2 control-label"><i
								class="fa fa-check fa-lg"></i> 내용</label>
							<div class="col-sm-10">
								<!-- <textarea id="content" name="content"></textarea> -->
								<textarea rows="10" cols="5" class="form-control" name="content">${qna.content}</textarea>
							</div>
						</div>
						
						<div class="btn-group submitBtn">
							<button id="WriteBtn"
								class="btn btn-large btn-block btn-primary joinbtn"
								type="button">답변 올리기</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- row -->
	</section>
</section>

<!--main content end-->


<!-- inclue common script -->
<%@ include file="commonScript.jsp"%>

<!--script for this page-->
<script src="${resourceUrl}/ckeditor/ckeditor.js"></script>


<!-- JavaScript jQuery code from Bootply.com editor  -->
<script type="text/javascript">
$(document).ready(function(){		
	var ckeditor;
	
	//CKEDITOR를 textarea의 name값: 'content'랑 교체
	CKEDITOR.replace( 'content', {
		skin : 'bootstrapck',
		enterMode: '2',
		shiftEnterMode:'3',
		
		//filebrowserBrowseUrl : "${resourceUrl}",
		filebrowserUploadUrl : '${pageContext.request.contextPath}/qnaUpload?command=QuickUpload&type=File',
        filebrowserImageUploadUrl : '${pageContext.request.contextPath}/qnaUpload?command=QuickUpload&type=Images' 
	});
	ckeditor = CKEDITOR.instances['content'];

	// 페이지 이탈시 작동
	var beforeUnload = 1;
	$(window).on('beforeunload',function() {
		if (beforeUnload) return "저장하지 않고 페이지를 벗어나려 합니다.\n작성중인 내용은 저장되지 않습니다.";
	});

	// BackSpace 키 방지 이벤트
	$(document).keydown(function(e) {
		if (e.target.nodeName != "INPUT"
				&& e.target.nodeName != "TEXTAREA") {
			if (e.keyCode === 8) {
				e.preventDefault();
				return false;
			}
		}
	});

	
	$('#WriteBtn').on('click', function() {
		$('#qnaForm').submit();
	});

	$('#qnaForm').submit(function() {
		if ($('#title').val() == "") {
			alert("제목을 입력하세요");
			$('#title').focus();
			return false;
		}else if($('#title').val().length>50){
			alert("제목은 50자 이하로 입력해주세요");
			$('#title').focus();
			return false;
		}
						
		if (ckeditor.getData()=="") {
			alert("글 내용을 입력하세요");
			ckeditor.focus();
			return false;
		}else if(ckeditor.getData().length>=20000){
			alert("20000자 이하로 입력해주세요");
			ckeditor.focus();
			return false;
		}
		
		
		$(window).off('beforeunload');
		$('#WriteBtn').off('click');
		$("#WriteBtn").attr("disabled", true);
		$('#WriteBtn').text('처리중');
		$('#lodingModal').modal({
			backdrop : false,
			keyboard : false
		});
	});
});
</script>

