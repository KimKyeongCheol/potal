<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<title>경기도형 대학생 취업브리지</title>
<link href="<c:url value='/'/>css/import.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/www-player-webp-vflfcplvs.css"
	rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>

<script type="text/javascript">
	function goNext() {

		if ($("input:checkbox[id='chkAssent1']").is(":checked") == true) {

		} else {
			alert("이용약관 동의(필수) 에 체크하세요");

		}
		if ($("input:checkbox[id='chkAssent2']").is(":checked") == true) {

		} else {
			alert("개인정보 수집 이용 동의 을(를)체크하세요");

		}
		if ($("input:checkbox[id='chkAssent3']").is(":checked") == true) {

		} else {
			alert("개인정보 목적 외 이용 및 제3자 제공 란에 체크하세요");

		}

		if ($("input:checkbox[id='chkAssent1']").is(":checked") == true) {
			if ($("input:checkbox[id='chkAssent2']").is(":checked") == true) {
				if ($("input:checkbox[id='chkAssent3']").is(":checked") == true) {

					location.href = "<c:url value='/MberRegist.do'/>";

				}
			}
		}

	}

	$(function() {
		$("#chkAssentAll").click(function() {
			var chk = $(this).is(":checked");//.attr('checked');
			if (chk)
				$(".agree-check input").prop('checked', true);
			else
				$(".agree-check input").prop('checked', false);
		});
	});
</script>
</head>
<body>
	<!-- 자바스크립트 경고 태그  -->
	<noscript class="noScriptTitle">자바스크립트를 지원하지 않는 브라우저에서는 일부
		기능을 사용하실 수 없습니다.</noscript>
	<!-- wrap start -->
	<div id="wrap">
		<!-- header start -->
		<div id="subheader">
			<c:import url="/sym/mms/EgovMainMenuHead.do" />
		</div>
		<style>
.joinus
	.text-box1 {
	padding: 10px;
	border: 1px solid #ccc;
	broder-radius: 5px;
	margin: auto;
	margin-bottom: 20px;
}

.joinus .agreeArea {
	margin-bottom: 4rem;
}

.joinus .agreetxt {
	margin: 1rem;
	padding: 10px;
	border: 1px solid #ccc;
	overflow-y: scroll;
	height: 6rem;
}

.joinus .agree-check {
	margin-left: 1rem;
}

.joinus .all-check {
	text-align: center;
}

.all-check p {
	padding: 10px;
}

.btn1 {
	color: #fff;
	text-align: center;
	display: inline-block;
	font-size: 0.9rem;
	background: rgb(74, 91, 117);
	line-height: 2.3rem;
	width: 8rem;
}

.btn2 {
	border: 1px solid #0e050b;
	text-align: center;
	display: inline-block;
	line-height: 2.3rem;
	color: #0e050b;
	font-size: 0.9rem;
	width: 8rem;
}
</style>
		<!-- //header end -->
		<div id="bodywrap">
			<div class="path-wrap">
				<div class="base-inner">
					<div class="path-list-box">
						<ul>
							<li><a href="#none"><span class="ico-home">홈</span></a></li>
							<li>회원가입</li>
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
					<h2 class="h2">회원가입</h2>
				</div>


				<!-- class : path-wrap : (E) -->
				<div id="content_field">
					<!--detail area start -->
					<div class="joinus body-box">
						<div class="base-inner">

							<!-- detail content s-->
							<div class="text-box1">
								<p>
									안녕하세요. 경기도형 대학생 취업브리지 플랫폼 입니다.<br /> 홈페이지 회원으로 가입하시면, 제공하는 다양한
									정보 및 서비스를 제공받으실 수 있습니다.
								</p>
							</div>

							<div class="agreeArea">
								<h3 class="tit-h3">이용약관 동의(필수)</h3>
								<div class="agreetxt">
									<c:import url="doc/Terms1.jsp"></c:import>

								</div>
								<p class="agree-check">
									<input type="checkbox" id="chkAssent1" name="chkAssent1"
										title="서비스 이용약관" /> <label for="chkAssent1">위의
										서비스이용약관에 동의합니다.</label>
								</p>
							</div>
							<div class="agreeArea">
								<h3 class="tit-h3">개인정보 수집 이용 동의</h3>
								<div class="agreetxt">
									<c:import url="doc/Terms2.jsp"></c:import>
								</div>
								<p class="agree-check">
									<input type="checkbox" id="chkAssent2" name="chkAssent2"
										title="서비스 이용약관" /> <label for="chkAssent2">위의 개인정보의 제
										3자 제공에 동의합니다.</label>
								</p>
							</div>
							<div class="agreeArea">
								<h3 class="tit-h3">개인정보 목적 외 이용 및 제3자 제공</h3>
								<div class="agreetxt">
									<c:import url="doc/Terms3.jsp"></c:import>
								</div>
								<p class="agree-check">
									<input type="checkbox" id="chkAssent3" name="chkAssent3"
										title="서비스 이용약관" /> <label for="chkAssent3">위의 개인정보의
										보유 및 이용기간에 동의합니다.</label>
								</p>
							</div>


							<div class="all-check">
								<input type="checkbox" id="chkAssentAll" name="chkAssentAll">
								<label for="chkAssentAll">모든 이용약관에 동의합니다. </label>
								<p>
									<a href="#" class="btn2">취소</a> <a href="#"
										onclick="javascript:goNext();" class="btn1">다음</a>
								</p>
							</div>




						</div>
						<!-- contents end -->
					</div>
				</div>
			</div>
		</div>

		<!-- footer 시작 -->
		<div id="footer">
			<c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" />
		</div>
		<!-- //footer 끝 -->
	</div>
	<!-- //wrap end --
</body>
</html>