<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>


<header class="masthead">
  <div class="container">
    <div class="row">
      <div class="col-xs-6">
        <h1><a href="#" title="Scroll down for your viewing pleasure">My Page</a>
          <p class="lead">${sessionScope.member.name}님의 마이페이지</p></h1>
      </div>
      <div class="col-xs-6">
        <div class="pull-right headerImg">
          <img src="data:image/png;base64,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">        
        </div>
      </div>
    </div>
  </div>
</header>

<!-- Begin Body -->
<div class="container">
	<div class="no-gutter row">
		
		<!-- left side column -->
		<%@ include file="inc/mypageAside.jsp" %>
		<!-- END/left side column -->


		<!-- right content column-->
		<div class="col-md-10" id="content">
			<div class="panel">
				<div class="panel-heading"
					style="background-color: #111; color: #fff;">회원탈퇴</div>
				<div class="panel-body">

					<div class="row content" id="step1">
						<div class="col-sm-12 col-md-4 col-md-offset-1 delete_img">
							<img src="${pageContext.request.contextPath}/images/user-delete.svg"/>
						</div>
						<div class="col-sm-8 col-sm-offset-2 col-md-5 col-md-offset-1 email_text">
							<form id="deleteMemberForm" class="form-horizontal style-form" action="${pageContext.request.contextPath}/memberDeleteProcess" method="post">
							<div class="textbox">
								<h2 class="title">
									회원탈퇴
								</h2>
								<h5><a>${sessionScope.member.name}</a>님, 정말로 탈퇴하시나요?
								</h5>
								<label class="passwordLabel control-label">패스워드</label>
								<input type="password" class="form-control" id="password" name="password">
								<c:if test="${result=='notmatch'}">
									<strong>비밀번호</strong>가 맞지 않습니다.
								</c:if>
								<div class="btn-group mypageBtn">
									<button id="deleteBtn" class="btn btn-large btn-block btn-danger joinbtn" type="button">탈퇴하기</button>
								</div>
							</div>
							</form>
						</div>
					</div>
					
					<hr style="display:block;clear:both;">

				</div>
				<!--/panel-body-->
			</div>
			<!--/panel-->
			<!--/end right column-->
		</div>
	</div>
</div>

<!-- script references -->
<script src="${pageContext.request.contextPath}/resources/gazONojfL3/js/jquery.1.9.1.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/gazONojfL3/js/bootstrap.3.2.0.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/gazONojfL3/js/scripts.js"></script>

<!-- JavaScript jQuery code from Bootply.com editor  -->

<script type="text/javascript">
	$(document).ready(function() {
		
		$('#sidebar').affix({
			offset : {
				top : 230,
				bottom : 100
			}
		});
		$('#deleteBtn').on('click',function(){
			$('#deleteMemberForm').submit();
		});
		var regexpVeryLow = /^.*(?=.{7,20}).*$/;
		$('#deleteMemberForm').submit(function(){
			if($('#password').val() == ""){
                alert("패스워드 입력하세요");
                $('#password').focus();
                return false;
           }else if(!regexpVeryLow.test($('#password').val())) {   
               alert("패스워드는 7~20자 입니다.");
               $('#password').focus();
               return false;
           }
		});
	});
</script>

