<!DOCTYPE html>
<%
 /**
  * @Class Name  : EgovRestdeDetail.jsp
  * @Description : EgovRestdeDetail 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.04.01   이중호              최초 생성
  *   2011.08.12   서준식              CSS 경로 수정
  *  @author 공통서비스팀
  *  @since 2009.04.01
  *  @version 1.0
  *  @see
  *
  */
%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<c:set var="pageTitle"><spring:message code="sym.cal.detail.title"/></c:set>
<html lang="ko">
<head>
<title>일정관리 <spring:message code="title.list" /></title>
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
<link href="<c:url value='/css/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_Restde(){
	location.href = "<c:url value='/CalList.do' />";
}
-->
</script>
</head>
<body>


<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="subheader"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>  
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
 <div id="content_field"><!--contents start-->
        

<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<div class="cont-body-wrap">
<div class="cont-tit-box">
	<h2 class="h2">일정 상세조회</h2>
</div>
<!-- class : body-box : (S) -->
				<div class="body-box">

					<!-- class : base-inner : (S) -->
					<div class="base-inner">
						<!-- class : board-view-box : (S) -->
						<div class="board-view-box">
		<!-- sub title start -->
								<div class="tit-box">
								  ${result.restdeNm}
								
								</div>
								
								<div class="date-box">
									<ul>
										<li>일정일자 : (<c:out value='${fn:substring(result.restdeDe, 0,4)}'/>-<c:out value='${fn:substring(result.restdeDe, 4,6)}'/>-<c:out value='${fn:substring(result.restdeDe, 6,8)}'/>)
-
			  										(<c:out value='${fn:substring(result.restdeDe_e, 0,4)}'/>-<c:out value='${fn:substring(result.restdeDe_e, 4,6)}'/>-<c:out value='${fn:substring(result.restdeDe_e, 6,8)}'/>)</li>
										<li>일정 구분 :  ${result.restdeSe} </li>
										<%-- <li class="line">조회수 : <c:out value="${result.inqireCo}" /></li> --%>
									</ul>
								</div>
								<div class="text-box" style="white-space:pre;">
								${result.restdeDc}
								</div>
	

	<!-- 하단 버튼 -->
	<div class="btn-box">
									<a class="btn-line" href="#noscript" onclick="fn_egov_list_Restde(); return false;"><spring:message code="button.list" /></a>
	</div>

	<div style="clear:both;"></div>
</div>


<form name="Form" method="post" action="">
	<input type=hidden name="restdeNo">
	<input type="submit" id="invisible" class="invisible">
</form>


</div>
</div>
</div>
</div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->

</div>

</body>
</html>
