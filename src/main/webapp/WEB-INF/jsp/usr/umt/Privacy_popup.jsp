<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/'/>css/import.css" rel="stylesheet"
	type="text/css">
<link href="<c:url value='/'/>css/www-player-webp-vflfcplvs.css"
	rel="stylesheet" type="text/css">
<link href="<c:url value='/'/>css/dev.css" rel="stylesheet"
	type="text/css">
</head>
<script type="text/javascript">
function WinClose()
{
  window.open('','_self').close();     

}
</script>

<body>
	<div id="wrap">
		<div id="bodywrap">
			<div class="cont-body-wrap">
			
				<div id="content_field">
					<!--detail area start -->
					<div class="body-box">
						<style>
							.sec {margin-bottom:1rem;}
							h3 {text-align:center;font-size:2.5rem;margin-bottom:1.5rem;}
							.btnarea {text-align:center;padding:1rem;}
						</style>
						<div class="base-inner" style="width:54rem;">
						
								<h3>개인정보 수집 이용 동의</h3>
									<c:import url="doc/Terms2.jsp"></c:import>
							<div class="btnarea">
								<a href="#" onclick="javascript:WinClose();" class="btn1">닫기</a>
							</div>

						</div>
						<!-- contents end -->
					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>