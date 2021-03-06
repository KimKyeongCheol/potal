<%--
  Class Name : EgovMberPasswordUpdt.jsp
  Description : 일반회원암호수정 JSP
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.04.02  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.04.02
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
<title>암호 수정</title>
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
<validator:javascript formName="passwordChgVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnUpdate(){
    if(validatePasswordChgVO(document.passwordChgVO)){
        if(document.passwordChgVO.newPassword.value != document.passwordChgVO.newPassword2.value){
            alert("<spring:message code='fail.user.passwordUpdate2' />");
            return;
        }
        document.passwordChgVO.submit();
    }
}
function Page_move(url) {

	var menu_id = url;

		location.href = url;


}



//-->
</script>
</head>
<body>
<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="subheader"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>  
    <!-- //header end -->
    
    <style>
	#content_field {   }
	#content_field h2 {    font-size: 1.9rem;
    color: #000000;
    text-align: center;
    line-height: 1;
    margin-bottom: 2rem;
    font-weight: 400;
    position: relative;
    padding-top: 1.1rem;}

	.search_service { width: 64rem;    position: relative;    margin: 0 auto;    max-width: 100%; padding-bottom:25px;}
	.search_service table {width:100%; border-top:2px solid #444}
	.search_service table tr {border-bottom:1px solid #999}
	.search_service table tr td {padding:5px;}
	td.td_width {width:24%;min-width:115px;}

	.buttons a {border: 1px solid #0e050b;
    text-align: center;
    display: inline-block;
    width: 9rem;
    height: 2.3rem;
    line-height: 2.3rem;
    color: #0e050b;
    font-size: .9rem;}


</style>
    
    <div id="bodywrap">
        
        <div id="middle_content">
            <!-- class : path-wrap : (S) -->
		<div class="path-wrap">
			<div class="base-inner">
				<div class="path-list-box">
					<ul>
						<li><a href=""><span class="ico-home">홈</span></a></li>
						<li><a href="">마이페이지</a></li>
						<li><a href="">비밀번호 변경</a></li>
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
            
            
	        <form name="passwordChgVO" method="post" action="<c:url value="${'/MberPasswordUpdt.do'}"/>" >
	        <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
	        <input name="checkedIdForDel" type="hidden" />
	        <!-- 검색조건 유지 -->
	        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
	        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
	        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
	        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>
	       <input type="hidden" name="selectedId" value="<c:out value='${mberManageVO.uniqId}'/>">
	        <!-- 우편번호검색 -->
	        <input type="hidden" name="url" value="<c:url value='/sym/ccm/zip/EgovCcmZipSearchPopup.do'/>" />
        
            <!-- sub title start -->
            <div><h2>암호변경</h2></div>
            <!-- sub title end -->
            
            <!--detail area start -->
            <div class="search_service body-box myinfo">
                <div class="search_top_table base-inner"> 
                
                <!--  탭메뉴  -->
                	<ul class="mypage_menu">
		
						<c:forEach var="result" items="${headmenu}" varStatus="status">
							<c:if test="${result.upperMenuId eq 0 }">
							
									<c:if test="${result.menuNo eq 1200000}">
										<li class="">
										<ul>
											<c:forEach var="sub_result" items="${submenu}" varStatus="status">
										<c:if test="${sub_result.upperMenuId eq result.menuNo}">
											
											<c:if test="${sub_result.menuNo eq 1202000}">
												<li class="menu_on">
											</c:if>
											<c:if test="${sub_result.menuNo ne 1202000}">
												<li class="">
											</c:if>
													
															<a href="#LINK"
																onclick="javascript:Page_move('<c:url value="${sub_result.chkURL}"/>')">
																<span><c:out value="${sub_result.menuNm}" /></span>
															</a></li>
											</c:if>
											</c:forEach>
										</ul>
										</li>
							</c:if>
							</c:if>
						</c:forEach>
					</ul>     
					<!--  탭메뉴  e-->               
                    <table summary="SUMMARY">
                        <tr>
			                <td class="td_width"><label for="mberId">일반회원아이디</label>
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content">
			                    <input name="mberId" id="mberId" type="text" size="20" value="<c:out value='${mberManageVO.mberId}'/>"  maxlength="20" readonly />
			                    <input name="uniqId" id="uniqId" type="hidden" size="20" value="<c:out value='${mberManageVO.uniqId}'/>" />
			                    <input name="userTy" id="userTy" type="hidden" size="20" value="<c:out value='${mberManageVO.userTy}'/>" />
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width"><label for="oldPassword">기존 비밀번호</label>
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content"><input name="oldPassword" id="oldPassword" type="password" size="20" value=""  maxlength="100" /></td>
			            </tr>
			            <tr> 
			                <td class="td_width"><label for="newPassword">비밀번호</label>
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content"><input name="newPassword" id="newPassword" type="password" size="20" value=""  maxlength="100" /></td>
			            </tr>
			            <tr>
			                <td class="td_width"><label for="newPassword2">비밀번호확인</label>
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content"><input name="newPassword2" id="newPassword2" type="password" size="20" value=""  maxlength="100" /></td>
			            </tr>
                    </table>
                </div>
            </div>
            <!--detail area end -->
            
            <!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
                <!-- 수정 -->
              
               <a href="#" onclick="fnUpdate(); return false;" ><spring:message code="button.save" /></a>
                <!-- 취소 -->
                <a href="#LINK" onclick="javascript:document.passwordChgVO.reset();"><spring:message code="button.reset" /></a>
            </div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->
            
            </form>

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