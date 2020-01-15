<%--
  Class Name : EgovMainView.jsp
  Description : 메인화면
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2011.08.31   JJY       경량환경 버전 생성

    author   : 실행환경개발팀 JJY
    since    : 2011.08.31
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import ="egovframework.com.cmm.LoginVO" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no">
<meta name="description" content="경기도 대학의 전공과정과 기업의 현장 실습을 연계한 대학생 취업브리지사업 홈페이지 입니다.">

<meta property="og:type" content="website"> 
<meta property="og:title" content="경기도형 대학생 취업브리지">
<meta property="og:description" content="경기도 대학의 전공과정과 기업의 현장 실습을 연계한 대학생 취업브리지사업 홈페이지 입니다.">
<meta property="og:image" content="http://www.g-bridge.or.kr/images/hd-logo.png">
<meta property="og:url" content="http://www.g-bridge.or.kr">
<meta name="naver-site-verification" content="ef6a7b6a34ac6cd558f11f6b868265d7d0b9497f"/>
<title>경기도형 대학생 취업브리지</title>
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
<script type="text/javascript">
/* ********************************************************
* 팝업창  오픈
******************************************************** */
function fn_egov_init_PopupManage(){
	<c:forEach items="${popupList}" var="resultInfo" varStatus="status">
	<c:if test="${resultInfo.ntceAt eq 'Y'}">
	if(fnGetCookie('${resultInfo.popupId}') == null ){
	 	fn_egov_popupOpen_PopupManage('${resultInfo.popupId}',
	 			'${resultInfo.fileUrl}',
	 			'${resultInfo.popupWidthSize}',
    	    	'${resultInfo.popupVrticlSize}',
    	    	'${resultInfo.popupVrticlLc}',
    	    	'${resultInfo.popupWidthLc}',
    	    	'${resultInfo.stopvewSetupAt}');
	}
	</c:if>
	</c:forEach>
}
/* ********************************************************
* 팝업창  오픈 쿠키 정보 OPEN
******************************************************** */
function fnGetCookie(name) {
	  var prefix = name + "=";
	  var cookieStartIndex = document.cookie.indexOf(prefix);
	  if (cookieStartIndex == -1) return null;
	  var cookieEndIndex = document.cookie.indexOf(";", cookieStartIndex + prefix.length);
	  if (cookieEndIndex == -1) cookieEndIndex = document.cookie.length;
	  return unescape(document.cookie.substring(cookieStartIndex + prefix.length, cookieEndIndex));
}
/* ********************************************************
* 팝업창  오픈
******************************************************** */
function fn_egov_popupOpen_PopupManage(popupId,fileUrl,width,height,top,left,stopVewAt){
	var url = "<c:url value='/uss/ion/pwm/openPopupManage.do' />?";
	url = url + "fileUrl=" + fileUrl;
	url = url + "&stopVewAt=" + stopVewAt;
	url = url + "&popupId=" + popupId;
	var name = popupId;
	var openWindows = window.open(url,name,"width="+width+",height="+height+",top="+top+",left="+left+",toolbar=no,status=no,location=no,scrollbars=yes,menubar=no,resizable=yes");
	if (window.focus) {openWindows.focus()}
}

function click_event(){
	alert("준비중입니다.");
}


function chageLangSelect(sts){
	
	var url= sts;
	
	window.open(url, '_blank'); 

}

</script>
<script language="javascript1.2" type="text/javaScript">
<!--

-->
</script>
</head>
<body onload="fn_egov_init_PopupManage()">

