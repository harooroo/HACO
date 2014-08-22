<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>



    <!--external css-->
    <link href="${pageContext.request.contextPath}/resources/assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
        
    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/style-responsive.css" rel="stylesheet">
    
	<input id="current-accordion" type="hidden" value="lectureEvaluation,${uri}"/>

      <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
         <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
          	<h3><i class="fa fa-angle-right"></i> 
            	<c:choose>
					<c:when test="${uri=='evaluationRegisterList'}">강의평가 등록</c:when>
					<c:when test="${uri=='evaluationResultList'}">강의평가 결과</c:when>																																			
				</c:choose>		
          	</h3>
		  		<div class="row mt">
			  		<div class="col-lg-12">
                      <div class="content-panel">
                      <h4><i class="fa fa-angle-right"></i> 개설 과정 목록</h4>
                          <section id="unseen">
                            <table class="table table-bordered table-striped table-condensed">
                              <thead>
                              <tr>                              
                                 <th class="numeric">번호</th>
                                 <th class="numeric">센터명</th>
                                 <th class="numeric">과정명</th>
                                 <th class="numeric">수강일자</th>
                                 <th class="numeric">평가 등록</th>               
                              </tr>
                              </thead>
                              <tbody>
                              <%int idx=0; %>
                              <c:forEach var="erl" items="${evalRegList}">
                              	<%idx++; %>
	                          	<tr>	             
	                          		<td class="numeric"><%=idx %></td>               	
	                            	<td class="numeric">${erl.location}</td>
	                                <td class="numeric">
	                                	<c:choose>
											<c:when test="${uri=='evaluationRegisterList'}">
												<a href="${pageContext.request.contextPath}/management/evaluationRegisterform?open_course_id=${erl.open_course_id}">
													${erl.course_name}</a>
											</c:when>
											<c:when test="${uri=='evaluationResultList'}">
												<a href="${pageContext.request.contextPath}/management/evaluationResult?open_course_id=${erl.open_course_id}">
													${erl.course_name}</a>
											</c:when>																																			
										</c:choose>		
	                                </td>
	                                <td class="numeric">${erl.course_start_date}~ ${erl.course_end_date}</td>
	                                <td class="numeric">	 
	                                	<%-- ${erl.state_code}   --%>                             
		                                <c:choose>
											<c:when test="${erl.state_code==1}">설문중</c:when>
											<c:when test="${erl.state_code==0}">비활성</c:when>
											<c:when test="${erl.state_code==9}">설문 완료 </c:when>
											<c:when test="${erl.state_code==-1}">미등록</c:when>																								
										</c:choose>		
	                                </td>	     	                        
	                          	</tr>
                              </c:forEach>   
                              </tbody>
                          </table>
                          </section>
                  </div><!-- /content-panel -->
               </div><!-- /col-lg-4 -->			
		  	</div><!-- /row -->
		  	
		  
		</section><!-- /wrapper -->
      </section><!-- /MAIN CONTENT -->

      <!--main content end-->
     <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0-wip/js/bootstrap.min.js"></script>
     
    <!-- inclue common script -->
    <%@ include file="commonScript.jsp" %>

    <!--script for this page-->
    
  <script>
      //custom select box

      $(function(){
          $('select.styled').customSelect();
      });
  </script>
  
