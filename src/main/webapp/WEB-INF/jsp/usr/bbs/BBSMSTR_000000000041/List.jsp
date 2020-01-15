<%--
  Class Name :
  Description :
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.19   이삼섭          최초 생성
     2011.08.31  JJY       경량환경 버전 생성

    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.19
--%>

<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link href="<c:url value='/'/>css/import.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet" type="text/css" >
<!--[if lt IE 9]>
	<script src="../common/js/html5shiv.min.js"></script>
	<script src="../common/js/respond.min.js"></script>
<![endif]-->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>

<c:if test="${anonymous == 'true'}">
	<c:set var="prefix" value="/anonymous" />
</c:if>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<c:choose>
	<c:when test="${preview == 'true'}">
		<script type="text/javascript">
		<!--
			function press(event) {
			}

			function fn_egov_addNotice() {
			}

			function fn_egov_select_noticeList(pageNo) {
			}

			function fn_egov_inqire_notice(nttId, bbsId) {
			}
			function search_bbs(){
			}
			
		//-->
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
		<!--
			function press(event) {
				if (event.keyCode == 13) {
					fn_egov_select_noticeList('1');
				}
			}

			function fn_egov_addNotice() {
				document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
				document.frm.submit();
			}

			function fn_egov_select_noticeList(pageNo) {
				document.frm.pageIndex.value = pageNo;
				document.frm.action = "<c:url value='/selectBoardList_user.do'/>";
				document.frm.submit();
			}

			function fn_egov_inqire_notice(nttId, bbsId) {
				//document.subForm.nttId.value = nttId;
				//document.subForm.bbsId.value = bbsId;
				//document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
				//document.subForm.submit();
			}
			
			function view_bbs(th){
				$(th).parent().submit(); 
			}
			function search_bbs(){
				var search_Text = document.getElementById("searchText").value;
				 if(search_Text == "" || search_Text == null){
					alert("검색어를 입력해주세요.");
				}else if(search_Text != "" || search_Text != null){
					document.frm.submit();	
				}
				
			}
		//-->
		</script>
	</c:otherwise>
</c:choose>
<title><c:out value="${brdMstrVO.bbsNm}" /> 목록</title>


</head>
<body>
	<!-- header start -->
	<div id="subheader">
		<c:import url="/sym/mms/EgovMainMenuHead.do" />
	</div>
	<!-- //header end -->
	<div class="content-wrap">
		<!-- class : path-wrap : (S) -->
		<div class="path-wrap">
			<div class="base-inner">
				<div class="path-list-box">
					<ul>
						<li><a href=""><span class="ico-home">홈</span></a></li>
						<li><a href="">알림마당</a></li>
						<li><a href="">공지사항</a></li>
					</ul>
				</div>
				<div class="sns-list-box">
					<ul>
						<li><a href=""><span class="ico-home">홈페이지</span></a></li>
							<li><a href=""><span class="ico-print">프린트</span></a></li>
							<li><a href="https://www.instagram.com/jobabanet/" target="_blank"><span class="ico-face">페이스북</span></a></li>
							<li><a href=""><span class="ico-kks">카카오스토리</span></a></li>
							<li><a href="https://twitter.com/jobabanet" target="_blank"><span class="ico-tw">트위터</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- class : path-wrap : (E) -->

		<!-- class : cont-body-wrap : (S) -->
		<div class="cont-body-wrap">

				<div class="cont-tit-box">
					<h2 class="h2"><c:out value="${brdMstrVO.bbsNm}"/></h2>
				</div>

			<!-- class : body-box : (S) -->
			<div class="body-box">

				<!-- class : base-inner : (S) -->
				<div class="base-inner">
					<!-- class : board-list-box : (S) -->
					<div class="board-list-box">
						<!-- class : tb-01 : (S) -->
						<div class="tb-01">
								<table>
									<colgroup>
										<col width="8%"><col width="12%"><col width="*"><col width="12%"><col width="14%"><col width="12%">
									</colgroup>

									<thead>
										<tr>
											<th scope="col" class="tb-pc">번호</th>
											<!-- <th scope="col" class="mb-wd-short">분류</th> -->
											<th scope="col">제목</th>
											<th scope="col" class="tb-pc">작성자</th>
											<th scope="col" class="tb-pc">등록일</th>
											<th scope="col" class="tb-pc">조회수</th>
										</tr>
									</thead>

