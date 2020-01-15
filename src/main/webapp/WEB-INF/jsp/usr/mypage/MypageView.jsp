<%--
  Class Name : EgovMberSelectUpdt.jsp
  Description : 일반회원상세조회, 수정 JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.02  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.02
--%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no">
<title>경기도형 대학생 취업브리지</title>
<link href="<c:url value='/'/>css/import.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/www-player-webp-vflfcplvs.css" rel="stylesheet" type="text/css" >

<!--[if lt IE 9]>
	<script src="../common/js/html5shiv.min.js"></script>
	<script src="../common/js/respond.min.js"></script>
<![endif]-->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnListPage(){
    document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberManage.do'/>";
    document.mberManageVO.submit();
}
function fnDeleteMber(checkedIds) {
    if(confirm("<spring:message code='common.delete.msg' />")){
        document.mberManageVO.checkedIdForDel.value=checkedIds;
        document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberDelete.do'/>";
        document.mberManageVO.submit(); 
    }
}
function fnPasswordMove(){
    document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberPasswordUpdtView.do'/>";
    document.mberManageVO.submit();
}
function fnUpdate(){
	document.mberManageVO.action = "<c:url value='/uss/umt/mber/EgovMberSelectUpdt.do'/>";
    if(validateMberManageVO(document.mberManageVO)){
        document.mberManageVO.submit();
    }
}

function back(){
	alert("back");
	window.histroy.back();
}
//-->
</script>
</head>
<body>

<!-- login status start -->
<div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div>
<!-- //login status end -->
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
						<li><a href="">마이페이지</a></li>
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
            <div class="base-inner">
            
            
            <form:form commandName="mberManageVO" name="mberManageVO"  method="post" >
            
            <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
            <input name="checkedIdForDel" type="hidden" />
            <!-- 검색조건 유지 -->
            <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
            <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
            <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
            <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
            <!-- 우편번호검색 -->
            <input type="hidden" name="zip_url" value="<c:url value='/sym/cmm/EgovCcmZipSearchPopup.do'/>" />
            <!-- 사용자유형정보 : password 수정화면으로 이동시 타겟 유형정보 확인용, 만약검색조건으로 유형이 포함될경우 혼란을 피하기위해 userTy명칭을 쓰지 않음-->
            <input type="hidden" name="userTyForPassword" value="<c:out value='${mberManageVO.userTy}'/>" />
        
            <!-- sub title start -->
            <div><h2>일반회원 상세조회</h2></div>
            <!-- sub title end -->
            
            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">                  
                    <table summary="일반회원정보 상세조회">
                        <tr> 
                            <td class="td_width"><label for="mberId">일반회원아이디</label>
                                <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
                            </td>
                            <td class="td_content">
                            <c:out value='${mberManageVO.mberId}'/>
                            </td>
                        </tr>
                        <tr> 
                            <td class="td_width"><label for="mberNm">일반회원이름</label>
                                <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
                            </td>
                            <td class="td_content">
                            
                            <c:out value='${mberManageVO.mberNm}'/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_width"><label for="sexdstnCode">성별</label></td>
                            <td class="td_content">
                            <c:choose>

<c:when test="${mberManageVO.sexdstnCode eq 'F'}"> 여자 </c:when>

<c:when test="${mberManageVO.sexdstnCode eq 'M'}"> 남자 </c:when>

<c:otherwise>  </c:otherwise>

</c:choose>
                            </td>
                        </tr>
                        <tr> 
                            <td class="td_width"><label for="areaNo">전화번호</label></td>
                            <td class="td_content">
                            <c:out value='${mberManageVO.areaNo}'/>
                                - 
                            <c:out value='${mberManageVO.middleTelno}'/>
                                - 
                            <c:out value='${mberManageVO.endTelno}'/>
                            </td>
                        </tr>
                        <tr> 
                        
                            <td class="td_width"><label for="mberFxnum">팩스번호</label></td>
                            <td class="td_content">
 <c:out value='${mberManageVO.mberFxnum}'/>
                            </td>
                        </tr>
                        <tr> 
                            <td class="td_width"><label for="moblphonNo">핸드폰번호</label></td>
                            <td class="td_content">
                             <c:out value='${mberManageVO.moblphonNo}'/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_width"><label for="mberEmailAdres">이메일주소</label></td>
                            <td class="td_content">
                                               <c:out value='${mberManageVO.mberEmailAdres}'/>
                            </td>
                        </tr>
                        <tr> 
                            <td class="td_width"><label for="zip">우편번호</label></td>
                            <td class="td_content">
                              <c:out value='${mberManageVO.zip}'/>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_width"><label for="adres">주소</label></td>
                            <td class="td_content">
                            <c:out value='${mberManageVO.adres}'/>
                            </td>
                        </tr>
                        <tr> 
                            <td class="td_width"><label for="detailAdres">상세주소</label></td>
                            <td class="td_content">
                            <c:out value='${mberManageVO.detailAdres}'/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--detail area end -->
                    
            <!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
                <!-- 수정 -->
                <a href="<c:url value='/MberUpdte.do'/>?selectedId=<c:out value="${mberManageVO.uniqId}"/>"  onclick="javascript:fnSelectUser('USR01:<c:out value="${mberManageVO.uniqId}"/>'); return false;">수정</a>
                <!-- 암호변경 -->
                <a href="<c:url value='/uss/umt/mber/MberPasswordUpdtView.do'/>" onclick="fnPasswordMove(); return false;"><spring:message code="button.passwordUpdate" /></a>
                <!-- 목록 -->
                <a href="javascript:history.back();">뒤로</a>
            </div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->
            <form:hidden path="password" />
            </form:form>

            </div><!-- contents end -->
        </div>
    </div>
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>
<!-- //wrap end -->

</body>
</html>