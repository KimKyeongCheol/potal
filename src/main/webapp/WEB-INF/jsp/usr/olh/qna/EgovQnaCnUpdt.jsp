
<%
	response.setHeader("Cache-Control", "no-store");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
	if (request.getProtocol().equals("HTTP/1.1"))
		response.setHeader("Cache-Control", "no-cache");
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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="validator"
	uri="http://www.springmodules.org/tags/commons-validator"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>1:1문의 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
<validator:javascript formName="qnaManageVO" staticJavascript="false"
	xhtml="true" cdata="false" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/SE2/js/HuskyEZCreator.js"></script>
<script type="text/javascript">
	var oEditors = []; // 개발되어 있는 소스에 맞추느라, 전역변수로 사용하였지만, 지역변수로 사용해도 전혀 무관 함.
	$(document)
			.ready(
					function() {
						// Editor Setting
						nhn.husky.EZCreator
								.createInIFrame({
									oAppRef : oEditors, // 전역변수 명과 동일해야 함.
									elPlaceHolder : "qestnCn", // 에디터가 그려질 textarea ID 값과 동일 해야 함.
									sSkinURI : "${pageContext.request.contextPath}/SE2/SmartEditor2Skin.html", // Editor HTML
									fCreator : "createSEditor2", // SE2BasicCreator.js 메소드명이니 변경 금지 X
									htParams : {
										// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseToolbar : true,
										// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseVerticalResizer : true,
										// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
										bUseModeChanger : true,
									}
								});
					});
</script>

<validator:javascript formName="qnaManageVO" staticJavascript="false"
	xhtml="true" cdata="false" />

<script type="text/javaScript" language="javascript">
	/* ********************************************************
	 * 초기화
	 ******************************************************** */
	function fn_egov_initl_qnacn() {

		// 첫 입력란에 포커스..

	}

	/* ********************************************************
	 * 저장처리화면
	 ******************************************************** */
	function fn_egov_updt_qnacn(form, qaId) {

		oEditors.getById["qestnCn"].exec("UPDATE_CONTENTS_FIELD", []);

		if (!validateQnaManageVO(form)) {

			return;

		} else {

			form.qaId.value = qaId;
			form.action = "<c:url value='/QnaCnUpdt.do'/>";
			form.submit();

		}

	}

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_inqire_qnalist() {

		qnaManageVO.action = "<c:url value='/QnaList.do'/>";
		qnaManageVO.submit();

	}
</script>
</head>
<style>
#content_field {
	
}

#content_field h2 {
	font-size: 1.9rem;
	color: #000000;
	text-align: center;
	line-height: 1;
	margin-bottom: 2rem;
	font-weight: 400;
	position: relative;
	padding-top: 1.1rem;
}

.search_service {
	width: 64rem;
	position: relative;
	margin: 0 auto;
	max-width: 100%;
	padding-bottom: 25px;
}

.search_service table {
	width: 100%;
	border-top: 2px solid #444
}

.search_service table tr {
	border-bottom: 1px solid #999
}

.search_service table tr td {
	padding: 5px;
}

td.td_width {
	width: 24%;
	min-width: 115px;
}