<tbody>
									<c:if test="${fn:length(resultList) == 0}">
										<tr>
											<c:choose>
												<c:when test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
													<td colspan="7"><spring:message
															code="common.nodata.msg" /></td>
												</c:when>
												<c:otherwise>
													<c:choose>
														<c:when test="${anonymous == 'true'}">
															<td colspan="4"><spring:message
																	code="common.nodata.msg" /></td>
														</c:when>
														<c:otherwise>
															<td colspan="6"><spring:message
																	code="common.nodata.msg" /></td>
														</c:otherwise>
													</c:choose>
												</c:otherwise>
											</c:choose>
										</tr>
									</c:if>
									<c:forEach var="result" items="${resultList}"
										varStatus="status">
										<c:choose>
									
								
									<c:when	test="${result.notice eq 'Y' }">
					
											<tr>
												<td class="tb-pc">
												<%-- <c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" /> --%>
												공지
												</td>
												
<!-- 												<td>	
												</td> -->
								
												<td class="left ">
													<form name="subForm" method="post"
														action="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do?us=usr'/>">
														<c:if test="${result.replyLc!=0}">
															<c:forEach begin="0" end="${result.replyLc}" step="1">
											                    &nbsp;
											                </c:forEach>
															<img src="<c:url value='/images/reply_arrow.gif'/>"
																alt="reply arrow">
														</c:if>
														<c:choose>
															<c:when
																test="${result.isExpired=='Y' || result.useAt == 'N'}">
																<c:out value="${result.nttSj}" />
															</c:when>
															<c:otherwise>
																<input type="hidden" name="bbsId"
																	value="<c:out value='${result.bbsId}'/>" />
																<input type="hidden" name="nttId"
																	value="<c:out value="${result.nttId}"/>" />
																<input type="hidden" name="bbsTyCode"
																	value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
																<input type="hidden" name="bbsAttrbCode"
																	value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
																<input type="hidden" name="authFlag"
																	value="<c:out value='${brdMstrVO.authFlag}'/>" />
																<input name="pageIndex" type="hidden"
																	value="<c:out value='${searchVO.pageIndex}'/>" />
																<input type="hidden" name="nttSj"
																	value="<c:out value="${result.nttSj}"/>">
																<%-- <a class="ellipsis" href="#" onclick="view_bbs(this)"><c:out value="${result.nttSj}"/></a> --%>
																<a class="ellipsis" href="<c:url value='/selectBoardArticle_user.do?us=usr'/>&bbsId=<c:out value='${result.bbsId}'/>&nttId=<c:out value='${result.nttId}'/>" /><c:out value="${result.nttSj}"/></a>
															</c:otherwise>
														</c:choose>
													</form>
												</td>
												<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
													<td class="tb-pc"><c:out value="${result.ntceBgnde}" /></td>
													<td class="tb-pc"><c:out value="${result.ntceEndde}" /></td>
												</c:if>
												<c:if test="${anonymous != 'true'}">
													<td class="tb-pc"><c:out value="${result.frstRegisterNm}" /></td>
												</c:if>
												<td class="tb-pc"><c:out value="${result.frstRegisterPnttm}" /></td>
												<td class="tb-pc"><c:out value="${result.inqireCo}" /></td>
											</tr>	
										</c:when>

										<c:otherwise>
											<tr>
												<td class="tb-pc"><c:out
														value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" /></td>
