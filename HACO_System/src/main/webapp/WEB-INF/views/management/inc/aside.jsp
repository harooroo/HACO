<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>


<!-- **********************************************************************************************************************************************************
      MAIN SIDEBAR MENU
      *********************************************************************************************************************************************************** -->
      <!--sidebar start-->
      <aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
              
              	  <p class="centered">
              	  	<a href="${pageContext.request.contextPath}/management/profile/${sessionScope.employee.account_id}">
              	  		<img src="${pageContext.request.contextPath}/employeePhoto/1173606.jpg" class="img-circle" width="80">
              	  	</a>
              	  </p>
              	  <h5 class="centered">${sessionScope.employee.name_eng}<br>(${sessionScope.employee.name_kor})</h5>

			  	    
              	  <!-- 센터장, 본점장만 -->	
				  <s:authorize ifAnyGranted="MASTER,CENTER">
				  <li class="mt sub-menu" name="employeeManagement">
                      <a href="javascript:;" >
                          <i class="fa fa-desktop"></i>
                          <span>직원관리</span>
                      </a>
                      <ul class="sub">
                          <li name="employeeRegister"><a  href="${pageContext.request.contextPath}/management/employeeRegister">직원등록</a></li>
                      </ul>
                  </li>
				  </s:authorize>
				  
				
                  <li class="sub-menu" name="attendance">
                      <a href="${pageContext.request.contextPath}/management/attendance">
                          <i class="fa fa-calendar"></i>
                          <span>출　　석</span>
                      </a>
                  </li>

                  <li class="sub-menu" name="course">
                      <a href="javascript:;" >
                          <i class="fa fa-cube"></i>
                          <span>과　　정</span>
                      </a>
                      <ul class="sub">
                          <li name="subjectRegister"><a  href="${pageContext.request.contextPath}/management/subjectRegister">과목등록</a></li>
                          <li name="courseRegister"><a  href="${pageContext.request.contextPath}/management/courseRegister">과정등록</a></li>
                          <li name="educationCenter"><a  href="${pageContext.request.contextPath}/management/educationCenter">교육센터</a></li>
                      </ul>
                  </li>
				
                  <li class="sub-menu" name="lectureRegister">
                      <a href="${pageContext.request.contextPath}/management/lectureRegister">
                          <i class="fa fa-envelope"></i>
                          <span>수강신청</span>
                      </a>
                  </li>
				
                  <li class="sub-menu" name="lectureEvaluation">
                      <a href="${pageContext.request.contextPath}/management/lectureEvaluation">
                          <i class="fa fa-tags"></i>
                          <span>수강후기</span>
                      </a>
                  </li>
                  
                  <li class="sub-menu" name="board">
                      <a href="javascript:;" >
                          <i class="fa fa-comments"></i>
                          <span>게시판</span>
                      </a>
                      <ul class="sub">
                          <li name="notice"><a  href="${pageContext.request.contextPath}/management/notice">공지사항</a></li>
                          <li name="qna"><a  href="${pageContext.request.contextPath}/management/qna">질문과답변</a></li>
                          <li name="community"><a  href="${pageContext.request.contextPath}/management/community">모임방</a></li>
                      </ul>
                  </li>
                  
                  <li class="sub-menu" name="member">
                      <a href="javascript:;" >
                          <i class="fa fa-graduation-cap"></i>
                          <span>원생</span>
                      </a>
                      <ul class="sub">
                          <li name="newMemberList"><a  href="${pageContext.request.contextPath}/management/newMemberList">신규 목록</a></li>
                          <li name="memberList"><a  href="${pageContext.request.contextPath}/management/memberList">원생 목록</a></li>
                          <li name="leaveMemberList"><a  href="${pageContext.request.contextPath}/management/leaveMemberList">퇴교 목록</a></li>
                      </ul>
                  </li>
                  
                  <li class="sub-menu" name="employee">
                      <a href="javascript:;" >
                          <i class="fa fa-users"></i>
                          <span>직원</span>
                      </a>
                      <ul class="sub">
                          <li name="center"><a  href="${pageContext.request.contextPath}/management/center">센터장</a></li>
                          <li name="manager"><a  href="${pageContext.request.contextPath}/management/manager">관리직원</a></li>
                          <li name="teacher"><a  href="${pageContext.request.contextPath}/management/teacher">강사</a></li>
                      </ul>
                  </li>
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
      