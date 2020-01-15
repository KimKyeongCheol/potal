<%--
  Class Name : EgovLoginUsr.jsp
  Description : Login 인증 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.03  박지욱          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스개발팀 박지욱
    since    : 2009.03.03
--%>

<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%

final String NAVER_CLIENT_ID="uF91FWsHZ_24iVL_5VPF";
final String NAVER_CLIENT_SECRET="gvaWkKNWXN";
final String NAVER_CALLBACK="http://127.0.0.1:8080/pst_webapp/sns_login.do";


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link rel="stylesheet" href="<c:url value='/'/>css/import.css"
	type="text/css">
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet" type="text/css" >
	<!--[if lt IE 9]>
	<script src="../common/js/html5shiv.min.js"></script>
	<script src="../common/js/respond.min.js"></script>
<![endif]-->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>

<title>로그인</title>
<script type="text/javascript">
<!--
function actionLogin() {

    if (document.loginForm.id.value =="") {
        alert("아이디를 입력하세요");
    } else if (document.loginForm.password.value =="") {
        alert("비밀번호를 입력하세요");
    } else {
        document.loginForm.action="<c:url value='/uat/uia/actionSecurityLogin.do'/>";
        //document.loginForm.j_username.value = document.loginForm.userSe.value + document.loginForm.username.value;
        //document.loginForm.action="<c:url value='/j_spring_security_check'/>";
        document.loginForm.submit();
    }
}


function goRegiUsr() {
    var userSe = document.loginForm.userSe.value;
    // 일반회원
    if (userSe == "GNR") {
        document.loginForm.action="<c:url value='/Terms.do'/>";
        document.loginForm.submit();
    }else{
        alert("일반회원 가입만 허용됩니다.");
    }
}

function setCookie (name, value, expires) {
    document.cookie = name + "=" + escape (value) + "; path=/; expires=" + expires.toGMTString();
}

function getCookie(Name) {
    var search = Name + "="
    if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면
        offset = document.cookie.indexOf(search)
        if (offset != -1) { // 쿠키가 존재하면
            offset += search.length
            // set index of beginning of value
            end = document.cookie.indexOf(";", offset)
            // 쿠키 값의 마지막 위치 인덱스 번호 설정
            if (end == -1)
                end = document.cookie.length
            return unescape(document.cookie.substring(offset, end))
        }
    }
    return "";
}

function saveid(form) {
    var expdate = new Date();
    // 기본적으로 30일동안 기억하게 함. 일수를 조절하려면 * 30에서 숫자를 조절하면 됨
    if (form.checkId.checked)
        expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 30일
    else
        expdate.setTime(expdate.getTime() - 1); // 쿠키 삭제조건
    setCookie("saveid", form.id.value, expdate);
}

function getid(form) {
    form.checkId.checked = ((form.id.value = getCookie("saveid")) != "");
}

function fnInit() {
	
    var message = document.loginForm.message.value;
    if (message != "") {
        alert(message);
    }
    
    getid(document.loginForm);
}

//-->
</script>
</head>
<body onLoad="fnInit();">

<!-- wrap start -->
<div id="wrap"> 
    <!-- header start -->
    <div id="header"><c:import url="/sym/mms/EgovMainMenuHead.do" /></div>

<!-- 로그인 페이지 내용 시작-->
   <div id="bodywrap" >
					<div class="path-wrap">
							<div class="base-inner">
								<div class="path-list-box">
									<ul>
										<li><a href="#none"><span class="ico-home">홈</span></a></li>
										<li>로그인</li>
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
      <div id="middle_content" class="cont-body-wrap">
			<div class="cont-tit-box">
				<h2 class="h2">로그인</h2>
			</div>
          

            <!--detail area start -->
            <div class="login body-box" >
                <div class="base-inner">  

			<!-- detail content s-->
					<div class="text-box1">
						<p>사업신청등 일부 메뉴는 회원가입(실명확인) 이후 사용하실 수 있습니다.<br/>
						회원의 경우 ID로 로그인후 SNS 계정연동을 해두시면 이후 SNS 계정으로 로그인이 가능합니다.
						</p>
					</div>
					<form name="loginForm" action="/uat/uia/actionSecurityLogin.do" method="post"> 
					<div style="visibility:hidden;display:none;">
						<input name="iptSubmit1" type="submit" value="전송" title="전송">
					</div> 
					<input type="hidden" name="message" value="">

					<div class="idinput">
						<table summary="로그인 아이디 비밀번호 입력">
						   <tbody><tr>
							 <th>아이디</th>
							 <td class="td_content">
								 <input type="text" name="id" id="id" title="아이디" maxlength="10">
								 
							 </td>						 
							  
						   </tr>
						   <tr>
							 <th>비밀번호</th>
							 <td class="td_content">
								 <input type="password" name="password" id="password" title="비밀번호" onkeydown="javascript:if (event.keyCode == 13) { actionLogin(); }">
								 <input type="checkbox" name="checkId" id="checkId" title="암호저장여부" onclick="javascript:saveid(document.loginForm);">ID저장
							 </td>
							 
						   </tr>
						 </tbody></table>
						 <div class="loginbtn">
								<a class="btn1" href="#LINK" onclick="actionLogin()">로그인</a>
						 </div>
					</div>

					

					 <table summary="sns 계정으로 로그인" class="snslogin">

					   <tbody><tr>
						<th>SNS계정으로 로그인</th>
						<td>
							<ul>								
								<li><!-- 네이버 로그인 -->
								<%
								    String clientId = NAVER_CLIENT_ID;//애플리케이션 클라이언트 아이디값";
								    String redirectURI = URLEncoder.encode(NAVER_CALLBACK, "UTF-8");
								    SecureRandom random = new SecureRandom();
								    String state = new BigInteger(130, random).toString();
								    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
								    apiURL += "&client_id=" + clientId;
								    apiURL += "&redirect_uri=" + redirectURI;
								    apiURL += "&state=" + state;
									apiURL += "&svctype=0";
								    session.setAttribute("state", state);
								 %>							
													
								  <a href="<%=apiURL%>"><img src="http://www.g-bridge.or.kr/image/naverlogin.png" alt="네이버로 로그인"/></a>
								
								<!--  네이버 로그인 끝 --><%-- <a href="#"><img src="<c:url value='/image/naverlogin.png'/>" alt="네이버로 로그인"></a> --%></li>
								<li><a href="#"><img src="<c:url value='/image/kakaologin.png'/>" alt="카카오 로그인"></a></li>								
							</ul>
						</td>
					   </tr>
					  </tbody></table>
					  
					  <div class="findid">
						<a class="btn2" href="#LINK" onclick="javascript:alert('준비중');">아이디찾기</a>
						<a class="btn2" href="#LINK" onclick="javascript:alert('준비중');">비밀번호찾기</a>
					  </div>

					  <div class="join">
						<p>
						회원이 아니시면 더욱 편리한 서비스를 위해 회원가입을 하실 수 있습니다.
						<a class="btn1" href="#LINK" onclick="goRegiUsr();">회원가입</a>
						</p>
					 </div>
				
				
					 <input name="userSe" type="hidden" value="GNR">
					 <input name="j_username" type="hidden">
					 </form>
               <!-- detail content e-->            
                 </div>
                
            </div>
            <!--detail area end -->
               
               
        </div> 
    </div>
    <!-- 로그인 페이지 내용 끝-->
    <!-- footer 시작 -->
    <div id="footer"><c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" /></div>
    <!-- //footer 끝 -->
</div>

</body>
</html>