<!-- 												<td>	</td> -->
								
												<td class="left ">
													<form name="subForm" method="post"
														action="<c:url value='/cop/bbs${prefix}/selectBoardArticle.do?us=usr'/>">
														<c:if test="${result.replyLc!=0}">
															<c:forEach begin="0" end="${result.replyLc}" step="1">
											                    &nbsp;
											                </c:forEach>
															<img src="<c:url value='/images/reply_arrow.gif'/>"
																alt="reply arrow">
														</c:if>
														<c:choose>
															<c:when
																test="${result.isExpired=='Y' || result.useAt == 'N'}">
																<c:out value="${result.nttSj}" />
															</c:when>
															<c:otherwise>
																<input type="hidden" name="bbsId"
																	value="<c:out value='${result.bbsId}'/>" />
																<input type="hidden" name="nttId"
																	value="<c:out value="${result.nttId}"/>" />
																<input type="hidden" name="bbsTyCode"
																	value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
																<input type="hidden" name="bbsAttrbCode"
																	value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
																<input type="hidden" name="authFlag"
																	value="<c:out value='${brdMstrVO.authFlag}'/>" />
																<input name="pageIndex" type="hidden"
																	value="<c:out value='${searchVO.pageIndex}'/>" />
																<input type="hidden" name="nttSj"
																	value="<c:out value="${result.nttSj}"/>">
																<%-- <a class="ellipsis" href="#" onclick="view_bbs(this)"><c:out value="${result.nttSj}"/></a> --%>
																<a class="ellipsis" href="<c:url value='/selectBoardArticle_user.do?us=usr'/>&bbsId=<c:out value='${result.bbsId}'/>&nttId=<c:out value='${result.nttId}'/>" /><c:out value="${result.nttSj}"/></a>
															</c:otherwise>
														</c:choose>
													</form>
												</td>
												<c:if test="${brdMstrVO.bbsAttrbCode == 'BBSA01'}">
													<td class="tb-pc"><c:out value="${result.ntceBgnde}" /></td>
													<td class="tb-pc"><c:out value="${result.ntceEndde}" /></td>
												</c:if>
												<c:if test="${anonymous != 'true'}">
													<td class="tb-pc"><c:out value="${result.frstRegisterNm}" /></td>
												</c:if>
												<td class="tb-pc"><c:out value="${result.frstRegisterPnttm}" /></td>
												<td class="tb-pc"><c:out value="${result.inqireCo}" /></td>
											</tr>
										</c:otherwise>
										</c:choose>
									</c:forEach>
								</tbody>
							</table>

							<!--  -->
						</div>
						<!-- class : tb-01 : (E) -->
						
						<!--  -->
						<div class="board-btm-box">
							<div class="count-box">
								<span class="tit">총 게시물 <c:out value="${resultCnt }" />건</span> 
					<!-- 			<select name="" id="">
									<option value="">카테고리</option>
								</select> -->
							</div>

							<!-- box_paging Start -->
							<div class="box_paging">
								<ul class="pagination">
									<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_select_noticeList" />

								</ul>
							</div>
							<!-- box_paging End -->

							<!-- search area start -->
							<div class="search-box">

							<form name="frm" action ="<c:url value='/selectBoardList_user.do'/>" method="post">
			<input type="hidden" name="bbsId" value="<c:out value='${boardVO.bbsId}'/>" />
			<input type="hidden" name="nttId"  value="0" />
			<input type="hidden" name="us"  value="usr" />
			<input type="hidden" name="bbsTyCode" value="<c:out value='${brdMstrVO.bbsTyCode}'/>" />
			<input type="hidden" name="bbsAttrbCode" value="<c:out value='${brdMstrVO.bbsAttrbCode}'/>" />
			<input type="hidden" name="authFlag" value="<c:out value='${brdMstrVO.authFlag}'/>" />
			<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
			


										<select name="searchCnd" class="select" title="검색조건 선택">
											<option value="0">제목</option>
											<option value="1">내용</option>
											<option value="2">작성자</option>
										</select> 
										<input class="input" id="searchText" name="searchWrd" type="text" value="" onkeypress="press(event);" title="검색어 입력">
	


									<a class="btn" href="javascript:search_bbs();">검색</a>
														<%
						LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");
						if (loginVO == null) {
					%>
					<%}else if(loginVO != null){ %>
				<%if(loginVO.getCode().equals("ROLE_ADMIN")){ %>
 <a class="btn" href="<c:url value='/addBoardArticle_user.do?bbsId=${boardVO.bbsId}'/>"><spring:message code="button.create" /></a>
<%}else{ %>

<%} %>
<%} %>
									

								</form>
								

							</div>
							<!-- search area end -->
							</div>
						</div>
						<!-- contents end -->
					</div>

				</div>
				<!-- class : board-list-box : (E) -->
			</div>
			<!-- class : base-inner : (E) -->

		</div>
		<!-- class : body-box : (E) -->


		<!-- class : cont-body-wrap : (E) -->
	</div>
	
	<!-- footer 시작 -->
	<div id="footer">
		<c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" />
	</div>
	<!-- //footer 끝 -->

	<!-- //wrap end -->



</body>
</html>