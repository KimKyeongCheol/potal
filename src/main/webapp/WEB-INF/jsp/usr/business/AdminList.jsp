<!-- 2019.12.10 사업신청 추가 -->
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css"
	type="text/css">
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
				document.frm.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>";
				document.frm.submit();
			}

			function fn_egov_inqire_notice(nttId, bbsId) {
				//document.subForm.nttId.value = nttId;
				//document.subForm.bbsId.value = bbsId;
				//document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
				//document.subForm.submit();
			}
		//-->
		</script>
	</c:otherwise>
</c:choose>
<title><c:out value="${brdMstrVO.bbsNm}" /> 목록</title>

<style type="text/css">
.ellipsis {
    text-overflow: ellipsis;
    -o-text-overflow: ellipsis;
    overflow: hidden;
    white-space: nowrap;
    word-wrap: normal !important;
    display: block;
}
</style>
<script>
	function goSearch(page){
		var frm = document.getElementById("business");
		if(frm.searchType.value != '4'){
			if(frm.searchWord.value == ''){
				alert("검색어를 입력하세요.");
				return;
			}
		}
		
		frm.action = "<c:url value='/business_admin_list.do'/>";
		frm.submit();
	}
</script>
</head>
<body>
	<!-- login status start -->
	<div id="login_area">
		<c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" />
	</div>
	<!-- //login status end -->
	<!-- wrap start -->
	<div id="wrap">
		<!-- header start -->
		<div id="subheader">
			<c:import url="/sym/mms/EgovMainMenuHeadAdmin.do" />
		</div>
		<!-- //header end -->
		<div id="bodywrap">
			<div id="leftmenu_div">
				<c:import url="/sym/mms/EgovMainMenuLeft.do" />
			</div>
			<div id="middle_content">
				<div id="content_field">
					<div>
						<h2>사업신청관리</h2>
					</div>
					<br>
					<form id="business" name="business" method="post">
						<div class="search_service">
			                <div class="search_area">
				                <div class="search_conditions" >
				                    <select id="searchType" name="searchType" class="select" title="검색조건 선택">
								           <option value="4" <c:if test="${searchVO.searchType == '4'}">selected="selected"</c:if> >전체</option>
								           <option value="0" <c:if test="${searchVO.searchType == '0'}">selected="selected"</c:if> >신청년도</option>
								           <option value="1" <c:if test="${searchVO.searchType == '1'}">selected="selected"</c:if> >사업명</option>
								           <option value="2" <c:if test="${searchVO.searchType == '2'}">selected="selected"</c:if> >작성자</option>
								    </select>
								    <input id="searchWord" name="searchWord" type="text" value="${searchVO.searchWord}" size="35" value="" maxlength="35" onkeypress="press(event);" title="검색어 입력">
				                </div>
				                <div class="search_buttons">
							        <input type="submit" onclick="goSearch('1'); return false;" />
				                </div>
			                </div>
			            </div>
					</form>
					
					
					<div class="search_result_div">
						<table width="98%" cellpadding="0" cellspacing="0"
							summary="번호, 제목, 게시시작일, 게시종료일, 작성자, 작성일, 조회수   입니다">
							<caption>게시물목록</caption>
							<colgroup>
								<col width="10%">
								<col width="10%">
								<col width="*">
								<col width="20%">
								<col width="15%">
								<col width="15%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th scope="col" class="tb-pc">번호</th>
									<th scope="col" class="tb-pc">신청년도</th>
									<th scope="col" class="tb-pc">사업명</th>
									<th scope="col" class="tb-pc">대학명</th>
									<th scope="col" class="tb-pc">신청자명</th>
									<th scope="col" class="tb-pc">신청상태</th>
									<th scope="col" class="tb-pc">신청일</th>
								</tr>
							</thead>

							<tbody>
								<c:if test="${fn:length(resultList) == 0}">
									<tr>
										<td colspan="7">신청내역이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="result" items="${resultList}" varStatus="status">
									<tr>
										<td>
											<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" />
										</td>
										<td>${result.year }</td>
										<fmt:parseNumber var="no" value="${result.seq }" />
										<td align="left">
											<a style="padding-left: 5px;" href="<c:url value='/business_admin_view.do?seq=${no }&pageIndex=${searchVO.pageIndex }&searchType=${searchVO.searchType }&searchWord=${searchVO.searchWord }'/>" class="ellipsis">${result.business_name }</a>
										</td>
										<td>${result.univ_name }</td>
										<td>${result.w_name }</td>
										<td>
											<c:choose>
												<c:when test="${result.state == '1'}">접수중</c:when>
												<c:when test="${result.state == '2'}">보완요청</c:when>
												<c:when test="${result.state == '3'}">보완완료</c:when>
												<c:otherwise>승인</c:otherwise>
											</c:choose>
										</td>
										<fmt:parseDate value="${result.write_date}" var="write_date"
											pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${write_date}" pattern="yyyy-MM-dd"
											var="date" />
										<td>${date }</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
					<div id="paging_div">
						<ul class="paging_align">
							<ui:pagination paginationInfo="${paginationInfo}" type="image"
								jsFunction="fn_egov_select_noticeList" />
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=admin/inc/EgovIncFooter" />
		</div>
	</div>
</body>
</html>
<!-- 2019.12.10 사업신청 추가 -->