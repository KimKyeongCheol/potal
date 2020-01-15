<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Enumeration"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="egovframework.com.cmm.LoginVO"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<%
LoginVO loginVO = (LoginVO) session.getAttribute("LoginVO");
String clientId = "TL11ctejeQmKQ8lNwsqf";// 애플리케이션 클라이언트 아이디값";
String clientSecret = "EimsKdLZyB";// 애플리케이션 클라이언트 시크릿값";
String code = request.getParameter("code");
String state = request.getParameter("state");
String redirectURI = URLEncoder.encode("http://127.0.0.1:8080/pst_webapp/sns_actionSecurityLogin.do", "UTF-8");
String apiURL;
apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
apiURL += "client_id=" + clientId;
apiURL += "&client_secret=" + clientSecret;
apiURL += "&redirect_uri=" + redirectURI;
apiURL += "&code=" + code;
apiURL += "&state=" + state;
String access_token = "";
String refresh_token = "";

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
			StringBuffer response = new StringBuffer();

			while ((inputLine2 = br2.readLine()) != null) {

				response.append(inputLine2);

			}

			br2.close();

			// 넘겨온 사용자 정보 response2 형 에서 response 항목 추출하기
			String resultStr2 = response.toString();
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

			/* loginService.selectIdLink(loginVO); */

			/* loginVO.setId(loginVO2.getId()); */
			loginVO.setN_id(id);
			loginVO.setN_name(name);
			loginVO.setN_email(email);
			
			LoginVO loginVO2 = loginService.selectIdLink(loginVO);
			
			if(loginVO2 != null) {

				LoginVO VO = loginService.selectNvLink(loginVO2);
				if (VO != null) {
					String u_id = VO.getN_id();
					selectedId = loginVO2.getId();

					if (u_id == null) {
						
						return "redirect:/uat/uia/egovLoginUsr.do";
					} else if (u_id != null) {
					
						loginVO.setId(selectedId);
						loginVO.setUserSe("GNR");
						loginVO.setPassword("");
						
						model.addAttribute("id", selectedId);
						model.addAttribute("userSe", "GNR");
						model.addAttribute("password", "rkd@321654");
						model.addAttribute("j_username", "");
						model.addAttribute("message", "");
						
						return "redirect:/uat/uia/actionSecurityLogin.do";
					}
				} else {
				
					return "redirect:/uat/uia/egovLoginUsr.do";
				}
			}else {

				
				return "redirect:/uat/uia/egovLoginUsr.do";
			}

		} catch (Exception e) {
			System.out.println(e);
		}

	}
} catch (Exception e) {
	System.out.println(e);
}

%>


</body>
</html>