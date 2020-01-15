<!DOCTYPE html>
<%
 /**
  * @Class Name  : EgovRestdeModify.jsp
  * @Description : EgovRestdeModify 화면
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
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="sym.cal.modify.title"/></c:set>
<html lang="ko">
<head>
<title>일정관리 수정</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/com22.css' />">
<link href="<c:url value='/css/button.css' />" rel="stylesheet" type="text/css">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="restde" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript">
<!--
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_Restde(){
	location.href = "<c:url value='/sym/cal/EgovRestdeList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_Restde(form){
	if(confirm("<spring:message code='common.save.msg'/>")){
		if(!validateRestde(form)){
			return;
		}else{
			form.submit();
		}
	}
}
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
                            <li>달력관리</li>
                            <li>&gt;</li>
                            <li><strong>일정관리(달력)</strong></li>
                        </ul>
                    </div>
            </div>
 <div id="content_field"><!--contents start-->
        
        
            <!-- sub title start -->
            <div><h2>일정관리</h2></div>
            <!-- sub title end -->
<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript>

<form:form commandName="restde" name="restde" method="post">
<input name="cmd" type="hidden" value="Modify">
<form:hidden path="restdeNo"/>
<form:hidden path="restdeDe"/>

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>일정 수정</h2>

	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th>일정 일자 <span class="pilsu">*</span></th><!-- 일정일자 -->
			<td class="left">
			    <c:out value='${fn:substring(restde.restdeDe, 0,4)}'/>-<c:out value='${fn:substring(restde.restdeDe, 4,6)}'/>-<c:out value='${fn:substring(restde.restdeDe, 6,8)}'/>
			</td>
		</tr>
		<tr>
			<th>일정명 <span class="pilsu">*</span></th><!-- 일정명 -->
			<td class="left">
			    <form:input  path="restdeNm" size="50" maxlength="50" title="<spring:message code='sym.cal.restName' />"/>
      			<form:errors path="restdeNm"/>
			</td>
		</tr>
		<tr>
			<th>일정설명 <span class="pilsu">*</span></th><!-- 일정설명 -->
			<td class="left">
			    <form:textarea path="restdeDc" rows="3" cols="60" title="<spring:message code='sym.cal.restDetail' />"/>
      			<form:errors   path="restdeDc"/>
			</td>
		</tr>
		<tr>
			<th>일정구분 <span class="pilsu">*</span></th><!-- 일정구분 -->
			<td class="left">
			    <form:select path="restdeSeCode" title="<spring:message code='sym.cal.restCategory' />">
				<form:options items="${restdeCode}" itemValue="code" itemLabel="codeNm"/>
				</form:select>
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<span class="btn_s"><a href="#noscript" onclick="fn_egov_list_Restde(); return false;"><spring:message code="button.list" /></a></span><!-- 목록 -->
		<input class="s_submit" type="submit" value="<spring:message code="button.save" />" onclick="fn_egov_regist_Restde(document.restde); return false;" /><!-- 저장 -->
	</div>
	<div style="clear:both;"></div>
</div>


</form:form>


</div>
</div>
</div>
</div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=admin/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->

</div>
</body>
</html>
