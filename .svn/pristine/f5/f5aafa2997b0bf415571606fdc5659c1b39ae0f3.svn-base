<%--
  Class Name : EgovMberSbscrb.jsp
  Description : 일반회원가입신청 JSP  
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.22  JJY          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 JJY
    since    : 2009.03.22
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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">

<title>회원 신청</title>
<link href="<c:url value='/'/>css/import.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/www-player-webp-vflfcplvs.css" rel="stylesheet" type="text/css" >

<!--[if lt IE 9]>
	<script src="../common/js/html5shiv.min.js"></script>
	<script src="../common/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript" src="<c:url value='/js/prototype-1.6.0.3.js' />"></script>

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="mberManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/EgovZipPopup.js' />" ></script>
<script type="text/javaScript" language="javascript" defer="defer">
<!--
function fnIdCheck(){
    var retVal;
    var url = "<c:url value='/uss/umt/EgovIdDplctCnfirmView.do'/>";
    var varParam = new Object();
    varParam.checkId = document.mberManageVO.mberId.value;
    var openParam = "dialogWidth:303px;dialogHeight:250px;scroll:no;status:no;center:yes;resizable:yes;";
    retVal = window.showModalDialog(url, varParam, openParam);
    if(retVal) {
        document.mberManageVO.mberId.value = retVal;
        document.mberManageVO.id_view.value = retVal;
    }
}

function showModalDialogCallback(retVal) {
	if(retVal) {
        document.mberManageVO.mberId.value = retVal;
        document.mberManageVO.id_view.value = retVal;
    }
}

