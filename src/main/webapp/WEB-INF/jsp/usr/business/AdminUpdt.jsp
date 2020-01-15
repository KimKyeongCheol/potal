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
<link rel="stylesheet" href="<c:url value='/'/>css/default.css"
	type="text/css">
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<script type="text/javascript"
	src="<c:url value='/js/EgovMultiFile.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/js/EgovCalPopup.js'/>"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
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
		frm.action = "<c:url value='/updateBusiness_admin_proc.do'/>";
		frm.submit();
	}

	
	function fn_egov_select_noticeView() {
		var frm = document.getElementById("business");
		frm.action = "<c:url value='/business_admin_view.do'/>";
		frm.submit();
	}
	
	function fn_egov_check_file(flag) {
		if (flag=="Y") {
			document.getElementById('file_upload_posbl').style.display = "block";
			document.getElementById('file_upload_imposbl').style.display = "none";			
		} else {
			document.getElementById('file_upload_posbl').style.display = "none";
			document.getElementById('file_upload_imposbl').style.display = "block";
		}
	}	
</script>
<title>사업신청 내역 수정</title>
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
					<form id="business" name="business" method="post" enctype="multipart/form-data">
						<input type="hidden" id="seq" name="seq" value="${result.seq }">
						<input type="hidden" id="w_name" name="w_name" value="${result.w_name }"/>
						<input type="hidden" name="fileAtchPosblAt" value="<c:out value='Y'/>" />
						<input type="hidden" name="posblAtchFileNumber" value="<c:out value='3'/>" />
						<input type="hidden" name="posblAtchFileSize" value="<c:out value='10'/>" />
						<input type="hidden" name="returnUrl" value="<c:url value='/updateBusiness_admin.do'/>" />
						<div>
							<h2>사업신청 내역 수정</h2>
						</div>
						<div class="search_service">
							<div class="search_top_table">
								<table width="100%" border="0" cellpadding="0" cellspacing="1" class="generalTable">
									<tr>
										<td class="td_width">신청년도</th>
										<td class="td_content">
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
										<td class="td_width">사업신청명</td>
										<td class="td_content">
											<input type="text" id="business_name" name="business_name" value="${result.business_name }"/>
										</td>
									</tr>
									<tr>
										<td class="td_width">대학명</td>
										<td class="td_content">
											<input type="text" id="univ_name" name="univ_name" value="${result.univ_name }"/>
										</td>
									</tr>
									<tr>
										<td class="td_width">이름</td>
										<td class="td_content">${result.w_name }</td>
									</tr>
									<tr>
										<td class="td_width">신청상태</td>
										<td class="td_content">
											<select id="state" name="state">
												<c:choose>
													<c:when test="${result.state == '1' }">
														<option value="1" selected="selected">진행중</option>
														<option value="2">보완요청</option>
														<option value="3">보완완료</option>
														<option value="4">승인</option>
													</c:when>
													<c:when test="${result.state == '2' }">
														<option value="1">진행중</option>
														<option value="2" selected="selected">보완요청</option>
														<option value="3">보완완료</option>
														<option value="4">승인</option>
													</c:when>
													<c:when test="${result.state == '3' }">
														<option value="1">진행중</option>
														<option value="2">보완요청</option>
														<option value="3" selected="selected">보완완료</option>
														<option value="4">승인</option>
													</c:when>
													<c:otherwise>
														<option value="1">진행중</option>
														<option value="2">보완요청</option>
														<option value="3">보완완료</option>
														<option value="4" selected="selected">승인</option>
													</c:otherwise>
												</c:choose>
											</select>
										</td>
									</tr>
									<tr>
										<td class="td_width">보완요청</td>
										<td class="td_content">
											<textarea id="supplement_req" name="supplement_req" class="textarea" cols="95" rows="10">${result.supplement_req}</textarea>
										</td>
									</tr>
									<tr>
										<td class="td_width">기타</td>
										<td class="td_content">
											<textarea id="etc_explain" name="etc_explain" class="textarea" cols="95" rows="10">${result.etc_explain}</textarea>
										</td>
									</tr>
									<%-- <tr>
										<td class="td_width">기타1</td>
										<td>
											<textarea id="etc1" name="etc1" class="textarea" cols="95" rows="28">${result.etc1}</textarea>
										</td>
									</tr>
									<tr>
										<td class="td_width">기타2</td>
										<td>
											<textarea id="etc2" name="etc2" class="textarea" cols="95" rows="28">${result.etc2}</textarea>
										</td>
									</tr>
									<tr>
										<td class="td_width">기타3</td>
										<td>
											<textarea id="etc3" name="etc3" class="textarea" cols="95" rows="28">${result.etc3}</textarea>
										</td>
									</tr> --%>
									<c:if test="${not empty result.file}">
										<tr>
											<td class="td_width"><spring:message
													code="cop.atchFileList" /></td>
											<td class="td_content"><c:import
													url="/cmm/fms/selectFileInfsForUpdate.do"
													charEncoding="utf-8">
													<c:param name="param_atchFileId"
														value="${result.file}" />
												</c:import></td>
										</tr>
									</c:if>
									<tr>
										<td class="td_width"><label for="egovComFileUploader"><spring:message
													code="cop.atchFile" /></label></td>
										<td class="td_content">
											<div id="file_upload_posbl" style="display: none;">
												<input name="file_1" id="egovComFileUploader" type="file" />
												<div id="egovComFileList"></div>
											</div>
											<div id="file_upload_imposbl" style="display: none;">
												<spring:message code="common.imposbl.fileupload" />
											</div> <c:if test="${empty result.file}">
												<input type="hidden" id="fileListCnt" name="fileListCnt"
													value="0" />
											</c:if>
										</td>
									</tr>
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
							            var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), uploadableFileNum );
							            multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );
							        } else {
							            fn_egov_check_file('N');
							        }           
							     </script>
							</div>
						</div>
						<!-- 목록/저장버튼  시작-->
						<table border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td>
									<div class="buttons" align="center" style="margin-bottom: 100px">
										<a href="#LINK" onclick="javascript:fn_egov_regist_notice(); return false;">수정</a>
										<a href="#LINK" onclick="javascript:fn_egov_select_noticeView(); return false;">목록</a>
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