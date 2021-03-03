package com.main.cmmn.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class SearchAPI {


    public static String main(String args) {
        String clientId = "gw0K9JtPXRoEcL0wzQiG";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "5qZkyA1A6U";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(args, "UTF-8");
            //String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text; // json 결과
            String apiURL = "https://openapi.naver.com/v1/search/news?query="+ text; // json 결과
            
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            //String apiURL = "https://openapi.naver.com/v1/search/news.xml?query="+ text;
            //String apiURL = "https://openapi.naver.com/v1/search/local.xml?query="+ text;
            
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            
            String cont = response.toString();
            //System.out.println(response.toString());
            return cont;
        } catch (Exception e) {
        	System.out.println(e);
        }
        return null;
    }
    
}