<noscript><p>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</p></noscript>
<!-- login status start -->
<%-- <div id="login_area"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncTborder" /></div> --%>
<!-- //login status end -->
<!-- wrap start -->
<div id="wrap">
	<!-- header start -->
	<div id="header"><c:import url="/sym/mms/EgovMainMenuHead.do?flag=MAIN" /></div>


	<!-- //header end -->
	
			<div class="sec-main-vi">
			<div class="slick-banner-01 ">
			<c:forEach var="fileVO" items="${fileList}" varStatus="status">

				<div class="main-vi-img background-cover" >
				<div class="inner">
            <img alt="" src='<c:url value='/cmm/fms/getBanner_Image.do'/>?atchFileId=<c:out value="${fileVO.imageFile}"/>' />
           </div>
           </div>

    </c:forEach>
				<!-- <div class="main-vi-img background-cover" ><div class="inner" style="background-image:url(../common/images/main-vi-01.png)"> </div></div>
				<div class="main-vi-img background-cover"><div class="inner"  style="background-image:url(../common/images/main-vi-01.png)"> </div></div> -->
			</div>
			<div class="buttons">
				<div class="base-inner">
					<button class="pause">멈춤</button>
					<button class="play">시작</button>
				</div>
			</div>
			<div class="buttons-2">
				<div class="base-inner">
					<button class="slick-prev">이전</button>
					<button class="slick-next">다음</button>
				</div>
			</div>
		</div>
		<script>
 		$('.slick-banner-01').slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			autoplay: true,
			dots: true,
			pauseOnHover: false,
  			infinite: true,
			speed: 300,
			prevArrow: '.slick-prev', //prev 버튼
			nextArrow: '.slick-next' //netx 버튼
 		});
		$('.sec-main-vi .pause').on('click', function() {
			$('.slick-banner-01')
				.slick('slickPause')
		});

		$('.sec-main-vi  .play').on('click', function() {
			$('.slick-banner-01')
				.slick('slickPlay')
		});
		</script>
		
		<!-- main-row-01 (S)-->
		<section class="main-row-01">
			<h2>새로운 소식</h2>
		<div class="base-inner">
			<div class="main-notice-wrap">
				<ul>
					<li class="open"><a class="notice-tit board1"><span>전체</span></a>
						<a
						href="<c:url value='/selectBoardList_user.do?bbsId=BBSMSTR_AAAAAAAAAAAA'/>"
						class="btn-more" id="View_board" style="">더보기</a>

						<div class="notice-list-box board1_box">
							<div class="main-notice-slide-box">
								<c:forEach var="result" items="${allList}" varStatus="status">
									<div class="txt-inner-box">
										<div class="txt-title">
										<a
											href="<c:url value='/cop/bbs/selectBoardArticle.do?us=usr&bbsId=${result.bbsId}&nttId=${result.nttId}'/>">
											<c:if test="${result.replyLc!=0}">
												<c:forEach begin="0" end="${result.replyLc}" step="1">
                                    &nbsp;
                                </c:forEach>
												<img src="<c:url value='/images/reply_arrow.gif'/>"
													alt="reply arrow" />
											</c:if> 
											<c:choose>
												<c:when
													test="${result.isExpired=='Y' || result.useAt == 'N'}">
													<c:out value="${result.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${result.nttSj}" />
												</c:otherwise>
											</c:choose>
										</a>
										</div>
										<div class="txt-s">
											  ${result.nttCn.replaceAll("\\<?img(.*?)\\>","")}				
										</div>
										<div class="date">
											<c:out value="${result.frstRegisterPnttm}" />
										</div>
									</div>


								</c:forEach>
							</div>
						</div></li>
					<li><a class="notice-tit board2"><span>공지사항</span></a>
						<a
						href="<c:url value='/selectBoardList_user.do?bbsId=BBSMSTR_AAAAAAAAAAAA'/>"
						class="btn-more" id="View_board" style="">더보기</a>

						<div class="notice-list-box board2_box" style="">
							<div class="main-notice-slide-box">
								<c:forEach var="result" items="${notiList}" varStatus="status">
									<div class="txt-inner-box">
										<div class="txt-title">
										<a
											href="<c:url value='/cop/bbs/selectBoardArticle.do?us=usr&bbsId=${result.bbsId}&nttId=${result.nttId}'/>">
											<c:if test="${result.replyLc!=0}">
												<c:forEach begin="0" end="${result.replyLc}" step="1">
                                    &nbsp;
                                </c:forEach>
												<img src="<c:url value='/images/reply_arrow.gif'/>"
													alt="reply arrow" />
											</c:if> <c:choose>
												<c:when
													test="${result.isExpired=='Y' || result.useAt == 'N'}">
													<c:out value="${result.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${result.nttSj}" />
												</c:otherwise>
											</c:choose>
										</a>
										</div>
										<div class="txt-s">
											${result.nttCn}
										</div>
										<div class="date">
											<c:out value="${result.frstRegisterPnttm}" />
										</div>
									</div>
								</c:forEach>
							</div>
						</div></li>
					<li><a class="notice-tit board3"><span>사업단소식</span></a>
								<a
						href="<c:url value='/selectBoardList_user.do?bbsId=BBSMSTR_000000000041'/>"
						class="btn-more" id="View_board" style="">더보기</a>

						<div class="notice-list-box board2_box" style="">
							<div class="main-notice-slide-box">
								<c:forEach var="result" items="${NewsList}" varStatus="status">
									<div class="txt-inner-box">
										<div class="txt-title">
										<a
											href="<c:url value='/cop/bbs/selectBoardArticle.do?us=usr&bbsId=${result.bbsId}&nttId=${result.nttId}'/>">
											<c:if test="${result.replyLc!=0}">
												<c:forEach begin="0" end="${result.replyLc}" step="1">
                                    &nbsp;
                                </c:forEach>
												<img src="<c:url value='/images/reply_arrow.gif'/>"
													alt="reply arrow" />
											</c:if> <c:choose>
												<c:when
													test="${result.isExpired=='Y' || result.useAt == 'N'}">
													<c:out value="${result.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${result.nttSj}" />
												</c:otherwise>
											</c:choose>
										</a>
										</div>
										<div class="txt-s">
											${result.nttCn}
										</div>
										<div class="date">
											<c:out value="${result.frstRegisterPnttm}" />
										</div>
									</div>
								</c:forEach>
							</div>
						</div></li>
					<li><a class="notice-tit board4"><span>언론보도</span></a>
					<a
						href="<c:url value='/selectBoardList_user.do?bbsId=BBSMSTR_000000000042'/>"
						class="btn-more" id="View_board" style="">더보기</a>

						<div class="notice-list-box board2_box" style="">
							<div class="main-notice-slide-box">
								<c:forEach var="result" items="${Press_releaseList}" varStatus="status">
									<div class="txt-inner-box">
										<div class="txt-title">
										<a
											href="<c:url value='/cop/bbs/selectBoardArticle.do?us=usr&bbsId=${result.bbsId}&nttId=${result.nttId}'/>">
											<c:if test="${result.replyLc!=0}">
												<c:forEach begin="0" end="${result.replyLc}" step="1">
                                    &nbsp;
                                </c:forEach>
												<img src="<c:url value='/images/reply_arrow.gif'/>"
													alt="reply arrow" />
											</c:if> <c:choose>
												<c:when
													test="${result.isExpired=='Y' || result.useAt == 'N'}">
													<c:out value="${result.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${result.nttSj}" />
												</c:otherwise>
											</c:choose>
										</a>
										</div>
										<div class="txt-s">
											${result.nttCn}
										</div>
										<div class="date">
											<c:out value="${result.frstRegisterPnttm}" />
										</div>
									</div>
								</c:forEach>
							</div>
						</div></li>
					<li><a class="notice-tit board5"><span>갤러리</span></a><a
						href="<c:url value='/selectBoardList_user.do?bbsId=BBSMSTR_000000000021'/>"
						class="btn-more" id="View_board" style="">더보기</a>

						<div class="notice-list-box board2_box" style="">
							<div class="main-notice-slide-box">
								<c:forEach var="result" items="${GalleryList}" varStatus="status">
									<div class="txt-inner-box">
										<div class="txt-title">
										<a
											href="<c:url value='/cop/bbs/selectBoardArticle.do?us=usr&bbsId=${result.bbsId}&nttId=${result.nttId}'/>">
											<c:if test="${result.replyLc!=0}">
												<c:forEach begin="0" end="${result.replyLc}" step="1">
                                    &nbsp;
                                </c:forEach>
												<img src="<c:url value='/images/reply_arrow.gif'/>"
													alt="reply arrow" />
											</c:if> <c:choose>
												<c:when
													test="${result.isExpired=='Y' || result.useAt == 'N'}">
													<c:out value="${result.nttSj}" />
												</c:when>
												<c:otherwise>
													<c:out value="${result.nttSj}" />
												</c:otherwise>
											</c:choose>
										</a>
										</div>
										<div class="txt-s">
											${result.nttCn}
										</div>
										<div class="date">
											<c:out value="${result.frstRegisterPnttm}" />
										</div>
									</div>
								</c:forEach>
							</div>
						</div></li>
				</ul>
		
			</div>
			<div class="main-banner-wrap">
				<div class="inner">
				
					<div class="main-banner-box">
					
					<c:forEach var="fileVO" items="${fileSubList}" varStatus="status">
						<div>
							<a href=""><div class="img">
		
          <img alt="" style="max-width:100%;" src='<c:url value='/cmm/fms/getBanner_Image.do'/>?atchFileId=<c:out value="${fileVO.imageFile}"/>' />
    							</div> </a>
						</div>

    </c:forEach>
						
					</div>
					<div class="buttons">
						<button class="pause-2">멈춤</button>
						<button class="play-2">시작</button>
					</div>
					<div class="buttons-2">
						<button class="slick-prev-2">이전</button>
						<button class="slick-next-2">다음</button>
					</div>
				</div>
			</div>
			<script>
			$( document ).ready( function() {
					/** 2019-11-02 mod
									var slick_notic = $('.main-notice-slide-box').slick({
										infinite: false,
										speed: 300,
										slidesToShow: 3,
										centerMode: false,
										arrows: true,
										variableWidth: false,
										dots: false,
									});
					**/
					var slick_notic = {
						infinite: false,
						speed: 300,
						slidesToShow: 3,
						centerMode: false,
						arrows: true,
						variableWidth: false,
						dots: false,
						 responsive: [
 						{
						  breakpoint: 1090,
						  settings: {
							slidesToShow: 1,
							slidesToScroll: 1
						  }
 						}]
					};

					$(".main-notice-wrap .notice-tit").on("click, focusin",function(){
						$(".main-notice-wrap > ul > li").removeClass("open");
						$(this).parent().addClass("open");
						$(this).parent().find('.main-notice-slide-box').slick(slick_notic);
						$(this).parent().find(".notice-list-box").focus();
					});

					/* 처음은 전체 탭으로 슬라이드 되게 정의함 */
					$('.main-notice-slide-box').slick(slick_notic);


					$('.main-banner-box').slick({						
						infinite: false,
						speed: 300,
						slidesToShow: 1,
						centerMode: false,
						autoplay: true,
						arrows: true,
						variableWidth: false,
						pauseOnHover: false,
						dots: true,
						infinite: true,
						prevArrow: '.slick-prev-2', //prev 버튼
						nextArrow: '.slick-next-2', //netx 버튼
						dotsClass: 'custom_paging',
						customPaging: function (slider, i) {
			 //				console.log(slider);
							return  (i + 1) + '/' + slider.slideCount;
						}
					});


					$('.main-banner-wrap .pause-2').on('click', function() { /* 2019-11-02 mod */
						$('.main-banner-box').slick('slickPause');
						$(this).hide();
						$('.main-banner-wrap .play-2').show();
					});

					$('.main-banner-wrap  .play-2').on('click', function() { /* 2019-11-02 mod */
						$('.main-banner-box').slick('slickPlay');
						$(this).hide();
						$('.main-banner-wrap .pause-2').show();
					});
				});


				//공지사항 탭 클릭시 작동
				$('.notice-tit').on('click', function() {
					 
					var idx = $(this).parent().index();
					
					$( '.main-row-01 .main-notice-wrap > ul > li' ).removeClass("open");
					$(this).parent().addClass("open");
					$( '.main-row-01 .main-notice-wrap > ul > li > #View_board' ).removeClass("btn-more");
					$( '.main-row-01 .main-notice-wrap > ul > li > #View_board' ).addClass("hidden");
					$('.main-notice-slide-box').slick('refresh');
					$(this).parent().children('#View_board').addClass("btn-more");
					$(this).parent().children('.main-notice-slide-box').slick({
						infinite: false,
						speed: 300,
						slidesToShow: 3,
						centerMode: false,
						arrows: true,
						variableWidth: false,
						dots: false,
						
					});					
				});

 				
				</script>
		</div>
		</section>
		<!-- main-row-01 (E)-->

