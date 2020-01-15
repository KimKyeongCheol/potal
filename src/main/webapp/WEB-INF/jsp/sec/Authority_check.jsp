<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content=""> 
  <title>경기대 대학생 취업브리지 - 페이지오류</title>
  <link href="/css/import.css" rel="stylesheet" type="text/css" >
  <link href="/css/dev.css" rel="stylesheet" type="text/css" >
 </head>
 <body>
	<div class="error_body">
		<div class="logo">
			<img src="<c:url value='/images/hd-logo.png'/>" />
		</div>

		<div class="message">
			<p>관리자 권한이 없습니다.<br/> 관리자 권한이 있는 아이디로 로그인해주시기 바랍니다.</p>
			<div class="gohome">
				<p>
					<!-- <a href="http://www.g-bridge.or.kr">메인화면으로 바로가기</a>  운영-->
					<a href="<c:url value='/mainPage.do'/>">메인화면으로 바로가기</a>
				</p>
			</div>
			
		</div>
	</div>


 </body>
</html>
