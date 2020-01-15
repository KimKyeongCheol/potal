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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css"
	type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<c:if test="${anonymous == 'true'}">
	<c:set var="prefix" value="/anonymous" />
</c:if>
<script type="text/javascript">

	function fn_egov_select_noticeList(pageNo) {
		var frm = document.getElementById("business");
		frm.pageIndex.value = pageNo;
		frm.searchType.value = "${searchVO.searchType }";
		frm.searchWord.value = "${searchVO.searchWord }";
		frm.action = "<c:url value='/business_admin_list.do'/>";
		frm.submit();
	}
	
	function fn_egov_moveUpdt_notice() {
		var frm = document.getElementById("business");
		frm.action = "<c:url value='/updateBusiness_admin.do'/>";
		frm.submit();
	}

	function fn_egov_delete_notice() {
		var frm = document.getElementById("business");
		if (confirm('<spring:message code="common.delete.msg" />')) {
			frm.action = "<c:url value='/deleteBusiness_admin_proc.do'/>";
			frm.submit();
		}
	}
	
</script>
<title>사업신청 상세내역</title>
</head>
<body>
	<div id="login_area">
		<c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" />
	</div>
	<div id="wrap">
		<div id="subheader">
			<c:import url="/sym/mms/EgovMainMenuHeadAdmin.do" />
		</div>
		<div id="bodywrap">
			<div id="leftmenu_div">
				<c:import url="/sym/mms/EgovMainMenuLeft.do" />
			</div>
			<div id="middle_content">
				<div id="content_field">
					<form id="business" name="business" method="post">
						<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"> 
						<input type="hidden" id="seq" name="seq" value="${result.seq }">
						<input type="hidden" id="searchType" name="searchType" value="${searchVO.searchType }">
						<input type="hidden" id="searchWord" name="searchWord" value="${searchVO.searchWord }">
						<div>
							<h2>사업신청 상세내역</h2>
						</div>
						<style>
						.search_top_table table td.td_width{
							width: 30%;
						}
						.search_top_table table td.td_content{
							width: 60%;
						}
						</style>
						<div class="search_service">
							<div class="search_top_table">
								<table width="100%" border="0" cellpadding="0" cellspacing="1"
									bgcolor="#ffffff" class="generalTable">
									<tr>
										<td class="td_width">신청년도</td>
										<td class="td_content">${result.year }년</td>
									</tr>
									<tr>
										<td class="td_width">사업신청명</td>
										<td class="td_content">${result.business_name }</td>
									</tr>
									<tr>
										<td class="td_width">대학명</td>
										<td class="td_content">${result.univ_name }</td>
									</tr>
									<tr>
										<td class="td_width">이름</td>
										<td class="td_width">${result.w_name }</td>
									</tr>
									<tr>
										<td class="td_width">신청상태</td>
										<td class="td_width">
											<c:choose>
												<c:when test="${result.state == '1' }">진행중</c:when>
												<c:when test="${result.state == '2' }">보완요청</c:when>
												<c:when test="${result.state == '3' }">보완완료</c:when>
												<c:otherwise>승인</c:otherwise>
											</c:choose>
										</td>
									</tr>
									<tr>
										<td class="td_width">보완요청</td>
										<td class="td_width">${result.supplement_req }</td>
									</tr>
									<tr>
										<td class="td_width">기타</td>
										<td class="td_width">${result.etc_explain }</td>
									</tr>
									<%-- <tr>
										<td class="td_width">기타1</td>
										<td class="td_width">${result.etc1 }</td>
									</tr>
									<tr>
										<td class="td_width">기타2</td>
										<td class="td_width">${result.etc2 }</td>
									</tr>
									<tr>
										<td class="td_width">기타3</td>
										<td class="td_width">${result.etc3 }</td>
									</tr> --%>
									<tr>
										<td class="td_width">등록일</td>
										<fmt:parseDate value="${result.write_date}" var="write_date" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${write_date}" pattern="yyyy-MM-dd" var="date" />
										<td class="td_width">${date }</td>
									</tr>
									<tr>
										<td class="td_width">변경일자</td>
										<fmt:parseDate value="${result.update_date}" var="write_date" pattern="yyyy-MM-dd HH:mm:ss" />
										<fmt:formatDate value="${write_date}" pattern="yyyy-MM-dd" var="date" />
										<td class="td_width">${date }</td>
									</tr>
									<c:if test="${not empty result.file}">
										<tr>
											<td class="td_width">첨부파일 목록</td>
											<td class="td_content" style="padding: 10px 0 10px 5px;">
												<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
													<c:param name="param_atchFileId" value="${result.file}" />
												</c:import>
											</td>
										</tr>
									</c:if>
								</table>
							</div>
						</div>
						<table border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td>
									<div class="buttons" align="center" style="margin-bottom: 100px">
										<a href="#LINK" onclick="javascript:fn_egov_moveUpdt_notice(); return false;">수정</a>
										<a href="#LINK" onclick="javascript:fn_egov_delete_notice(); return false;">삭제</a>
										<a href="#LINK" onclick="javascript:fn_egov_select_noticeList('${searchVO.pageIndex}'); return false;">목록</a>
									</div>
								</td>
							</tr>
						</table>
					</form>
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