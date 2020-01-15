<%--
  Class Name : EgovNotice.jsp
  Description : 샘플화면 - 게시물화면 샘플(sample)
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성
 
    author   : 실행환경개발팀 JJY
    since    : 2011.08.31 
--%>
<%  
response.setHeader("Cache-Control","no-store");  
response.setHeader("Pragma","no-cache");  
response.setDateHeader("Expires",0);  
if (request.getProtocol().equals("HTTP/1.1"))
        response.setHeader("Cache-Control", "no-cache");
%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>경기도형 대학생 취업브리지</title>
<link href="<c:url value='/'/>css/import.css" rel="stylesheet" type="text/css" >
<link href="<c:url value='/'/>css/www-player-webp-vflfcplvs.css" rel="stylesheet" type="text/css" >

<!--[if lt IE 9]>
	<script src="../common/js/html5shiv.min.js"></script>
	<script src="../common/js/respond.min.js"></script>
<![endif]-->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>
</head>
<body>
<noscript><p>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</p></noscript>
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
						<li><a href="">대학생 취업브리지</a></li>
						<li><a href="">사업소개</a></li>
					</ul>
				</div>
				<div class="sns-list-box">
					<ul>
						<li><a href=""><span class="ico-home">홈페이지</span></a></li>
						<li><a href=""><span class="ico-print">프린트</span></a></li>
						<li><a href=""><span class="ico-face">페이스북</span></a></li>
						<li><a href=""><span class="ico-kks">카카오스토리</span></a></li>
						<li><a href=""><span class="ico-tw">트위터</span></a></li>
					</ul>
				</div>
			</div>
		</div>
		<!-- class : path-wrap : (E) -->
			<div id="content_field">
				<div><h2>공지사항</h2></div>


				<div class="default_tablestyle">
					<table summary="" cellpadding="0" cellspacing="0">
					<caption></caption>
					<colgroup>
					<col width="38" />
					<col width="500" />  
					<col width="50" />
					<col width="150" />
					<col width="" />
					</colgroup>
					<thead>
					<tr>
						<th scope="col" class="f_field">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
						<th scope="col">등록일</th>
					</tr>
					</thead>
					<tbody>		  			
					<!-- loop 시작 -->								
					<tr>
						<td><strong>10</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>1232</td>
						<td>2011-04-04</td>
					</tr>
					<tr>
						<td><strong>9</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>111</td>
						<td>2011-04-04</td>
					</tr>
					<tr>
						<td><strong>8</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>324</td>
						<td>2011-04-04</td>
					</tr>	
					<tr>
						<td><strong>7</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>521</td>
						<td>2011-04-04</td>
					</tr>	
					<tr>
						<td><strong>6</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>755</td>
						<td>2011-04-04</td>
					</tr>
										<tr>
						<td><strong>5</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>324</td>
						<td>2011-04-04</td>
					</tr>	
					<tr>
						<td><strong>4</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>521</td>
						<td>2011-04-04</td>
					</tr>	
					<tr>
						<td><strong>3</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>755</td>
						<td>2011-04-04</td>
					</tr>	
					<tr>
						<td><strong>2</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>521</td>
						<td>2011-04-04</td>
					</tr>	
					<tr>
						<td><strong>1</strong></td>
						<td class="align_left_text"><a href="1">2011년 8월 표준프레임워크 개발관련 표준 세미나 안내(8월 15일 오후 13:00시)</a></td>
						<td>홍길동</td>
						<td>755</td>
						<td>2011-04-04</td>
					</tr>													
					</tbody>
					</table> 
				</div>
				<!-- 페이지 네비게이션 시작 -->
				<div id="paging_div">
					<ul class="paging_align">
						<li class="first"><img src="<c:url value='/'/>images/btn_prev.gif" alt="prev" /></li>
						<li><a href="#">1</a></li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
						<li class="first"><img src="<c:url value='/'/>images/btn_next.gif" alt="next" /></li>
					</ul>
				</div>

					
			</div>
		</div>
	</div>
	<!-- footer 시작 -->
	<div id="footer"><c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" /></div>
	<!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>