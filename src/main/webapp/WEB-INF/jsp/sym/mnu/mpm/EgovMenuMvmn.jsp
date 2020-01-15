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
  * @Class Name : EgovMenuMvmn.jsp
  * @Description : 메뉴이동 화면
  * @Modification Information
  * @
  * @ 수정일               수정자            수정내용
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
  String imagePath_icon   = "/images/egovframework/com/sym/mnu/mpm/icon/";
  String imagePath_button = "/images/egovframework/com/sym/mnu/mpm/button/";

%>
<html lang="ko">
<head>
<title>${pageTitle} <spring:message code="title.detail" /></title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="<c:url value='/'/>css/default.css" type="text/css" >
<link type="text/css" rel="stylesheet" href="<c:url value='/css/com22.css' />">
<title><spring:message code="comSymMnuMpm.menuMvmn.title"/></title><!-- 메뉴이동 -->
<link href="<c:url value="/css/button.css"/>" rel="stylesheet" type="text/css">
<script type="text/javascript">
var imgpath = "<c:url value='/pst_webapp/images/egovframework/com/cmm/utl/'/>";
</script>
<script language="javascript1.2" type="text/javaScript" src="<c:url value='/js/EgovMenuList.js' />" /></script>
<script language="javascript1.2" type="text/javaScript">
<!--
function selectProgramListSearch() {
	progrmManageForm.submit();
}
function choisProgramListSearch(vFileNm) {
	eval("opener.document.all."+opener.document.all.tmp_SearchElementName.value).value = vFileNm;
    window.close();
}

/* ********************************************************
 * 상세내역조회 함수
 ******************************************************** */
function choiceNodes(nodeNum) {
	var nodeValues = treeNodes[nodeNum].split("|");
	opener.document.menuManageVO.upperMenuId.value = nodeValues[4];
    window.close();
}
/* ********************************************************
 * 조회 함수
 ******************************************************** */
function selectMenuListTmp() {
	document.menuListForm.req_RetrunPath.value = "<c:url value='/sym/mnu/mpm/EgovMenuMvmn'/>";
    document.menuListForm.action = "<c:url value='/sym/mnu/mpm/EgovMenuListSelectTmp.do'/>";
    document.menuListForm.submit();
}
-->
</script>
</head>
<body style="overflow-x:hidden;overflow-y:auto">

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
            
<form name="searchUpperMenuIdForm" action ="<c:url value='/sym/mnu/mpm/EgovMenuListSelectTmp.do'/>" method="post">
<div style="visibility:hidden;display:none;"><input name="iptSubmit" type="submit" value="전송" title="전송"></div>
<input type="hidden" name="req_RetrunPath" value="/sym/mnu/mpm/EgovMenuMvmn">
<c:forEach var="result" items="${list_menulist}" varStatus="status" >
<input type="hidden" name="tmp_menuNmVal" value="${result.menuNo}|${result.upperMenuId}|${result.menuNm}|${result.progrmFileNm}|${result.menuNo}|${result.menuOrdr}|${result.menuNm}|${result.upperMenuId}|${result.menuDc}|${result.relateImagePath}|${result.relateImageNm}|${result.progrmFileNm}|">
</c:forEach>

<div class="wTableFrm" style="width:580px">
	<!-- 타이틀 -->
	<h2><spring:message code="comSymMnuMpm.menuMvmn.pageTop.title"/></h2><!-- 메뉴이동 -->

	<!-- 등록폼 -->
	<table class="wTable">
		<colgroup>
			<col style="width:20%" />
			<col style="" />
		</colgroup>
		<tr>
			<th><spring:message code="comSymMnuMpm.menuMvmn.menuNo"/></th><!-- 이동할메뉴명 -->
			<td class="left">
			    <input name="progrmFileNm" type="text" size="30" value=""  maxlength="60" title="<spring:message code="comSymMnuMpm.menuMvmn.menuNo"/>"/>
			</td>
		</tr>
	</table>

	<div style="clear:both;"></div>
</div>

<DIV id="main" style="display:">

<table width="570" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="10">&nbsp;</td>
  </tr>
</table>

<table width="570" cellpadding="8" class="table-line">
  <tr>
    <td>
 		<div class="tree" style="width:400px;">
			<script language="javascript" type="text/javaScript">

			var Tree = new Array;
			
			if ( typeof document.searchUpperMenuIdForm.req_RetrunPath == "object"
					&& typeof document.searchUpperMenuIdForm.tmp_menuNmVal == "object"
					&& document.searchUpperMenuIdForm.tmp_menuNmVal.length > 0 ) {
				for (var j = 0; j < document.searchUpperMenuIdForm.tmp_menuNmVal.length; j++) {
					Tree[j] = document.searchUpperMenuIdForm.tmp_menuNmVal[j].value;
			    }
				createTree(Tree, true);
            }else{
            	alert("<spring:message code="comSymMnuMpm.menuMvmn.validate.alert.menu"/>");
            	window.close();
            }
           </script>
		</div>
    </td>
  </tr>
</table>
</DIV>

</form>

</div>
</div>
</div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=admin/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>

</body>
</html>
