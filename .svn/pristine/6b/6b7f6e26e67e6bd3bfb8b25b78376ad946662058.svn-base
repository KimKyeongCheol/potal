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
<%@ page import="egovframework.com.cmm.LoginVO"%>
<%
LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");

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
<%-- <link href="<c:url value='/'/>css/default.css" rel="stylesheet" type="text/css" > --%>
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

function Confirm(){
	document.ChkForm.submit();
}
</script>
</head>
<body>

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
										<li>마이페이지</li>
										<li>비밀번호 확인</li>
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
				<h2 class="h2">비밀번호 확인</h2>
			</div>
          

            <!--detail area start -->
            <div class="login body-box" >
                <div class="base-inner">  

			<!-- detail content s-->

					<form name="ChkForm" action="<c:url value='/Mber_chk.do' />" method="post"> 
					<div style="visibility:hidden;display:none;">
							<input name="iptSubmit1" type="submit" value="전송" title="전송">
					</div> 
					<input type="hidden" name="message" value="">

					<div class="idinput">
						<table summary="회원 아이디 비밀번호 입력">
						   <tbody><tr>
							 <th>아이디</th>
							 <td class="td_content">
								 <input type="text" name="id" id="id" title="아이디" maxlength="10" value="<%=loginVO.getId()%>" readonly="readonly">
								 
							 </td>						 
							  
						   </tr>
						   <tr>
							 <th>비밀번호</th>
							 <td class="td_content">
								 <input type="password" autocomplete="off" name="password" id="password" title="비밀번호"  readonly 
onfocus="this.removeAttribute('readonly');">
						   </tr>
						 </tbody></table>
						 <div class="loginbtn">
								<a class="btn1" href="#LINK" onclick="Confirm()">확인</a>

						 </div>
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


