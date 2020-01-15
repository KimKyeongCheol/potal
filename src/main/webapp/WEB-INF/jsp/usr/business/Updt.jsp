<!-- 2019.12.10 사업신청 추가 -->
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.GregorianCalendar"%>
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
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>
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
<script type="text/javascript"
	src="<c:url value='/js/EgovMultiFile.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/EgovCalPopup.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="board" staticJavascript="false"
	xhtml="true" cdata="false" />
<c:if test="${anonymous == 'true'}">
	<c:set var="prefix" value="/anonymous" />
</c:if>
<script type="text/javascript">
	function fn_egov_regist_notice() {
		var frm = document.getElementById("business");
		if (frm.business_name.value == '') {
			alert("사업신청명은 필수값입니다.");
			frm.business_name.focus();
			return;
		} else if (frm.univ_name.value == '') {
			alert("대학명은 필수값입니다.");
			frm.univ_name.focus();
			return;
		}
		frm.action = "<c:url value='/updateBusiness_proc.do'/>";
		frm.submit();
	}

	function fn_egov_select_noticeView() {
		var frm = document.getElementById("business");
		frm.action = "<c:url value='/business_view.do'/>";
		frm.submit();
	}

	function fn_egov_check_file(flag) {
		if (flag == "Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}
</script>
<title>신청내역 수정</title>
</head>
<body>
	<div id="wrap">
		<div id="subheader">
			<c:import url="/sym/mms/EgovMainMenuHead.do" />
		</div>
		<div id="container"">
			<div class="content-wrap">
				<div class="path-wrap">
					<div class="base-inner">
						<div class="path-list-box">
							<ul>
								<li><a href=""><span class="ico-home">홈</span></a></li>
								<li><a href="">사업신청</a></li>
								<li><a href="">온라인접수</a></li>
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
						<h2 class="h2">사업신청 수정 하기</h2>
					</div>
					<div class="body-box">
						<div class="base-inner">
							<form id="business" name="business" method="post" enctype="multipart/form-data">
								<input type="hidden" id="w_name" name="w_name" value="${result.w_name }">
								<input type="hidden" id="seq" name="seq" value="${result.seq }">
								<c:if test="${result.state == '2' }">
									<input type="hidden" id="state" name="state" value="3">
								</c:if>
								<input type="hidden" name="fileAtchPosblAt" value="<c:out value='Y'/>" />
								<input type="hidden" name="posblAtchFileNumber" value="<c:out value='3'/>" />
								<input type="hidden" name="posblAtchFileSize" value="<c:out value='10'/>" />
								<input type="hidden" name="returnUrl" value="<c:url value='/updateBusiness.do'/>" />
								<div class="com-row-box-01">
									<h3 class="tit-h3">사업신청 수정 하기</h3>
									<div class="txt-box pd-none">
										<div class="tb-03-w">
											<table>
												<caption>
													<span class="blind">사업신청 수정 테이블로 사업신청명, 대학명, 신청자명 등
														정보를 입력 받는 테이블</span>
												</caption>
												<colgroup>
													<col width="15%">
												</colgroup>
												<tbody>
													<tr>
														<th scope="row">신청년도</th>
														<td>
															<select id="year" name="year">
																<%
																int nYear = 0;
																Calendar calendar = new GregorianCalendar(Locale.KOREA);
																nYear = calendar.get(Calendar.YEAR);
																for(int i = nYear; i <= nYear + 10; i++){
																	%>
																		<c:set value="${result.year }" var="year" />
																		<c:set value="<%=i %>" var="nYear" />
																		<c:if test="${year == nYear }">
																			<option value="<%=i%>" selected="selected"><%=i%>년도</option>
																		</c:if>
																		<c:if test="${year != nYear }">
																			<option value="<%=i%>"><%=i%>년도</option>
																		</c:if>
																	<%
																}
																%>
															</select>
														</td>
													</tr>
													<tr>
														<th scope="row">사업신청명<img
															src="<c:url value='/images/required.gif' />" width="15"
															height="15" alt="required" /></th>
														<td><input id="business_name" name="business_name"
															class="input-txt wd-100" value="${result.business_name }" /><br>
															<p>※ 접수공고 명. 예)2020 신규사업신청.. 등</p></td>
													</tr>
													<tr>
														<th scope="row">대학명<img
															src="<c:url value='/images/required.gif' />" width="15"
															height="15" alt="required" /></th>
														<td><input id="univ_name" name="univ_name"
															type="text" class="input-txt wd-80" value="${result.univ_name }" /><br>
															<p class="txt1">※ 접수공고 명. 예) 2020 신규사업신청.. 등</p></td>
													</tr>
													<tr>
														<th scope="row">신청자명</th>
														<td>${result.w_name }<br>
															<p class="txt1">※ 접수자 성명</p>
														</td>
													</tr>
													<c:if test="${not empty result.file}">
														<tr>
															<th scope="row">첨부파일</td>
															<td class="td_content">
																<c:import url="/cmm/fms/selectFileInfsForUpdate.do" charEncoding="utf-8">
																	<c:param name="param_atchFileId" value="${result.file}" />
																</c:import>
															</td>
														</tr>
													</c:if>
													<tr>
														<th scope="row" class="td_width">파일첨부</th>
														<td class="td_content">
															<div id="file_upload_posbl" style="display: none;">
																<input name="file_1" id="egovComFileUploader" type="file"/>
																<div id="egovComFileList"></div>
															</div>
															<div id="file_upload_imposbl" style="display: none;">
																<spring:message code="common.imposbl.fileupload" />
															</div> 
															<c:if test="${empty result.file}">
																<input type="hidden" id="fileListCnt" name="fileListCnt" value="0"/>
															</c:if>
														</td>
													</tr>
													<tr>
														<th scope="row">보완 요청</th>
														<td>
															<textarea id="supplement_req" name="supplement_req" title="기타설명" class="textarea" cols="95" rows="10" disabled="disabled">${result.supplement_req }</textarea>
														</td>
													</tr>
													<tr>
														<th scope="row">기타 설명</th>
														<td>
															<textarea id="etc_explain" name="etc_explain" title="기타설명" class="textarea" cols="95" rows="10">${result.etc_explain }</textarea>
														</td>
													</tr>
												</tbody>
											</table>
											<script type="text/javascript">
										        var existFileNum = document.business.fileListCnt.value;
												var maxFileNum = document.business.posblAtchFileNumber.value;
										
										        if (existFileNum=="undefined" || existFileNum ==null) {
										            existFileNum = 0;
										        }
										        if (maxFileNum=="undefined" || maxFileNum ==null) {
										            maxFileNum = 0;
										        }       
										        var uploadableFileNum = maxFileNum - existFileNum;
										        if (uploadableFileNum<0) {
										            uploadableFileNum = 0;
										        }               
										        if (uploadableFileNum != 0) {
										            fn_egov_check_file('Y');
										            var multi_selector = new MultiSelector( document.getElementById('egovComFileList'), uploadableFileNum );
										            multi_selector.addElement( document.getElementById('egovComFileUploader'));
										        } else {
										            fn_egov_check_file('N');
										        }   
											</script>
										</div>
										<div class="btn-reg-box">
											<a href="#LINK" onclick="javascript:fn_egov_regist_notice();" class="btn-01">수정하기</a>
											<a href="#LINK" onclick="javascript:fn_egov_select_noticeView();" class="btn-01">취소</a>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" />
		</div>
	</div>
</body>
</html>
<!-- 2019.12.10 사업신청 추가 -->