.buttons a {
	border: 1px solid #0e050b;
	text-align: center;
	display: inline-block;
	width: 9rem;
	height: 2.3rem;
	line-height: 2.3rem;
	color: #0e050b;
	font-size: .9rem;
}
</style>
<body onLoad="fn_egov_initl_qnacn();">


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
								<li><a href="">알림마당</a></li>
								<li><a href="">1:1문의</a></li>
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

					<!-- 상단타이틀 -->
					<form:form commandName="qnaManageVO" name="qnaManageVO"
						action="${pageContext.request.contextPath}/QnaCnUpdt.do"
						method="post">
						<input name="qaId" type="hidden"
							value="<c:out value='${result.qaId}'/>">
						<input name="answerCn" type="hidden" value="Testing...">

						<!-- sub title start -->
						<div>
							<h2>Q&amp;A 등록 및 수정</h2>
						</div>
						<!-- sub title end -->

						<!--detail area start -->
						<div class="search_service">
							<div class="search_top_table">
								<table width="100%" border="0" cellpadding="0" cellspacing="1"
									class="table-register" summary="Q&amp;A에 대한 정보를 수정합니다.">
									<caption>Q&amp;A내용수정</caption>
									<tr>
										<td class="td_width"><label for="wrterNm">작성자명</label><img
											src="<c:url value='/'/>images/required.gif" width="15"
											height="15" alt="필수항목"></td>
										<td class="td_content"><form:input path="wrterNm"
												size="20" maxlength="20" title="작성자명" /> <form:errors
												path="wrterNm" /></td>
									</tr>

									<tr>
										<td class="td_width"><label for="writngPassword">작성
												비밀번호</label><img src="<c:url value='/'/>images/required.gif"
											width="15" height="15" alt="필수항목"></td>
										<td class="td_content"><input id="writngPassword"
											name="writngPassword" type="password" size="20"
											value="<c:out value='${result.writngPassword}'/>"
											maxlength="20" title="작성 비밀번호"></td>
									</tr>

									<tr>
										<td class="td_width"><label for="areaNo">전화번호</label></td>
										<td class="td_content"><form:input path="areaNo" size="4"
												maxlength="4" title="전화번호(지역)" />-<form:input
												path="middleTelno" size="4" maxlength="4" title="전화번호(국번)" />-<form:input
												path="endTelno" size="4" maxlength="4" title="전화번호(지번)" /> <form:errors
												path="areaNo" /> <form:errors path="middleTelno" /> <form:errors
												path="endTelno" /></td>
									</tr>

									<tr>
										<td class="td_width"><label for="emailAdres">이메일</label></td>
										<td class="td_content"><input id="emailAdres"
											name="emailAdres" type="text" size="30"
											value="<c:out value='${result.emailAdres}'/>" maxlength="30"
											title="이메일">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
											type="hidden" name="emailAnswerAt" id="emailAnswerAt"
											value="N" /></td>
									</tr>

									<tr>
										<td class="td_width"><label for="qestnSj">질문제목</label><img
											src="<c:url value='/'/>images/required.gif" width="15"
											height="15" alt="필수항목"></td>
										<td class="td_content"><form:input path="qestnSj"
												size="70" maxlength="70" title="질문제목" /> <form:errors
												path="qestnSj" /></td>
									</tr>

									<tr>
										<td class="td_width"><label for="qestnCn">질문내용</label><img
											src="<c:url value='/'/>images/required.gif" width="15"
											height="15" alt="필수항목"></td>
										<td class="td_content"><textarea id="qestnCn"
												name="qestnCn" cols="95" rows="20" cssClass="txaClass"
												title="질문내용">${result.qestnCn }</textarea> <form:errors
												path="qestnCn" /></td>
									</tr>

								</table>
							</div>
						</div>
						<!--detail area end -->

						<!-- 목록/저장버튼  시작-->
						<table border="0" cellspacing="0" cellpadding="0" align="center">
							<tr>
								<td>
									<div class="buttons" align="center"
										style="margin-bottom: 100px">
										<%-- <input type="submit"
											value="<spring:message code="button.save" />"
											onclick="fn_egov_updt_qnacn(document.qnaManageVO,'<c:out value="${result.qaId}"/>'); return false;" /> --%>
										<a href="#" onclick="fn_egov_updt_qnacn(document.qnaManageVO,'<c:out value="${result.qaId}"/>'); return false;" >수정</a>
										<a href="<c:url value='/QnaList.do'/>"
											onclick="fn_egov_inqire_qnalist(); return false;"><spring:message
												code="button.list" /></a>
									</div>
								</td>
							</tr>
						</table>
						<!-- 목록/저장버튼  끝-->

					</form:form>

				</div>
				<!-- contents end -->
			</div>
		</div>
		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" />
		</div>
		<!-- //footer 끝 -->
	</div>
	<!-- //wrap end -->

</body>
</html>