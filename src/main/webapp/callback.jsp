<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "TL11ctejeQmKQ8lNwsqf";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "EimsKdLZyB";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    String state = request.getParameter("state");
    String redirectURI = URLEncoder.encode("http://127.0.0.1:8080/pst_webapp/", "UTF-8");
    String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      br.close();
      if(responseCode==200) {
    	  
    	  
    	  String resultStr	= "";
    	  resultStr	= res.toString();
    	  
    	  String token = "";
    	  System.out.println("res: "+resultStr);
    	  
    	  
    	  String str = resultStr;
    	  String[] array = str.split(":");
		    
    	//출력				
    	for(int i=0;i<array.length;i++) {
    		System.out.println(array[1]);
    		
    	  	  /* String[] array2 = str2.split(",");
    		for(int j=0; j<array[i].length(); j++){
    	
  	System.out.println(array2[j]);
    		}  */
    	}
    	  String str2 = array[1];
    	String[] array2 = str2.split(",");
		for(int j=0; j<array2.length; j++){
			token = array2[0];
	System.out.println(array2[0]);
		}
    	  
       // 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
     
     
        String header = "Bearer " + token; // Bearer 다음에 공백 추가
        try {
             apiURL = "https://openapi.naver.com/v1/nid/me";
             url = new URL(apiURL);
             con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("Authorization", header);
             responseCode = con.getResponseCode();
             int responseCode2 = con.getResponseCode();
             BufferedReader br2;
            if(responseCode2==200) { // 정상 호출
                System.out.println("sucess");
                br2 = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                System.out.println("fail");
                br2 = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine2;
            StringBuffer response2 = new StringBuffer();
   
            while ((inputLine2 = br2.readLine()) != null) {
                System.out.println("inputLine2 :" +inputLine2);
            	response2.append(inputLine2);
            }
            br.close();
            System.out.println(response2.toString());
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