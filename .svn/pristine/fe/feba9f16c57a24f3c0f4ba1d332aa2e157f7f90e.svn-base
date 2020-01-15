<%--
  Class Name : EgovIncHeader.jsp
  Description : 화면상단 Header(include)
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="egovframework.com.cmm.LoginVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript">
function chageLangSelect(sts){
	
	var url= sts;
	
	window.open(url, '_blank'); 

}
</script>
<div class="hd-top-wrap clear">
	<div class="base-inner">
		<div class="hd-logo-box">
			<a href="<c:url value='/mainPage.do'/>"><h1>경기도형 대학생 취업브리지</h1></a>
		</div>

		<div class="hd-search-box">
			<div class="inner">

<script>
			function Search(){
				var searc_txt = document.getElementById('search').value;
				
				if(searc_txt == null || searc_txt == ""){
					alert("검색어를 입력해주세요");
				}else{
					 document.TopSearchForm.submit();
					
				}
			}
			</script>

				<form action="<c:url value='/Search.do'/>"  name="TopSearchForm" method="post">
					<fieldset>
					
							<input type="text" title="검색단어" class="input" name="searchWrd"	id="search">
							<a href="#" onclick="javascript:Search();" class="ico-search">검색버튼</a>
					</fieldset>
				</form>
				<!-- <form action="#LINK" name="TopSearchForm" method="post">
					<fieldset>
						<input type="text" title="검색단어" class="input" name="search"
							id="search"> <a href="" class="ico-search">검색버튼</a>
					</fieldset>
				</form> -->

			</div>
		</div>

		<div class="hd-util-box">
			<ul>
				<%
					LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");
					if (loginVO == null) {
				%>

				<li class="on"><a
					href="<c:url value='/uat/uia/egovLoginUsr.do'/>">로그인</a></li>
					<li><a href="<c:url value='/Terms.do'/>">회원가입</a></li>
				<%
					} else {
				%>
				<c:set var="loginName" value="<%=loginVO.getName()%>" />
				<c:set var="loginId" value="<%=loginVO.getId()%>" />
				<c:set var="loginName" value="<%=loginVO.getName()%>" />
				<c:set var="uniqId" value="<%=loginVO.getUniqId()%>" />
				<c:set var="userTy" value="<%=loginVO.getUserSe()%>" />
				<li><a href="#LINK"
					onclick="alert('개인정보 확인 등의 링크 제공'); return false;"><c:out
							value="${loginName}" /> 님</a></li>
				<li>|</li>
				<li><a href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a></li>
				<li>|</li>
				
				<li><%-- <a href="<c:url value='/MberUpdtView.do'/>">마이페이지</a> --%>
				<a href="<c:url value='/member_pw.do'/>">마이페이지</a>
				
					</li>
				<%
					}
				%>

			</ul>
		</div>
	</div>
</div>

<!-- topmenu start -->
<script type="text/javascript">
	function getLastLink(menuNo) {
		var tNode = new Array;
		for (var i = 0; i < document.menuListForm.tmp_menuNm.length; i++) {
			tNode[i] = document.menuListForm.tmp_menuNm[i].value;
			var nValue = tNode[i].split("|");
			//선택된 메뉴(menuNo)의 하위 메뉴중 첫번재 메뉴의 링크정보를 리턴한다.
			if (nValue[1] == menuNo) {
				if (nValue[5] != "dir" && nValue[5] != "" && nValue[5] != "/") {
					//링크정보가 있으면 링크정보를 리턴한다.
					return nValue[5];
				} else {
					//링크정보가 없으면 하위 메뉴중 첫번째 메뉴의 링크정보를 리턴한다.
					return getLastLink(nValue[0]);
				}
			}
		}
	}
	function goMenuPage(menuNo) {
		document.getElementById("menuNo").value = menuNo;
		document.getElementById("link").value = "forward:"
				+ getLastLink(menuNo);
		document.menuListForm.action = "<c:url value='/EgovPageLink_usr.do'/>";
		document.menuListForm.submit();
	}

	function goMenuPage_Sub(menuNo, chkURL) {
/* 		document.getElementById("menuNo").value = menuNo;
		document.getElementById("link").value = "forward:" + chkURL;

		document.menuListForm.action = "<c:url value='/EgovPageLink_usr.do'/>";
		document.menuListForm.submit(); */

	}
	function actionLogout() {
		document.selectOne.action = "<c:url value='/uat/uia/actionLogout.do'/>";
		document.selectOne.submit();
	}
	function fnSelectUser(id) {
		document.listForm.selectedId.value = id;
		array = id.split(":");
		if(array[0] == "") {
		} else {
		    userTy = array[0];
		    userId = array[1];    
		}
		document.listForm.selectedId.value = userId;
	    document.listForm.action = "<c:url value='/uss/umt/mber/EgovMberSelectUpdtView.do'/>";
	    document.listForm.submit();
	}