function fnSbscrb(){
	if(validateMberManageVO(document.mberManageVO)){
		if(document.mberManageVO.password.value != document.mberManageVO.password2.value){
            alert("<spring:message code='fail.user.passwordUpdate2' />");
            return;
        }
        document.mberManageVO.submit();
    }	
}
//-->
</script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수
			var zonecode = data.zonecode;
           
           /* // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }
 */
           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
      /*      $("#zip_view").val(data.zonecode);
           $("#adres").val(fullRoadAddr); */
           
            document.getElementById('zip_view').value = zonecode; //5자리 새우편번호 사용
           document.getElementById('adres').value = fullRoadAddr;
           /*document.getElementById('signUpUserCompanyAddressDetail').value = data.jibunAddress; */
       }
    }).open({
        popupName: 'postcodePopup' //팝업 이름을 설정(영문,한글,숫자 모두 가능, 영문 추천)
    });
}
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
<div class="path-wrap">
				<div class="base-inner">
					<div class="path-list-box">
						<ul>
							<li><a href="#none"><span class="ico-home">홈</span></a></li>
									<li>이용안내</li><li>회원가입</li>
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
            <div id="content_field"><!--contents start-->
            
            <form:form commandName="mberManageVO" action="${pageContext.request.contextPath}/uss/umt/cmm/EgovMberSbscrb.do" name="mberManageVO"  method="post" >
        
	        <!-- 상세정보 사용자 삭제시 prameter 전달용 input -->
	        <input name="checkedIdForDel" type="hidden" />
	        <!-- 검색조건 유지 -->
	        <input type="hidden" name="searchCondition" value="<c:out value='${userSearchVO.searchCondition}'/>"/>
	        <input type="hidden" name="searchKeyword" value="<c:out value='${userSearchVO.searchKeyword}'/>"/>
	        <input type="hidden" name="sbscrbSttus" value="<c:out value='${userSearchVO.sbscrbSttus}'/>"/>
	        <input type="hidden" name="pageIndex" value="<c:out value='${userSearchVO.pageIndex}'/>"/>

	        <!-- 우편번호검색 -->
	        <input type="hidden" name="zip_url" value="<c:url value='/sym/cmm/EgovCcmZipSearchPopup.do'/>" />
	        
	        <!-- sub title start -->
            <div><h2>일반회원 가입신청</h2></div>
            <!-- sub title end -->
            
            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">
                    <table summary="일반회원 가입정보">
			            <tr> 
			                <td class="td_width">일반회원아이디
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content">
			                    <input type="text" size="20" maxlength="20" disabled="disabled" id="id_view" name="id_view" >
			                    <form:input path="mberId" size="20" cssClass="txaIpt" readonly="true" maxlength="20" cssStyle="display:none" />
			                    <a href="#LINK" onclick="javascript:fnIdCheck(); return false;">
			                        <img alt="중복아이디 검색" align="middle" src="<c:url value='/images/img_search.gif'/>">(중복아이디 검색)
			                    </a>
			                    <div><form:errors path="mberId" cssClass="error" /></div>
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">일반회원이름
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content">
			                <input name="mberNm" type="text" size="20" title="일반회원 이름"
			                        value=<c:if test="${not empty mberNm}">"<c:out value="${mberNm}"/>" readonly</c:if>
			                              <c:if test="${empty mberNm}">""</c:if>
			                        maxlength="60" >
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">비밀번호
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content">
			                    <form:password path="password" size="20" maxlength="20" />
			                    <div><form:errors path="password" cssClass="error" /></div>
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">비밀번호확인
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content">
			                    <input name="password2" type="password" size="20" maxlength="20" title="비밀번호 확인">
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">비밀번호힌트
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content">
			                    <form:select path="passwordHint">
			                        <form:option value="" label="--선택하세요--"/>
			                        <form:options items="${passwordHint_result}" itemValue="code" itemLabel="codeNm"/>
			                    </form:select>
			                    <div><form:errors path="passwordHint" cssClass="error"/></div>
			                    </td>
			            </tr>
			            <tr> 
			                <td class="td_width">비밀번호정답
			                    <img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/>
			                </td>
			                <td class="td_content">
			                    <form:input path="passwordCnsr" cssClass="txaIpt" size="50" maxlength="100" />
			                    <div><form:errors path="passwordCnsr" cssClass="error"/></div>
			                </td>
			            </tr>
			            <tr>
			                <td class="td_width">성별구분코드&nbsp;&nbsp;</td>
			                <td class="td_content">
			                    <form:select path="sexdstnCode">
			                        <form:option value="" label="--선택하세요--"/>
			                        <form:options items="${sexdstnCode_result}" itemValue="code" itemLabel="codeNm"/>
			                    </form:select>
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">전화번호
			                </td>
			                <td class="td_content">
			                    <form:input path="areaNo" cssClass="txaIpt" size="5" maxlength="5" />
			                    - <form:input path="middleTelno" cssClass="txaIpt" size="5" maxlength="5" />
			                    - <form:input path="endTelno" cssClass="txaIpt" size="5" maxlength="5" />
			                    <div><form:errors path="areaNo" cssClass="error" /></div>
			                    <div><form:errors path="middleTelno" cssClass="error" /></div>
			                    <div><form:errors path="endTelno" cssClass="error" /></div>
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">팩스번호&nbsp;&nbsp;</td>
			                <td class="td_content">
			                    <form:input path="mberFxnum" cssClass="txaIpt" size="20"  maxlength="15" />
			                    <div><form:errors path="mberFxnum" cssClass="error" /></div>
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">핸드폰번호
			                </td>
			                <td class="td_content">
			                    <form:input path="moblphonNo" cssClass="txaIpt" size="20" maxlength="15" />
			                    <div><form:errors path="moblphonNo" cssClass="error" /></div>
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">이메일주소
			                </td>
			                <td class="td_content">
			                    <form:input path="mberEmailAdres" cssClass="txaIpt" size="30" maxlength="50" />
			                    <div><form:errors path="mberEmailAdres" cssClass="error" /></div>
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">우편번호
			                </td>
			                <td class="td_content">
			                    <input name="zip_view" id="zip_view" title="우편번호" type="text" size="20" value="<c:out value='${mberManageVO.zip}'/>" maxlength="8" readonly="readonly">
			                    <form:hidden path="zip" /><!-- fn_egov_ZipSearch(document.mberManageVO, document.mberManageVO.zip, document.mberManageVO.zip_view, document.mberManageVO.adres); -->
			                        <a href="#LINK" onclick="javascript:execPostCode();">
			                            <img alt="우편번호 검색" src="<c:url value='/images/img_search.gif'/>">(우편번호 검색)
			                        </a>
			                    <div><form:errors path="zip" cssClass="error" /></div>
			                </td>
			            </tr>
			            <tr>
			                <td class="td_width">주소
			                </td>
			                <td class="td_content">
			                    <form:input path="adres" id="adres" cssClass="txaIpt" size="70" maxlength="100" readonly="true" />
			                    <div><form:errors path="adres" cssClass="error" /></div>
			                </td>
			            </tr>
			            <tr> 
			                <td class="td_width">상세주소&nbsp;&nbsp;</td>
			                <td class="td_content">
			                    <form:input path="detailAdres" cssClass="txaIpt" size="70" maxlength="100" />
			                    <div><form:errors path="detailAdres" cssClass="error" /></div>
			                </td>
			            </tr>
			            
			        </table>
                </div>
            </div>
            <!--detail area end -->
            
            <!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
                <a href="#LINK" onclick="javascript:fnSbscrb(); return false;"><spring:message code="button.subscribe" /></a>
                <a href="#LINK" onclick="javascript:document.mberManageVO.reset(); return false;"><spring:message code="button.reset" /></a>
            </div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->
            <form:hidden path="groupId" />
            <form:hidden path="mberSttus" />
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