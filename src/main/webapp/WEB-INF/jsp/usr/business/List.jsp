<!-- 2019.12.10 사업신청 추가 -->
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="egovframework.com.cmm.service.EgovProperties"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="egovframework.com.cmm.LoginVO"%>
<c:set var="ImgUrl" value="/images/egovframework/cop/bbs/" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="content-language" content="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, user-scalable=no">
<link href="<c:url value='/'/>css/font.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/reset.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/slick.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/layout.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/only_ie.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/style.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/mobile.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet"
	type="text/css">

<!--[if lt IE 9]>
	<script src="../common/js/html5shiv.min.js"></script>
	<script src="../common/js/respond.min.js"></script>
<![endif]-->

<script src="http://code.jquery.com/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<script src="<c:url value='/js/slick.js' />"></script>
<script src="<c:url value='/js/css_common.js' />"></script>

<c:if test="${anonymous == 'true'}">
	<c:set var="prefix" value="/anonymous" />
</c:if>
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<c:choose>
	<c:when test="${preview == 'true'}">
		<script type="text/javascript">
		<!--
			function press(event) {
			}

			function fn_egov_addNotice() {
			}

			function fn_egov_select_noticeList(pageNo) {
			}

			function fn_egov_inqire_notice(nttId, bbsId) {
			}
			function search_bbs() {
			}
		//-->
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
		<!--
			function press(event) {
				if (event.keyCode == 13) {
					fn_egov_select_noticeList('1');
				}
			}

			function fn_egov_addNotice() {
				document.frm.action = "<c:url value='/cop/bbs${prefix}/addBoardArticle.do'/>";
				document.frm.submit();
			}

			function fn_egov_select_noticeList(pageNo) {
				document.frm.pageIndex.value = pageNo;
				document.frm.action = "<c:url value='/selectBoardList_user.do'/>";
				document.frm.submit();
			}

			function fn_egov_inqire_notice(nttId, bbsId) {
				//document.subForm.nttId.value = nttId;
				//document.subForm.bbsId.value = bbsId;
				//document.subForm.action = "<c:url value='/cop/bbs${prefix}/selectBoardArticle.do'/>";
				//document.subForm.submit();
			}

			function view_bbs(th) {
				$(th).parent().submit();
			}
			function search_bbs() {
				var search_Text = document.getElementById("searchText").value;
				if (search_Text == "" || search_Text == null) {
					alert("검색어를 입력해주세요.");
				} else if (search_Text != "" || search_Text != null) {
					document.frm.submit();
				}

			}
		//-->
		</script>
	</c:otherwise>
</c:choose>
<title>접수관리</title>
</head>
<body>
	<!-- header start -->
	<div id="subheader">
		<c:import url="/sym/mms/EgovMainMenuHead.do" />
	</div>
	<!-- //header end -->
	<div class="content-wrap">
		<!-- class : path-wrap : (S) -->
		<div class="path-wrap">
			<div class="base-inner">
				<div class="path-list-box">
					<ul>
						<li><a href=""><span class="ico-home">홈</span></a></li>
						<li><a href="">사업신청</a></li>
						<li><a href="">접수관리</a></li>
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

		<!-- class : cont-body-wrap : (S) -->
		<div class="cont-body-wrap">

			<div class="cont-tit-box">
				<h2 class="h2">사업 신청 내역</h2>
			</div>

			<!-- class : body-box : (S) -->
			<div class="body-box">

				<!-- class : base-inner : (S) -->
				<div class="base-inner">
					<!-- class : board-list-box : (S) -->
					<div class="board-list-box">
						<!-- class : tb-01 : (S) -->
						<div class="tb-01">
							<table>
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="*">
									<col width="20%">
									<col width="15%">
									<col width="15%">
									<col width="15%">
								</colgroup>
								<thead>
									<tr>
										<th scope="col" class="tb-pc">번호</th>
										<th scope="col" class="tb-pc">신청년도</th>
										<th scope="col" class="tb-pc">사업명</th>
										<th scope="col" class="tb-pc">대학명</th>
										<th scope="col" class="tb-pc">신청자명</th>
										<th scope="col" class="tb-pc">신청상태</th>
										<th scope="col" class="tb-pc">신청일</th>
									</tr>
								</thead>
								<tbody>
									<p style="margin-bottom: 10px;">총 신청내역 : ${resultCnt }건</p>
									<c:if test="${fn:length(resultList) == 0 }">
										<tr>
											<td colspan="7">신청내역이 없습니다. 로그인 후 확인바랍니다.</td>
										</tr>
									</c:if>
									<c:if test="${fn:length(resultList) != 0 }">
										<c:forEach var="result" items="${resultList}"
											varStatus="status">
											<tr>
												<td>
													<c:out value="${paginationInfo.totalRecordCount+1 - ((searchVO.pageIndex-1) * searchVO.pageSize + status.count)}" />
												</td>
												<td>${result.year }</td>
												<fmt:parseNumber var="no" value="${result.seq }" />
												<td><a
													href="<c:url value='/business_view.do?seq=${no }&pageIndex=${searchVO.pageIndex }'/>"
													class="ellipsis">${result.business_name }</a></td>
												<td>${result.univ_name }</td>
												<td>${result.w_name }</td>
												<td><c:choose>
														<c:when test="${result.state == '1'}">접수중</c:when>
														<c:when test="${result.state == '2'}">보완요청</c:when>
														<c:when test="${result.state == '3'}">보완완료</c:when>
														<c:otherwise>승인</c:otherwise>
													</c:choose></td>
												<fmt:parseDate value="${result.write_date}" var="write_date"
													pattern="yyyy-MM-dd HH:mm:ss" />
												<fmt:formatDate value="${write_date}" pattern="yyyy-MM-dd"
													var="date" />
												<td>${date }</td>
											</tr>
										</c:forEach>
									</c:if>
								</tbody>
							</table>
						</div>
					</div>
					<div class="board-btm-box">
						<div class="box_paging">
							<ul class="pagination">
								<ui:pagination paginationInfo="${paginationInfo}" type="image"
									jsFunction="fn_egov_select_noticeList" />
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<c:import url="/EgovPageLink.do?link=usr/inc/EgovIncFooter" />
	</div>
</body>
</html>
<!-- 2019.12.10 사업신청 추가 -->