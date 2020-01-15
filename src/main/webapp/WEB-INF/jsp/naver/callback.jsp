<%@page import="java.io.PrintWriter"%>
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
  
  ServletContext ctx = pageContext.getServletContext();
  WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(ctx);
  EgovLoginService loginService = (EgovLoginService)wac.getBean("loginService");
  
  String clientId = "uF91FWsHZ_24iVL_5VPF";// 애플리케이션 클라이언트 아이디값";
	String clientSecret = "gvaWkKNWXN";// 애플리케이션 클라이언트 시크릿값";
	String code = request.getParameter("code");
	String state = request.getParameter("state");
	String redirectURI = URLEncoder.encode("http://127.0.0.1:8080/pst_webapp/OtherMenu.do", "UTF-8");
	String apiURL_N;
	apiURL_N = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
	apiURL_N += "client_id=" + clientId;
	apiURL_N += "&client_secret=" + clientSecret;
	apiURL_N += "&redirect_uri=" + redirectURI;
	apiURL_N += "&code=" + code;
	apiURL_N += "&state=" + state;
	try {
		URL url_N = new URL(apiURL_N);
		HttpURLConnection con_N = (HttpURLConnection) url_N.openConnection();
		con_N.setRequestMethod("GET");
		int responseCode_N = con_N.getResponseCode();
		BufferedReader br_N;
		if (responseCode_N == 200) { // 정상 호출
			br_N = new BufferedReader(new InputStreamReader(con_N.getInputStream()));
		} else { // 에러 발생
			br_N = new BufferedReader(new InputStreamReader(con_N.getErrorStream()));
		}
		String inputLine_N;
		StringBuffer res_N = new StringBuffer();
		while ((inputLine_N = br_N.readLine()) != null) {

			res_N.append(inputLine_N);
		}
		br_N.close();
		if (responseCode_N == 200) {
			
			
			
System.out.println("res.toString() :" +res_N.toString());

int result = 0;
String resultStr = "";
resultStr = res_N.toString();

String token = "";
String access_token = "";
String refresh_token = "";
String selectedId = null;

JSONParser parser = new JSONParser();
Object obj = parser.parse(resultStr);
JSONObject jsonObject = (JSONObject) obj;
access_token = (String) jsonObject.get("access_token");
refresh_token = (String) jsonObject.get("refresh_token");
request.getSession().setAttribute("access_token", access_token); // 접근토큰

String header = "Bearer " + access_token; // Bearer 다음에 공백 추가
try {
	String apiURL = "https://openapi.naver.com/v1/nid/me";
	URL url = new URL(apiURL);
	HttpURLConnection con = (HttpURLConnection) url.openConnection();
	con.setRequestMethod("GET");
	con.setRequestProperty("Authorization", header);
	int responseCode = con.getResponseCode();
	BufferedReader br;
	if (responseCode == 200) { // 정상 호출
		br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	} else { // 에러 발생
		br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	}
	String inputLine;
	StringBuffer response1 = new StringBuffer();

	while ((inputLine = br.readLine()) != null) {

		response1.append(inputLine);

	}

	br.close();

	// 넘겨온 사용자 정보 response2 형 에서 response 항목 추출하기
	String resultStr2 = response1.toString();
	JSONParser parser2 = new JSONParser();
	Object obj2 = parser2.parse(resultStr2);
	JSONObject jsonObject1 = (JSONObject) obj2;
	JSONObject jsonObject2 = (JSONObject) jsonObject1.get("response");

	String id = "";
	String name = "";
	String email = "";

	id = (String) jsonObject2.get("id");
	name = (String) jsonObject2.get("name");
	email = (String) jsonObject2.get("email");

	
	LoginVO loginVO2 = (LoginVO) session.getAttribute("LoginVO");
	LoginVO loginVO = new LoginVO();
	
	loginVO.setId(loginVO2.getId());
	loginVO.setN_id(id);
	loginVO.setN_name(name);
	loginVO.setN_email(email);
	LoginVO VO = loginService.selectNvLink(loginVO);
	selectedId = loginVO2.getUniqId();
	String ck_id;
	
	if (VO == null) {
		loginService.insertNvLink(loginVO);
		ck_id = "0";
	}else{
		ck_id = VO.getId();
	}
	
	

	
	

  %>
  <script type="text/javascript">
 function move_url(){
	 var chk_VO ="<%=ck_id%>";
	 var selectedId ="<%=selectedId%>";
	 if(chk_VO == "0"){
		 alert("연동이 완료되었습니다.");
			location.href="<c:url value='/MberUpdtView.do?selectedId='/>"+selectedId;
	 }else{
		 alert("이미 연동이 되어있습니다.");
			location.href="<c:url value='/MberUpdtView.do?selectedId='/>"+selectedId;
	 }

 }
  </script>
  <body onload="javascript:move_url();">
  </body>
  
  <%
  
  
  
} catch (Exception e) {
	System.out.println(e);
}






		}
	} catch (Exception e) {
		System.out.println(e);
	}
	
	%>
</html>