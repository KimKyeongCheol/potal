<%
 /**
  * @Class Name : EgovCcmCmmnCodeRegist.jsp
  * @Description : 공통코드 등록 화면
  * @Modification Information
  * @
  * @  수정일             수정자                   수정내용
  * @ -------    --------    ---------------------------
  * @ 2009.02.01   박정규              최초 생성
  *   2017.08.18   이정은              표준프레임워크 v3.7 개선
  *
  *  @author 공통서비스팀 
  *  @since 2009.02.01
  *  @version 1.0
  *  @see
  *  
  */
%>
<%  
/* response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache"); */
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="pageTitle"><spring:message code="comSymCcmCca.cmmnCodeVO.title"/></c:set>
<!DOCTYPE html>
<html>
<head>


<title>${pageTitle} <spring:message code="title.list" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/com22.css' />">
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="cmmnCodeVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init(){

	// 첫 입력란에 포커스
	document.getElementById("cmmnCodeVO").codeId.focus();

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_code(){
	location.href = "<c:url value='/sym/ccm/cca/SelectCcmCmmnCodeList.do' />";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_regist_code(form){
	
	var cId = document.getElementById("codeId").value;
	var cNm = document.getElementById("codeIdNm").value;
	var cDc = document.getElementById("codeIdDc").value;
	var cLc = document.getElementById("clCode").value;
	var cIdLength =cId.length;
	


if(cIdLength > 12){
	alert("코드ID의 길이를 12자 이내로 수정해주세요.");
	false;
}else{
if(cLc != ""){
	if(cId !=  ""){
		if(cNm != ""){
			if(cDc != ""){
				 if(confirm("<spring:message code="common.regist.msg" />")){
					 

						document.cmmnCodeVO.action;
					}
				
			}else{
				alert("코드ID설명을 입력해주세요.");
			}
			
		}else{
			alert("코드ID명을 입력해주세요.");
		}
		
		
	}else{
		alert("코드ID를 입력해주세요.");
	}
	
}else{
	alert("분류코드명을 선택해주세요.");
}


	
	


	//input item Client-Side validate
	//if (!validateCmmnCodeVO(form)) {	

		/* return false; */
	//} else {

		//if(confirm("<spring:message code="common.regist.msg" />")){	

			/* form.submit();	 */
		//}
	//}

	
}	
}

/* ********************************************************
* 서버 처리 후 메세지 화면에 보여주기
******************************************************** */
function fncShowMessg(){
	if("<c:out value='${message}'/>" != ''){
	alert("<c:out value='${message}'/>");
	}
}

</script>

</head>
<body onLoad="fn_egov_init(); fncShowMessg();">
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
                            <li>사용자권한관리</li>
                            <li>&gt;</li>
                            <li><strong>공통코드</strong></li>
                        </ul>
                    </div>
            </div>
 <div id="content_field"><!--contents start-->
        
        
            <!-- sub title start -->
            <div><h2>공통코드</h2></div>
            <!-- sub title end -->


<form:form commandName="cmmnCodeVO" method="post" 
action="${pageContext.request.contextPath}/sym/ccm/cca/RegistCcmCmmnCode.do" onSubmit="fn_egov_regist_code(document.forms[0]); return false;"> 
<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2>${pageTitle} <spring:message code="title.create" /></h2>
	
	<!-- 등록폼 -->
	<table class="wTable" summary="<spring:message code="common.summary.list" arguments="${pageTitle}" />">
	<caption>${pageTitle } <spring:message code="title.create" /></caption>
	<colgroup>
		<col style="width: 20%;"><col style="width: ;">
	</colgroup>
	<tbody>
		<!-- 입력/선택 -->
		<c:set var="inputTxt"><spring:message code="input.input" /></c:set>
		<c:set var="inputSelect"><spring:message code="input.select"/></c:set>
		<c:set var="inputYes"><spring:message code="input.yes" /></c:set>
		<c:set var="inputNo"><spring:message code="input.no" /></c:set>
		<!-- 분류코드명 -->
		<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.clCodeNm"/> </c:set>
		<tr>
			<th><label for="clCode">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:select path="clCode" title="${title} ${inputSelect }" >
			    			<form:option value="" label="${inputSelect}"/>
 							<form:options items="${clCodeList}"  itemValue="clCode" itemLabel="clCodeNm"/>
				</form:select>
   				<div><form:errors path="clCode" cssClass="error" /></div>     
			</td>
		</tr>
				
		<!-- 코드ID -->
		<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.codeId"/> </c:set>
		<tr>
			<th><label for="codeId">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:input path="codeId" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="codeId" cssClass="error" /></div>     
			</td>
		</tr>

		<!-- 코드ID명 -->
		<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.codeIdNm"/> </c:set>
		<tr>
			<th><label for="codeIdNm">${title} <span class="pilsu">*</span></label></th>
			<td class="left">
			    <form:input path="codeIdNm" title="${title} ${inputTxt}" size="70" maxlength="70" />
   				<div><form:errors path="codeIdNm" cssClass="error" /></div>     
			</td>
		</tr>
		
		<!-- 코드ID설명 -->
		<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.codeIdDc"/> </c:set>
		<tr>
			<th><label for="codeIdDc">${title } <span class="pilsu">*</span></label></th>
			<td class="nopd">
				<form:textarea path="codeIdDc" title="${title} ${inputTxt}" cols="300" rows="20" />   
				<div><form:errors path="codeIdDc" cssClass="error" /></div>  
			</td>
		</tr>
		
		<!-- 사용여부 -->
		<c:set var="title"><spring:message code="comSymCcmCca.cmmnCodeVO.useAt"/> </c:set>
		<tr>
			<th>${title } <span class="pilsu">*</span></th>
			<td class="left">
				<form:select path="useAt" title="${title} ${inputTxt }" cssClass="txt">
					<form:option value="Y"  label=" ${inputYes}"/>
					<form:option value="N" label=" ${inputNo}"/>
				</form:select>
				<div><form:errors path="useAt" cssClass="error" /></div>       
			</td>
		</tr>
		
	</tbody>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input type="submit" class="s_submit" value="<spring:message code="button.create" />" title="<spring:message code="button.create" /> <spring:message code="input.button" />" />
		<span class="btn_s"><a href="<c:url value='/sym/ccm/cca/SelectCcmCmmnCodeList.do' />" title="<spring:message code="button.list" />  <spring:message code="input.button" />"><spring:message code="button.list" /></a></span>
	</div><div style="clear:both;"></div>
	
</div>

<input name="cmd" type="hidden" value="<c:out value='save'/>">
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