<!-- main-row-02 (S)-->
		<section class="main-row-02">
			<div class="base-inner">
				<h2>경기도형 대학생 취업브리지 사업</h2>
				<p class="txt-exp">대학생 취업률 향상과 청년 자립 기반을 강화</p>
				<div class="grally-box">
					<div class="img-box">
						<img src=" <c:url value='/common/images/main-ban-02.png'/>" alt="대학생 취업률 향상과 청년 자립 기반을 강화하기 위해 대학의 전공과정 운영과 기업의 정기 현상실습을 연계하여능력 중심 채용방식의 새로운 채용 문화 선도 사업" />
					 			</div>
					<div class="avi-box">
						<!-- <iframe width="100%" height="100%" src="https://www.youtube.com/embed/kOy10SNwJ0w" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe> -->
						<%-- <img onclick="javascript:click_event();" style="width: 100%;" src="<c:url value='/common/images/thumbnail.png'/>" alt="YouTubeImage" /> --%>
						
						<video id="vid" poster="<c:url value='/images/sumnail.png'/>"  src="<c:url value='/video/promotional_video.mp4'/>" width="100%" height="100%" controls="controls">
						</video>
						
						<div class="txt">사업홍보영상</div>
					</div>
				</div>

				<div class="list-box">
					<div class="tit">참여대학</div>
					<div class="item-box">
						<div class="inner-box">
							<div class="img">
								<div class="inner-tb-box">
									<div class="inner-tb">
										<img src="<c:url value='/common/images/gachon_logo.png'/>" alt="가천대학교 로고" />
									</div>
								</div>
							</div>
							<ul>
								<li>- 오픈소스 클라우드 기반 웹· 모바일 응용SW</li>
								<li>- 빅데이터 인공지는 응용SW</li>
							</ul>
							<a href="<c:url value='/usr/contents.do?url=usr/contents/gachon'/>" class="btn-more">더보기</a>
						</div>
						<div class="inner-box">
							<div class="img">
								<div class="inner-tb-box">
									<div class="inner-tb">
										<img src="<c:url value='/common/images/suwon_logo.png'/>" alt="수원대학교 로고" />
									</div>
								</div>
							</div>
							<ul>
								<li>- AI ·IoT SW 개발 및 보안 관제 인력양성  과정</li>
								<li>- Smart Factory & 반도체 전공과정</li>
							</ul>
							<a href="<c:url value='/usr/contents.do?url=usr/contents/suwon'/>" class="btn-more">더보기</a>
						</div>
						<div class="inner-box">
							<div class="img">
								<div class="inner-tb-box">
									<div class="inner-tb">
										<img src="<c:url value='/common/images/chongkang_logo.png'/>" alt="청강문화산업대학교 로고" />
									</div>
								</div>
							</div>
							<ul>
								<li>- 5G 환경에 대비한 차세대 게임인력 양성 과정</li>
								<li>- 사물인터넷 기반 컴퓨터 비전 인재 양성 과정</li>
							</ul>
							<a href="<c:url value='/usr/contents.do?url=usr/contents/cheonggang'/>" class="btn-more">더보기</a>
						</div>
						<div class="inner-box">
							<div class="img">
								<div class="inner-tb-box">
									<div class="inner-tb">
										<img src="<c:url value='/common/images/hankyoung_logo.png'/>" alt="한경대학교 로고" />
									</div>
								</div>
							</div>
							<ul>
								<li>- 전력변환기 시스템 설계</li>
								<li>- ICT 축산산업 현장의 이론 및 실무</li>
							</ul>
							<a href="<c:url value='/usr/contents.do?url=usr/contents/hankyung'/>" class="btn-more">더보기</a>
						</div>
						<div class="inner-box">
							<div class="img">
								<div class="inner-tb-box">
									<div class="inner-tb">
										<img src="<c:url value='/common/images/hanoui_logo.png'/>" alt="한국외국어대학교 로고" />
									</div>
								</div>
							</div>
							<ul>
								<li>- 빅데이터 · 인공지능 응용 비즈니스 전공</li>
								<li>- 디지털 융합 경영 전공</li>
							</ul>
							<a href="<c:url value='/usr/contents.do?url=usr/contents/korea_foreign_language'/>" class="btn-more">더보기</a>
						</div>
						<div class="inner-box">
							<div class="img">
								<div class="inner-tb-box">
									<div class="inner-tb">
										<img src="<c:url value='/common/images/hansing_logo.png'/>" alt="한신대락교 로고" />
									</div>
								</div>
							</div>
							<ul>
								<li>- IoT 융합 빅데이터</li>
								<li>- IT 융합 영상 콘텐츠 과정</li>
							</ul>
							<a href="<c:url value='/usr/contents.do?url=usr/contents/hanshin'/>" class="btn-more">더보기</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- main-row-02 (E)-->

	<!-- main-row-03 (S)-->
		<section class="main-row-03 clear">
			<div class="base-inner">

				<h2>행사 일정 및 문의</h2>

				<div class="col-box-1">
						<!-- cal-month-box (S) -->
					
					
					<c:import url="/EgovPageLink.do?link=usr/cal/Calendar" />
					<!-- cal-month-box (E) -->

					
 				</div>

				<!-- col-box-2 (S) -->
				<div class="col-box-2">
					<div class="tel-box">
						<div class="box-tit">전화문의</div>
						<div class="txt"><a href="tel:031-270-9964" class="">031-270-9964</a></div>
					</div>
					<div class="qna-box">
						<div class="box-tit">게시판 문의</div>
						<div class="txt"><a href="javascript:goMenuPage_Sub('3000000','/QnaList.do');" class="">1:1문의 바로가기</a></div>
					</div>
				</div>
				<!-- col-box-2 (E) -->

				<!-- col-box-3 (S) -->
		
				<div class="col-box-3">
					<div class="qna-list-box">
						<div class="box-tit">자주 묻는 질문 모음</div>
												<div class="txt">
							<ul>
						<c:forEach var="result" items="${faqList}" varStatus="status">

							<li><a href="<c:url value='/FaqInqireCoUpdt.do?faqId=${result.faqId}' />"><div class="ellipsis"><c:out value="${result.qestnSj}"/></div></a></li>
						

						</c:forEach>
													</ul>
						</div>
						<div class="btn-more"><a href="<c:url value='/uss/olh/faq/FaqListInqire.do'/>">더보기</a></div>
					</div>
 				</div>
				<!-- col-box-3 (E) -->

			</div>
		</section>
		<!-- main-row-03 (E)-->
	<!-- footer 시작 -->
<c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" />
	<!-- //footer 끝 -->
</div>
<!-- //wrap end -->
</body>
</html>
<%

%>