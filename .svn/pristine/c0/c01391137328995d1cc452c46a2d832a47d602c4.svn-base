<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="egovframework.com.cmm.LoginVO"%>
<%@page import="egovframework.let.uat.uia.service.EgovLoginService"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>

  <%
  request.getSession().setAttribute("retUrl", "/egovLoginUsr.do");
  
  ServletContext ctx = pageContext.getServletContext();
  WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(ctx);
  EgovLoginService loginService = (EgovLoginService)wac.getBean("loginService");
 
  String clientId = "uF91FWsHZ_24iVL_5VPF";// 애플리케이션 클라이언트 아이디값";
	String clientSecret = "gvaWkKNWXN";// 애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://127.0.0.1:8080/pst_webapp/mainPage.do", "UTF-8");
	String apiURL;
	apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL += "client_id=" + clientId;
	apiURL += "&client_secret=" + clientSecret;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&code=" + code;
	apiURL += "&state=" + state;
	String access_token = "";
	String refresh_token = "";
	
	String id= "";

	try {
		URL url = new URL(apiURL);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("GET");
		int responseCode = con.getResponseCode();
		BufferedReader br;

		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
		}
		String inputLine;
		StringBuffer res = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {

			res.append(inputLine);
		}

		br.close();
		if (responseCode == 200) {

			int result = 0;
			String resultStr = "";
			resultStr = res.toString();

			String token = "";
			String selectedId = null;

			JSONParser parser = new JSONParser();
			Object obj = parser.parse(resultStr);
			JSONObject jsonObject = (JSONObject) obj;
			access_token = (String) jsonObject.get("access_token");
			refresh_token = (String) jsonObject.get("refresh_token");
			request.getSession().setAttribute("access_token", access_token); // 접근토큰

			String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
			try {

				String apiURL2 = "https://openapi.naver.com/v1/nid/me";
				URL url2 = new URL(apiURL2);
				HttpURLConnection con2 = (HttpURLConnection) url2.openConnection();
				con2.setRequestMethod("GET");
				con2.setRequestProperty("Authorization", header);
				int responseCode2 = con2.getResponseCode();
				BufferedReader br2;
				if (responseCode2 == 200) { // 정상 호출
					br2 = new BufferedReader(new InputStreamReader(con2.getInputStream()));
				} else { // 에러 발생
					br2 = new BufferedReader(new InputStreamReader(con2.getErrorStream()));
				}
				String inputLine2;
				StringBuffer response1 = new StringBuffer();

				while ((inputLine2 = br2.readLine()) != null) {

					response1.append(inputLine2);

				}

				br2.close();

				// 넘겨온 사용자 정보 response2 형 에서 response 항목 추출하기
				String resultStr2 = response1.toString();
				JSONParser parser2 = new JSONParser();
				Object obj2 = parser2.parse(resultStr2);
				JSONObject jsonObject1 = (JSONObject) obj2;
				JSONObject jsonObject2 = (JSONObject) jsonObject1.get("response");

				String sns_id = "";
				String sns_name = "";
				String sns_email = "";

				sns_id = (String) jsonObject2.get("id");
				sns_name = (String) jsonObject2.get("name");
				sns_email = (String) jsonObject2.get("email");
				System.out.println("sns_id:" +sns_id);
				/* loginService.selectIdLink(loginVO); */

				/* loginVO.setId(loginVO2.getId()); */
				LoginVO loginVO1 = new LoginVO();
				loginVO1.setN_id(sns_id);  //sns 전달 받은 id
 				loginVO1.setN_name(sns_name); //sns 전달받은 name
				loginVO1.setN_email(sns_email); //sns 전달받은 email
				
				//loginVO2 에 실제 id 값 확인
				System.out.println("loginVO2.getId() :"+sns_id);
				LoginVO loginVO2 = loginService.selectIdLink(loginVO1);
				System.out.println("loginVO2.getId() :"+loginVO2.getId());
				
				
				if(loginVO2 != null) { //연동유무 파악
					//VO 에 sns id 확인						
				/* 	LoginVO VO = loginService.selectNvLink(loginVO2); */
					System.out.println("loginVO2.getId() :" +loginVO2.getId());
					id= loginVO2.getId();
				}else {

					
				
				}

			} catch (Exception e) {
				System.out.println(e);
			}

		}
	} catch (Exception e) {
		System.out.println(e);
	}
 %>
 <script type="text/javascript">
 function sns_login(){
var success = document.loginForm;
var u_id = document.getElementById("id").value;
if(u_id == null || u_id == ""){
	alert("sns 연동이 설정되어 있지 않습니다.");
	location.href="<c:url value='/uat/uia/egovLoginUsr.do'/>";
}else{


/* document.loginForm.action="<c:url value='/uat/uia/actionSecurityLogin.do'/>"; */
success.submit();
}
 }
 
 
 </script>
 
 <body onload="javascript:sns_login();" >
<form name="loginForm" action="<c:url value='/uat/uia/actionSecurityLogin.do'/>" method="post">
<input type="hidden" name="message" value="">
<input type="hidden" name="id" id="id" value="<%=id %>" title="아이디" >
<input name="userSe" type="hidden" value="GNR">
<input name="j_username" type="hidden">
<input name="sns" type="hidden" value="naver">
 </form>
  </body>
</html>