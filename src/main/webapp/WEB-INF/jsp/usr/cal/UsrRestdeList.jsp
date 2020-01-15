<!DOCTYPE html>
<%
	/**
	 * @Class Name  : EgovRestdeList.jsp
	 * @Description : EgovRestdeList 화면
	 * @Modification Information
	 * @
	 * @  수정일             수정자                   수정내용
	 * @ -------    --------    ---------------------------
	 * @ 2009.04.01   이중호              최초 생성
	 *   2011.08.12   서준식              페이징 번호 정렬이 리스트와 일치하도록 수정
	 							   CSS 경로 수정
	 *  @author 공통서비스팀
	 *  @since 2009.04.01
	 *  @version 1.0
	 *  @see
	 *
	 */
%>
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="pageTitle">
	<spring:message code="sym.cal.title" />
</c:set>
<html lang="ko">
<head>
<title>${pageTitle}<spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link href="<c:url value='/'/>css/import.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/www-player-webp-vflfcplvs.css"
	rel="stylesheet" type="text/css">

<!--[if lt IE 9]>
	<script src="../common/js/html5shiv.min.js"></script>
	<script src="../common/js/respond.min.js"></script>
<![endif]-->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>
<script type="text/javaScript" language="javascript">
<!--
	/* ********************************************************
	 * 페이징 처리 함수
	 ******************************************************** */
	function fn_egov_pageview(pageNo) {
		document.listForm.pageIndex.value = pageNo;
		document.listForm.action = "<c:url value='/CalList.do'/>";
		document.listForm.submit();
		
	}
	/* ********************************************************
	 * 조회 처리
	 ******************************************************** */
	function fn_egov_search_Restde() {
		document.listForm.pageIndex.value = 1;
		document.listForm.submit();
	}
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function fn_egov_regist_Restde() {
		location.href = "<c:url value='/sym/cal/EgovRestdeRegist.do' />";
	}
	/* ********************************************************
	 * 상세회면 처리 함수
	 ******************************************************** */
	function fn_egov_detail_Restde(restdeNo) {
		var varForm = document.all["Form"];
		varForm.action = "<c:url value='/CalDetail.do'/>";
		varForm.restdeNo.value = restdeNo;
		varForm.submit();
	}
	-->
</script>
</head>
<body>

	<!-- wrap start -->
	<div id="wrap">
		<!-- header start -->
		<div id="subheader">
			<c:import url="/sym/mms/EgovMainMenuHead.do" />
		</div>
		<!-- //header end -->
		<div id="bodywrap">
			<div id="middle_content">
				<!-- class : path-wrap : (S) -->
				<div class="path-wrap">
					<div class="base-inner">
						<div class="path-list-box">
							<ul>
								<li><a href=""><span class="ico-home">홈</span></a></li>
								<li><a href="">대학생 취업브리지</a></li>
								<li><a href="">캘린더</a></li>
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
				<div id="content_field">
					<!--contents start-->


					<!-- class : cont-body-wrap : (S) -->
					<div class="cont-body-wrap">

						<div class="cont-tit-box">
							<h2 class="h2">캘린더</h2>
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
											<caption></caption>
											<colgroup>
												<col width="8%">
												<col width="12%">
												<col width="*">
												<col width="14%">
											</colgroup>
											<thead>
												<tr>
													<th scope="col" class="tb-pc"><spring:message
															code="sym.cal.column1" /></th>
													<th scope="col">일정일자</th>
													<th scope="col" class="tb-pc">일정명</th>
													<th scope="col" class="tb-pc">휴일구분</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach items="${resultList}" var="resultInfo"
													varStatus="status">
													<tr>
														<td><c:out
																value="${(searchVO.pageIndex - 1) * searchVO.pageSize + status.count}" /></td>
														<td><c:out
																value='${fn:substring(resultInfo.restdeDe, 0,4)}' />-<c:out
																value='${fn:substring(resultInfo.restdeDe,  4,6)}' />-<c:out
																value='${fn:substring(resultInfo.restdeDe, 6, 8)}' /></td>
														<td><a href="#" onclick="fn_egov_detail_Restde('${resultInfo.restdeNo}');" >${resultInfo.restdeNm}</a></td>
														<td>${resultInfo.restdeSe}</td>
													</tr>
												</c:forEach>

												<c:if test="${fn:length(resultList) == 0}">
													<tr>
														<td colspan=4><spring:message
																code="common.nodata.msg" /></td>
													</tr>
												</c:if>
											</tbody>
										</table>

<form name="Form" method="post">
	<input type="hidden" name="restdeNo">
</form>


									</div>
									
									<div class="board-btm-box">
							<div class="count-box">
								<span class="tit">총 게시물 <c:out value="${resultCnt }" />건</span> 
							</div>

							<!-- box_paging Start -->
							<div class="box_paging">
								<ul class="pagination">
									<ui:pagination paginationInfo="${paginationInfo}" type="image" jsFunction="fn_egov_pageview"/>
								</ul>
							</div>
							<!-- box_paging End -->
<!-- search area start -->
							<div class="search-box">

<form name="listForm" action="<c:url value='/CalList.do'/>" method="post">
				<select name="searchCondition" class="select" title="" id = "searchCondition" >
				<option selected value=''><spring:message code="sym.cal.select" /></option><!-- --선택하세요-- -->
				<option value='1' <c:if test="${searchVO.searchCondition == '1'}">selected="selected"</c:if>>일정일자(시작일)</option><!-- 일정일자 -->
				<option value='2' <c:if test="${searchVO.searchCondition == '2'}">selected="selected"</c:if>>일정명</option><!-- 일정명 -->
				</select>
			


										<input class="input" id="searchText" name="searchKeyword" type="text" value="" onkeypress="press(event);" title="검색어 입력">
	


									<a class="btn" href="#noscript" onclick="fn_egov_search_Restde(); return false;">검색</a>



									<input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>

								</form>

							</div>
							<!-- search area end -->
						</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" />
		</div>
		<!-- //footer 끝 -->

	</div>
</body>
</html>
