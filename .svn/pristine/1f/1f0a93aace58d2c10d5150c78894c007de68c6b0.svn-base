<!-- 2019.11.11 콘텐츠페이지 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String url = "";
String url_address = "";
String jsp_url ="";
String full_url ="";
if(request.getAttribute("url") != null){
	url = (String)request.getAttribute("url");
 	jsp_url =url+".jsp"; 	
}
full_url= "/usr/contents.do?url="+url;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>경기도형 대학생 취업브리지</title>
<link href="<c:url value='/'/>css/font.css"" rel="stylesheet" type="text/css">
<link href="<c:url value='/'/>css/reset.css" rel="stylesheet" type="text/css">
<link href="<c:url value='/'/>css/slick.css" rel="stylesheet" type="text/css">
<link href="<c:url value='/'/>css/layout.css" rel="stylesheet" type="text/css">
<link href="<c:url value='/'/>css/only_ie.css" rel="stylesheet" type="text/css">
<link href="<c:url value='/'/>css/style.css" rel="stylesheet" type="text/css">
<link href="<c:url value='/'/>css/mobile.css" rel="stylesheet" type="text/css">
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet"	type="text/css">
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/www-player-webp-vflfcplvs.css"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>
</head>
<body>
	<noscript>
		<p>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</p>
	</noscript>
	<!-- wrap start -->
	<div id="wrap">
		<!-- header start -->
		<div id="subheader">
			<c:import url="/sym/mms/EgovMainMenuHead.do" />
		</div>
		<!-- //header end -->
		<div class="content-wrap">
			<div class="path-wrap">
				<div class="base-inner">
					<div class="path-list-box">
						<ul>
							<li><a href="#none"><span class="ico-home">홈</span></a></li>
							<c:forEach var="list" items="${list }">
								<c:set var="chkURL" value="${list.chkURL }"/>
								<c:set var="url" value="<%=full_url %>"/>
								
								<c:if test="${chkURL == url }">								
									<li>${list.relateImageNm }</li><li>${list.menuNm }</li>
								</c:if>
								
							</c:forEach>
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
			<div class="cont-body-wrap">
				<div class="cont-tit-box">
					<c:forEach var="list" items="${list }">
					
						<c:set var="chkURL" value="${list.chkURL }"/>
						<c:set var="url" value="<%=full_url %>"/>
						<c:if test="${chkURL == url }">
							<h2 class="h2">${list.menuNm }</h2>
						</c:if>
					</c:forEach>
				</div>
				<div class="body-box"">
					<div class="base-inner">
									
						<c:import url="<%=jsp_url%>" />
					
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
	<!-- //wrap end -->
</body>
</html>
<!-- 2019.11.11 콘텐츠페이지 수정 -->