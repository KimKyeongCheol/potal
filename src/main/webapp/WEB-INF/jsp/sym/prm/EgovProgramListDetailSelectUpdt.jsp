<!DOCTYPE html>
<%--
 /**
  * @Class Name : EgovProgramListDetailSelectUpdt.jsp
  * @Description : 프로그램목록 상세조회및 수정 화면
  * @Modification Ination
  * @
  * @  수정일              수정자            수정내용
  * @ ----------   --------   ---------------------------
  * @ 2009.03.10   이용               최초 생성
  *   2018.09.03   신용호            공통컴포넌트 3.8 개선
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  //String imagePath_icon   = "/images/egovframework/com/sym/prm/icon/";
  //String imagePath_button = "/images/egovframework/com/sym/prm/button/";
--%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/sym/prm/"/>
<c:set var="CssUrl" value="/css/egovframework/com/sym/prm/"/>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<title><spring:message code="comSymPrm.programListDetailSelectUpdt.title"/></title><!-- 프로그램목록 상세조회 /수정 -->
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<link href="<c:url value="/css/com22.css"/>" rel="stylesheet" type="text/css">
<link href="<c:url value="/css/button.css"/>" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="progrmManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script language="javascript1.2" type="text/javaScript">
<!--
/* ********************************************************
 * 수정처리 함수
 ******************************************************** */
function updateProgramListManage(form) {
	if(confirm("<spring:message code="common.save.msg" />")){

			document.progrmManageVO.action="<c:url value='/sym/prm/EgovProgramListDetailSelectUpdt.do' />";
			document.progrmManageVO.submit();

	}
}

/* ********************************************************
 * 삭제처리함수
 ******************************************************** */
function deleteProgramListManage(form) {
	if(confirm("<spring:message code="common.delete.msg" />")){
		form.action="<c:url value='/sym/prm/EgovProgramListManageDelete.do' />";
		form.submit();
	}
}

/* ********************************************************
 * 목록조회 함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/prm/EgovProgramListManageSelect.do' />";
}
<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
-->
</script>
</head>
<body>

<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="subheader"><c:import url="/sym/mms/EgovMainMenuHeadAdmin.do" /></div>  
    <!-- //header end -->
    <div id="bodywrap">
        <div id="leftmenu_div"><c:import url="/sym/mms/EgovMainMenuLeft.do" /></div>
        <div id="middle_content">
            <!-- 현재위치 네비게이션 시작 -->
            <div id="cur_loc">
                    <div id="cur_loc_align">
                        <ul>
                            <li>HOME</li>
                            <li>&gt;</li>
                            <li>포털시스템관리</li>
                            <li>&gt;</li>
                            <li>메뉴관리</li>
                            <li>&gt;</li>
                            <li><strong>메뉴관리리스트</strong></li>
                        </ul>
                    </div>
            </div>
 <div id="content_field"><!--contents start-->
        
        
            <!-- sub title start -->
            <div><h2>메뉴관리리스트</h2></div>
            <!-- sub title end -->
<c:set var="vprogrmFileNm"><spring:message code="comSymPrm.programListDetailSelectUpdt.progrmFileNm"/></c:set>
<c:set var="vprogrmStrePath"><spring:message code="comSymPrm.programListDetailSelectUpdt.progrmStrePath"/></c:set>
<c:set var="vprogrmKoreanNm"><spring:message code="comSymPrm.programListDetailSelectUpdt.progrmKoreanNm"/></c:set>
<c:set var="vprogrmDc"><spring:message code="comSymPrm.programListDetailSelectUpdt.progrmDc"/></c:set>
<c:set var="vurl"><spring:message code="comSymPrm.programListDetailSelectUpdt.url"/></c:set>

<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form:form commandName="progrmManageVO" name="progrmManageVO" method="post">

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><spring:message code="comSymPrm.programListDetailSelectUpdt.pageTop.title"/></h2><!-- 프로그램목록 상세조회 /수정 -->

	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:20%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="comSymPrm.programListDetailSelectUpdt.progrmFileNm"/> <span class="pilsu">*</span></th><!-- 프로그램파일명 -->
			<td class="left">
			    <form:input  path="progrmFileNm" size="50"  maxlength="50" title="${vprogrmFileNm}"/><!-- 프로그램파일명 -->
      			<form:errors path="progrmFileNm"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymPrm.programListDetailSelectUpdt.progrmStrePath"/> <span class="pilsu">*</span></th><!-- 저장경로 -->
			<td class="left">
			    <form:input  path="progrmStrePath" size="50"  maxlength="50" title="${vprogrmStrePath}"/><!-- 저장경로 -->
      			<form:errors path="progrmStrePath"/>
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymPrm.programListDetailSelectUpdt.progrmKoreanNm"/> <span class="pilsu">*</span></th><!-- 한글명 -->
			<td class="left">
			    <form:input path="progrmKoreanNm" size="60"  maxlength="60"  title="${vprogrmKoreanNm}"/><!-- 한글명 -->
      			<form:errors path="progrmKoreanNm" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymPrm.programListDetailSelectUpdt.url"/> <span class="pilsu">*</span></th>
			<td class="left">
			    <form:input path="URL" size="80"  maxlength="80" title="${vurl}" />
      			<form:errors path="URL" />
			</td>
		</tr>
		<tr>
			<th><spring:message code="comSymPrm.programListDetailSelectUpdt.progrmDc"/> <span class="pilsu">*</span></th><!-- 프로그램설명 -->
			<td class="left">
			    <form:textarea path="progrmDc" rows="14" cols="75" title="${vprogrmDc}"/><!-- 프로그램설명 -->
      			<form:errors path="progrmDc"/>
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<span class="btn_s"><a href="<c:url value='/sym/prm/EgovProgramListManageSelect.do'/>" onclick="selectList(); return false;"><spring:message code="button.list"/></a></span><!-- 목록 -->
		<input class="s_submit" type="submit" value='<spring:message code="button.update" />' onclick="updateProgramListManage(document.forms[0]); return false;" /><!-- 수정 -->
		<span class="btn_s"><a href="<c:url value='/sym/prm/EgovProgramListManageDelete.do'/>?progrmFileNm=<c:out value="${progrmManageVO.progrmFileNm  }"/>" onclick="deleteProgramListManage(document.forms[0]); return false;"><spring:message code="button.delete" /></a></span><!-- 삭제 -->
	</div>
	<div style="clear:both;"></div>
</div>

<input name="cmd" type="hidden" value="<c:out value='update'/>"/>
</form:form>

</div>
</div>
</div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=admin/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
</body>
</html>