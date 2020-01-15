<%--
  Class Name : EgovQnaDetailInqure.jsp
  Description : EgovQnaDetailInqure 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.02.01   박정규          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스개발팀 박정규
    since    : 2009.02.01
--%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>1:1 문의</title>
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
<script type="text/javascript"
	src="<c:url value='/js/showModalDialog.js'/>"></script>
<script type="text/javaScript" language="javascript">

	/* ********************************************************
	 * 목록 으로 가기
	 ******************************************************** */
	function fn_egov_inqire_qnalist() {

		document.QnaManageForm.action = "<c:url value='/QnaList.do'/>";
		document.QnaManageForm.submit();

	}

	/* ********************************************************
	 * 수정처리화면
	 ******************************************************** */
	function fn_egov_updt_qnacn(qaId) {

		// Update하기 위한 키값을 셋팅
		document.QnaManageForm.qaId.value = qaId;

		var url = "<c:url value='/QnaPasswordConfirmView.do'/>";
		var status = "dialogWidth=150px;dialogHeight=100px;resizable=no;center=yes";

		var agent = navigator.userAgent.toLowerCase();
		var browse = "";
		if(agent.indexOf("chrome") != -1)browse="chrome";
		if((navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) )browse="IE";
		
		// 작성비밀번호 확인 화면을 호출한다.
		if(browse == "chrome"){
			window.open(url, self, status);
		}else{
			var returnValue = window.showModalDialog(url, self, status);
			if (returnValue) {
				alert(returnValue);
				document.QnaManageForm.action = "<c:url value='/QnaPasswordConfirm.do'/>";
				document.QnaManageForm.submit();
			}
		}
		
	}

	function showModalDialogCallback(retVal) {
		if (retVal) {
			document.QnaManageForm.action = "<c:url value='/QnaPasswordConfirm.do'/>";
			document.QnaManageForm.submit();

		}
	}

	/**********************************************************
	 * 삭제처리화면
	 ******************************************************** */
	function fn_egov_delete_qnacn(qaId) {

		if (confirm("<spring:message code="common.delete.msg" />")) {

			// Delete하기 위한 키값을 셋팅
			document.QnaManageForm.qaId.value = qaId;
			document.QnaManageForm.action = "<c:url value='/QnaCnUpdt.do'/>";
			document.QnaManageForm.submit();

		}

	}

	/*********************************************************
	 * 작성비밀번호.체크..
	 ******************************************************** */
	function fn_egov_passwordConfirm() {

		alert("작성 비밀번호를 확인 바랍니다!");

	}
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
				<div class="cont-body-wrap">
					<div class="cont-tit-box">
						<h2 class="h2">1:1 문의</h2>
					</div>
					<!-- class : body-box : (S) -->
					<div class="body-box">

						<!-- class : base-inner : (S) -->
						<div class="base-inner">
							<!-- class : board-view-box : (S) -->
							<div class="board-view-box">
								<!-- 상단타이틀 -->
								<form name="QnaManageForm"
									action="<c:url value='/QnaPasswordConfirm.do'/>" method="post">
									<input name="qaId" type="hidden"
										value="<c:out value='${result.qaId}'/>">

									<div class="tit-box">
										[ 1:1문의 ] : :
										<c:out value="${result.qestnSj}" />

									</div>

									<div class="date-box">
										<ul>
											<li>작성자명: <c:out value="${result.wrterNm}" /></li>
											<li>전화 : <c:out value="${result.areaNo}" />-<c:out
													value="${result.middleTelno}" />-<c:out
													value="${result.endTelno}" /></li>
											<li>처리상태: <c:out value="${result.qnaProcessSttusCodeNm}" /></li>
											<li>등록일 : <c:out
													value='${fn:substring(result.writngDe, 0,4)}' />-<c:out
													value='${fn:substring(result.writngDe, 4,6)}' />-<c:out
													value='${fn:substring(result.writngDe, 6,8)}' />
											</li>
											<li class="line">조회수 : <c:out value="${result.inqireCo}" /></li>
										</ul>
									</div>
									<div>
										<label for="qestnCn">질문내용</label>&nbsp;&nbsp;
									</div>
									<div class="text-box" style="white-space: pre;">${result.qestnCn}</div>
									<!-- 답변내용이 있을경우 Display... -->
									<c:if test="${result.qnaProcessSttusCode == '3'}">

										<div class="date-box">
											<ul>
												<li>답변일자 : <c:out
														value='${fn:substring(result.answerDe, 0,4)}' />-<c:out
														value='${fn:substring(result.answerDe, 4,6)}' />-<c:out
														value='${fn:substring(result.answerDe, 6,8)}' /></li>
											</ul>
										</div>
										<div>
											<label for="qestnCn">답변내용</label>&nbsp;&nbsp;
										</div>
										<div class="text-box" style="white-space: pre;">${result.answerCn}</div>

									</c:if>


									<div class="btn-box">

										<%-- <input type="submit" value="<spring:message code="button.update" />" onclick="fn_egov_updt_qnacn('<c:out value="${result.qaId}"/>'); return false;" /> --%>
										<a class="btn-line" href="#"
											onclick="fn_egov_updt_qnacn('<c:out value="${result.qaId}"/>'); return false;"
											title="<spring:message code="button.update" />"> 수정</a> <a
											class="btn-line"
											href="<c:url value='/QnaCnUpdt.do'/>?qaId=<c:out value='${result.qaId}'/>"
											onclick="fn_egov_delete_qnacn('<c:out value="${result.qaId}"/>'); return false;"><spring:message
												code="button.delete" /></a> <a class="btn-line"
											href="<c:url value='/QnaList.do'/>"
											onclick="fn_egov_inqire_qnalist(); return false;"><spring:message
												code="button.list" /></a>

									</div>
									<!-- 목록/저장버튼  끝-->

									<c:if test="${result.passwordConfirmAt == 'N,'}">
										<tr>
											<td class="lt_text3" colspan=10><script
													type="text/javascript">
												fn_egov_passwordConfirm();
											</script></td>
										</tr>
									</c:if>

									<input id="writngPassword" name="writngPassword" type="hidden" value=""> <input
										name="passwordConfirmAt" type="hidden" value="">
									<input id="result" type="hidden" value="">

								</form>
							</div>
						</div>
					</div>

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