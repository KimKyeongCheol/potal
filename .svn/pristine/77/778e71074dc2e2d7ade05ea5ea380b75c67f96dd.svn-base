<!DOCTYPE html>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
 /**
  * @Class Name : EgovMenuBndeRegist.jsp
  * @Description : 메뉴프로그램목록 일괄 등록 화면
  * @Modification Information
  * @
  * @ 수정일                수정자            수정내용
  * @ ----------   --------   ---------------------------
  * @ 2009.03.10   이용               최초 생성
  *   2018.09.10   신용호            표준프레임워크 v3.8 개선
  *
  *  @author 공통서비스 개발팀 이용
  *  @since 2009.03.10
  *  @version 1.0
  *  @see
  *
  */
  /* Image Path 설정 */
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mpm/icon";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mpm/button/";
%>
<head>
<title>${pageTitle} <spring:message code="title.detail" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/com22.css' />">
<title><spring:message code="comSymMnuMpm.menuRegist.title"/></title>
<link href="<c:url value="/css/ㅠutton.css"/>" rel="stylesheet" type="text/css">
<script  language="javascript1.2" type="text/javaScript">
/* ********************************************************
 * 메뉴일괄생성처리 함수
 ******************************************************** */
function insertMenuManage() {
	if(confirm("<spring:message code="comSymMnuMpm.menuBndeRegist.validate.confirm.insert"/>")){ //메뉴 일괄등록을 하시겠습니까?. \n 메뉴정보와  프로그램목록, 프로그램 변경내역 존재시 삭제 하실 수 없습니다.
	   if(checkFile()){
		   document.menuManageRegistForm.action ="<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do' />";
	      document.menuManageRegistForm.submit();
	   }
	}
}
/* ********************************************************
 * 메뉴일괄삭제처리 함수
 ******************************************************** */
function deleteMenuList() {
	if(confirm("<spring:message code="comSymMnuMpm.menuBndeRegist.validate.confirm.delete"/>")){ //메뉴일괄삭제를 하시겠습니까?. \n 메뉴정보와  프로그램목록, 프로그램 변경내역 데이타 모두 삭제 됩니다.
		document.menuManageRegistForm.action ="<c:url value='/sym/mnu/mpm/EgovMenuBndeAllDelete.do' />";
		document.menuManageRegistForm.submit();
	}
}
/* ********************************************************
 * 메뉴일괄등록시 등록파일 체크 함수
 ******************************************************** */
function checkFile(){
	if(document.menuManageRegistForm.file.value==""){
	   alert("<spring:message code="comSymMnuMpm.menuBndeRegist.validate.alert.checkFile"/>"); //업로드 할 파일을 지정해 주세요
	   return false;
	}

	var  str_dotlocation,str_ext,str_low;
	str_value  = document.menuManageRegistForm.file.value;
	str_low   = str_value.toLowerCase(str_value);
	str_dotlocation = str_low.lastIndexOf(".");
	str_ext   = str_low.substring(str_dotlocation+1);

	switch (str_ext) {
	  case "xls" :
	  case "xlsx" :
		 return true;
	     break;
	  default:
	     alert("<spring:message code="comSymMnuMpm.menuBndeRegist.validate.checkFile"/>"); //파일 형식이 맞지 않습니다.\n xls,xlsx만 업로드가 가능합니다!
	     return false;
	}
}

/* ********************************************************
 * 목록조회  함수
 ******************************************************** */
function selectList(){
	location.href = "<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do' />";
}

<c:if test="${!empty resultMsg}">alert("${resultMsg}");</c:if>
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

<noscript class="noScriptTitle"><spring:message code="common.noScriptTitle.msg" /></noscript><!-- 자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다. -->

<div class="wTableFrm">
	<!-- 타이틀 -->
	<h2><spring:message code="comSymMnuMpm.menuRegist.pageTop.title"/></h2>

	<form name="menuManageRegistForm" action ="<c:url value='/sym/mnu/mpm/EgovMenuBndeRegist.do'/>" method="post" enctype="multipart/form-data">

	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:16%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="comSymMnuMpm.menuBndeRegist.menuNo"/> <span class="pilsu">*</span></th>
			<td class="left">
				<input type = "file" name="file" size="40" title="<spring:message code='title.attachedFileSelect'/>">
			</td>
		</tr>
	</table>

	<!-- 하단 버튼 -->
	<div class="btn">
		<input class="s_submit" type="submit" value="<spring:message code="button.bulkUpload" />" onclick="insertMenuManage(); return false;" /><!-- 일괄등록 -->
		<span class="btn_s"><a href="<c:url value='/sym/mnu/mpm/EgovMenuManageSelect.do'/>" onclick="selectList(); return false;"><spring:message code="button.list"/></a></span><!-- 목록 -->
	</div>
	<div style="clear:both;"></div>

	<input name="cmd" type="hidden" value="<c:out value='bndeInsert'/>"/>
	</form>
	
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

