<!-- 2019.11.11 콘텐츠페이지 수정 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="egovframework.com.cmm.LoginVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>경기도형 대학생 취업브리지</title>
<link href="<c:url value='/'/>css/import.css" rel="stylesheet"
	type="text/css">
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
							<h2 class="h2">${list.menuNm }</h2>
					</c:forEach>
				</div>
				<div class="body-box"">
					<div class="base-inner">
			<!-- topmenu start -->
<script type="text/javascript">
function Page_move(url,uid){

	var menu_id = url;
	
	var substring ="/MberDelete.do";
	
if(menu_id.indexOf(substring) !== -1){
	var result = confirm("탈퇴를 하시겠습니까?"); 
	if(result == true) {
		location.href=url+"?selectedId="+uid;
		} else {
			return;
		
		}

}else{
	location.href=url+"?selectedId="+uid;	
	
}

 /* location.href=url+"?selectedId="+uid; */
}
	
</script>

            <%
					LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");
				
				%>

		

				<c:set var="loginName" value="<%=loginVO.getName()%>" />
				<c:set var="loginId" value="<%=loginVO.getId()%>" />
				<c:set var="loginName" value="<%=loginVO.getName()%>" />
				<c:set var="uniqId" value="<%=loginVO.getUniqId()%>" />
				<c:set var="userTy" value="<%=loginVO.getUserSe()%>" />


		<ul><%if(loginVO == null){ %>
			<c:forEach var="result" items="${list_headmenu}" varStatus="status">
				<c:if test="${result.upperMenuId eq 0 }">
					<c:choose>
						<c:when test="${result.menuNo eq 1100000}">
							<li class=""><%-- <a href="#LINK"	onclick="javascript:goMenuPage('<c:out value="${result.menuNo}"/>')"><c:out	value="${result.menuNm}" /></a> --%>
							<ul>
								<c:forEach var="sub_result" items="${list_submenu}" varStatus="status">
							<c:if test="${sub_result.upperMenuId eq result.menuNo}">
									<li>
												<a href="#LINK"	onclick="javascript:Page_move('<c:out value="${sub_result.chkURL}"/>','<c:out value="${uniqId}"/>')">
													<span><c:out value="${sub_result.menuNm}" /></span>
												</a></li>
								</c:if>
								</c:forEach>
							</ul>
							</li>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</c:if>
			</c:forEach>
			<%}else{ %>
		
			<c:forEach var="result" items="${list_headmenu}" varStatus="status">
				<c:if test="${result.upperMenuId eq 0 }">
				
						<c:if test="${result.menuNo eq 1200000}">
							<li class=""><%-- <a href="#LINK"	onclick="javascript:goMenuPage('<c:out value="${result.menuNo}"/>')"><c:out	value="${result.menuNm}" /></a> --%>
							<ul>
								<c:forEach var="sub_result" items="${list_submenu}" varStatus="status">
							<c:if test="${sub_result.upperMenuId eq result.menuNo}">
									<li>
												<a href="#LINK"
													onclick="javascript:Page_move('<c:url value="${sub_result.chkURL}"/>','<%=loginVO.getUniqId()%>')">
													<span><c:out value="${sub_result.menuNm}" /></span>
												</a></li>
								</c:if>
								</c:forEach>
							</ul>
							</li>
				</c:if>
				</c:if>
			</c:forEach>
			<%} %>
		</ul>
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