</script>
<div class="gnb-wrap pc">
	<div class="gnb-menu-bg" style="height: 0px;">
		<div class="inner"></div>
	</div>
	<div class="base-inner">
		<ul class="gnb-menu-list-box">
			<c:forEach var="result" items="${list_headmenu}" varStatus="status">


				<li class=""><c:if test="${result.upperMenuId eq 0}">
						<c:if
							test="${5000000 ne result.menuNo && 6000000 ne result.menuNo && 1100000 ne result.menuNo && 1200000 ne result.menuNo}">
							<a href="#LINK"
								onclick="javascript:goMenuPage('<c:out value="${result.menuNo}"/>')"><c:out
									value="${result.menuNm}" /> </a>
						</c:if>
					</c:if>
					<div class="" style="height: 0px;">
						<ul>
							<c:forEach var="sub_result" items="${list_submenu}"
								varStatus="status">
								<%-- 			<c:if test="${sub_result.upperMenuId > 0 }"> --%>

								<c:if test="${sub_result.upperMenuId eq result.menuNo}">
									<c:set var="TextValue" value="${sub_result.chkURL}" />
									<li>
									<%-- 
												<a href="<c:url value='/usr/contents.do'/>?url=<c:out value="${sub_result.chkURL}"/>&menuNo=<c:out value="${result.menuNo}"/>">
													<span><c:out value="${sub_result.menuNm}" /></span>
												</a>  --%>
												
												<a href="<c:url value="${sub_result.chkURL}"/>"/>
													<span><c:out value="${sub_result.menuNm}" /></span>
												</a> 
												
											
												
												
												</li>
								</c:if>
								<%-- 			</c:if> --%>
							</c:forEach>
						</ul>
					</div></li>


			</c:forEach>
		</ul>
		<form name="menuListForm" action="/sym/mnu/mpm/EgovMenuListSelect.do"
			method="post">
			<input type="hidden" id="menuNo" name="menuNo"
				value="<%=session.getAttribute("menuNo")%>" /> <input type="hidden"
				id="link" name="link" value="" />
			<div style="width: 0px; height: 0px;">
				<c:forEach var="result" items="${list_menulist}" varStatus="status">
					<input type="hidden" name="tmp_menuNm"
						value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.relateImagePath}|${result.relateImageNm}|${result.chkURL}|" />
				</c:forEach>
			</div>
		</form>
		<div class="btn-menu">
			<a href="javascript:;" class="btnSitemap">메뉴열기</a>
			<!-- 2019-11-02  add btnSitemap -->
		</div>
	</div>
</div>

<div class="hd-menu mb">
 		 	<div class="base-inner">
		 		<div class="hd-logo">
		 			<h1><a href="" class="">경기도형 대학생 취업브리지</a></h1>
		 		</div>
				<a href="javascript:;" class="m-hd-menu">메뉴열기</a>
		 	</div>
		 </div>




<div class="nav-list mb" style="width: 100%; left: 0px;"><!-- 2019-11-02 mod -->
		<div class="m-hd-top">
		<%
				if (loginVO == null) {
				%>
		
	<a href="<c:url value='/uat/uia/egovLoginUsr.do'/>" class="btn-login"><span class="ico"></span>로그인</a>
			<a href="<c:url value='/MberRegist.do'/>" class="btn-join"><span class="ico"></span>회원가입</a>
			<%}else{ %>
				<c:set var="loginName" value="<%=loginVO.getName()%>" />
				<c:set var="loginId" value="<%=loginVO.getId()%>" />
				<c:set var="loginName" value="<%=loginVO.getName()%>" />
				<c:set var="uniqId" value="<%=loginVO.getUniqId()%>" />
				<c:set var="userTy" value="<%=loginVO.getUserSe()%>" />
				<a href="#LINK"
					onclick="alert('개인정보 확인 등의 링크 제공'); return false;"><c:out
							value="${loginName}" /> 님</a>
				<a href="<c:url value='/uat/uia/actionLogout.do'/>">로그아웃</a>

			<%} %>
			<a href="javascript:;" class="m-hd-menu-close close">메뉴닫기</a>
		</div>
 		<ul>
 		<c:forEach var="result" items="${list_headmenu}" varStatus="status">
			
					
			<li>
						<c:if test="${result.upperMenuId eq 0 }">
						<c:if test="${5000000 ne result.menuNo && 6000000 ne result.menuNo && 1100000 ne result.menuNo && 1200000 ne result.menuNo}">
						<a href="javascript:;"><c:out	value="${result.menuNm}" />
						</a>
						</c:if>
		</c:if>
 					<div class="">
						<ul>
						<c:forEach var="sub_result"  items="${list_submenu}" varStatus="status">
				<%-- 			<c:if test="${sub_result.upperMenuId > 0 }"> --%>

							<c:if test="${sub_result.upperMenuId eq result.menuNo}">
									<c:set var="TextValue" value="${sub_result.chkURL}" />
									<li>
	<%-- 										<a href="#LINK"
													onclick="javascript:goMenuPage_Sub('<c:out value="${result.menuNo}"/>','<c:out value="${sub_result.chkURL}"/>')">
													<span><c:out value="${sub_result.menuNm}" /></span>
												</a> --%>
												
																																				
												<a href="<c:url value="${sub_result.chkURL}"/>"/>
													<span><c:out value="${sub_result.menuNm}" /></span>
												</a> 
												
									</li>
								</c:if>
				<%-- 			</c:if> --%>
							</c:forEach>
						</ul>
					</div>
			</li>
			

			</c:forEach>
		
		</ul>
	</div>
