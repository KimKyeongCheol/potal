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
<%@ page import="egovframework.com.cmm.LoginVO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link href="<c:url value='/'/>css/font.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/reset.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/slick.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/layout.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/only_ie.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/style.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/mobile.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet"
	type="text/css">
<!--[if lt IE 9]>
	<script src="../common/js/html5shiv.min.js"></script>
	<script src="../common/js/respond.min.js"></script>
<![endif]-->
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript">
	function fn_egov_select_noticeList(pageNo) {
		var frm = document.getElementById("business");
		frm.pageIndex.value = pageNo;
		frm.action = "<c:url value='/business_list.do'/>";
		frm.submit();
	}
	
	function fn_egov_moveUpdt_notice() {
		var frm = document.getElementById("business");
		if (confirm('<spring:message code="common.update.msg" />')) {
			frm.action = "<c:url value='/updateBusiness.do'/>";
			frm.submit();
		}
	}

	function fn_egov_delete_notice() {
		var frm = document.getElementById("business");
		if (confirm('<spring:message code="common.delete.msg" />')) {
			frm.action = "<c:url value='/deleteBusiness_proc.do'/>";
			frm.submit();
		}
	}
	
</script>
<title>사업신청 상세정보</title>
</head>
<body>
	<div id="subheader">
		<c:import url="/sym/mms/EgovMainMenuHead.do" />
	</div>
	<!-- //header end -->
	<div id="bodywrap">
		<div id="middle_content">
			<div class="path-wrap">
				<div class="base-inner">
					<div class="path-list-box">
						<ul>
							<li><a href=""><span class="ico-home">홈</span></a></li>
							<li><a href="">사업신청</a></li>
							<li><a href="">사업 신청 내역</a></li>
						</ul>
					</div>
					<div class="sns-list-box">
						<ul>
							<li><a href=""><span class="ico-home">홈페이지</span></a></li>
							<li><a href=""><span class="ico-print">프린트</span></a></li>
							<li><a href=""><span class="ico-face">페이스북</span></a></li>
							<li><a href=""><span class="ico-kks">카카오스토리</span></a></li>
							<li><a href=""><span class="ico-tw">트위터</span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="cont-body-wrap">
				<div class="cont-tit-box">
					<h2 class="h2">사업 신청 상세보기</h2>
				</div>
				<div class="body-box">
					<div class="base-inner">
						<div class="board-view-box">
							<form id="business" name="business" method="post">
								<input type="hidden" id="pageIndex" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"> 
								<input type="hidden" id="seq" name="seq" value="${result.seq }">
								<input type="hidden" id="w_name" name="w_name" value="${result.w_name }">
								<div class="com-row-box-01">
									<h3 class="tit-h3">사업신청 상세 내역</h3>
									<div class="txt-box pd-none">
										<div class="tb-03-w">
											<table>
												<caption><span class="blind">사업신청 접수 테이블로 사업신청명, 대학명, 신청자명 등 정보를 입력 받는 테이블</span></caption>
												<colgroup>
													<col width="25%">
												</colgroup>
		 										<tbody>
													<tr>
														<th scope="row">신청년도</th>
														<td>${result.year }년</td>
													</tr>
													<tr>
														<th scope="row">사업신청명</th>
														<td>${result.business_name }</td>
													</tr>
													<tr>
														<th scope="row">대학명</th>
														<td>${result.univ_name }</td>
													</tr>
													<tr>
														<th scope="row">이름</th>
														<td>${result.w_name }</td>
													</tr>
													<tr>
														<th scope="row">첨부파일</th>
														<td>
															<a>
																<c:import url="/cmm/fms/selectFileInfs.do" charEncoding="utf-8">
																	<c:param name="param_atchFileId" value="${result.file}" />
																</c:import>
															</a>
														</td>
													</tr>
													<tr>
														<th scope="row">기타 설명</th>
														<td>
															<div class="textarea-exp">${result.etc_explain }</div>
		 												</td>
													</tr>
													<tr>
														<th scope="row">신청상태</th>
														<td>
															<c:choose>
																<c:when test="${result.state == '1'}">접수중</c:when>
																<c:when test="${result.state == '2'}">보완요청</c:when>
																<c:when test="${result.state == '3'}">보완완료</c:when>
																<c:otherwise>승인</c:otherwise>
															</c:choose>
														</td>
													</tr>
													<tr>
														<th scope="row">보완요청내용</th>
														<td>
															<div class="textarea-exp">${result.supplement_req }</div>
		 												</td>
													</tr>
													<tr>
														<th scope="row">마지막 변경일자</th>
														<fmt:parseDate value="${result.update_date}" var="update_date" pattern="yyyy-MM-dd HH:mm:ss" />
														<fmt:formatDate value="${update_date}" pattern="yyyy-MM-dd" var="uDate" />
														<td>${uDate }</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="btn-reg-box">
											<a class="btn-01 red" href="#LINK" onclick="javascript:fn_egov_moveUpdt_notice(); return false;">수정</a>
											<a class="btn-01 red" href="#LINK" onclick="javascript:fn_egov_delete_notice(); return false;">삭제</a>
											<a class="btn-01 red" href="#LINK" onclick="javascript:fn_egov_select_noticeList('${searchVO.pageIndex}'); return false;">목록</a>
										</div>
									</div>
								</div>
							</form>
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
	<!-- //wrap end -->
</body>
</html>
<!-- 2019.12.10 사업신청 추가 -->