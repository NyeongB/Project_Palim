package com.palim.dao;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class ApiDAO {

   public List getSearchList(String search, int number)throws IOException {


      List resultList = new ArrayList();
      String clientId = "M4vUIeo4s5bE1me9G6NX";//애플리케이션 클라이언트 아이디값";
      String clientSecret = "9tajP4Bfap";//애플리케이션 클라이언트 시크릿값";
      JsonParser jsonParser = new JsonParser();
      try {
         BufferedReader br;
         br = new BufferedReader(new InputStreamReader(System.in));
//         StringTokenizer st = new StringTokenizer(search);
         // 텍스트 인코딩 작업
         String text = URLEncoder.encode(search, "UTF-8");
         
         
         // 쿼리 뒤에 입력받은 상품을 붙혀 API 날림
         String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + text+"?display=100?sort=dsc";

         URL url = new URL(apiURL);
         HttpURLConnection con = (HttpURLConnection) url.openConnection();
         con.setRequestMethod("GET");
         con.setRequestProperty("X-Naver-Client-Id", clientId);
         con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
         int responseCode = con.getResponseCode();

         if (responseCode == 200) { //  정상적으로 API 가 받아졌을 때
            br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         } else {  // 어떠한 문제가 발생했을 때
            br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
         }
         // 도출된 에러,상품정보 API의 출력값을 둘다 읽음
         String inputLine;
         StringBuffer response = new StringBuffer();
         while ((inputLine = br.readLine()) != null) {
            response.append(inputLine);
         }
         br.close();



         /*Json 파싱 작업 , 사용한 라이브러리 : google Gson */
         // 기존의 response를 tmpJson함수에 저장
         String tmpJson =  response.toString();

         //lastbuildDate jsonObject 불러오기 , date변수에 매핑
         JsonObject jsonObject1 = (JsonObject)jsonParser.parse(tmpJson);
         //         String date = jsonObject1.get("lastBuildDate").getAsString();

         //date 값 확인
         //         System.out.println("-------------------"+"주식회사 Palim 입니다.조회 시간은" + date+"------------------");
         // Item JsonObject 불러오기

         JsonArray jsonArray = (JsonArray)jsonObject1.get("items");
         Collection<Map<String,String>> list = new ArrayList();
         for (int i = 0; i < jsonArray.size(); i++) {
            //아이템의 JSONArray 불러오는 코드
            JsonObject object = (JsonObject) jsonArray.get(i);
            // 파싱 작업하고 String 변수에 넣어놈
            Map<String, String> input = new HashMap();
            String  lprice = object.get("lprice").getAsString();
            String  title1 = object.get("title").getAsString();
            String  hprice = object.get("hprice").getAsString();
            String  mallName = object.get("mallName").getAsString();
            String  Link = object.get("link").getAsString();
            String  image = object.get("image").getAsString();
            String  productid = object.get("productId").getAsString();
            String  productType = object.get("productType").getAsString();
            String title=title1.replace("<b>", "");
            title=title.replace("</b>", "");
            input.put("productId",productid);
            input.put("title",title);
            input.put("link",Link);
            input.put("image", image);
            input.put("lprice", lprice);
            input.put("productType", productType);
            if(Integer.parseInt(productType)!=1){
               continue;
            }
            list.add(input);
            if((i+1)%number==0 || i==jsonArray.size()-1) {
               List addList = new ArrayList();
               addList.addAll(list);
               resultList.add(addList);
               list.clear();
            }
         }
      }
      catch (Exception e) {
         System.out.println(e);
      }
      return resultList;
   }
}
//         String address = "http://localhost:8888/Project_Palim/APIJson/"+search+".txt";
//         List resultList = new ArrayList();
//         BufferedReader br;
//         URL url;
//         HttpURLConnection conn;
//         String protocol = "GET";
//         url = new URL(address);
//         conn = (HttpURLConnection)url.openConnection();
//         conn.setRequestMethod(protocol);
//         try {
//            br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//            String json = br.readLine();
//
//            JSONParser parser = new JSONParser();
//            JSONObject obj;
//            try {
//               obj = (JSONObject)parser.parse(json);
//               JSONArray items = (JSONArray)obj.get("items");
//                     
//               Collection<Map<String,String>> list = new ArrayList();   
//               
//               for(int i =0; i<items.size();i++ ){
//                  Map<String, String> input = new HashMap();
//                  JSONObject tmp = (JSONObject)items.get(i);
//                  input.put("productId", (String)tmp.get("productId"));
//                  String title2=(String)tmp.get("title");
//                  String title=title2.replace("<b>", "");
//                  title=title.replace("</b>", "");
//                  input.put("title",title);
//                  input.put("link", (String)tmp.get("link"));
//                  input.put("image", (String)tmp.get("image"));
//                  input.put("lprice", (String)tmp.get("lprice"));
//                  input.put("productType", (String)tmp.get("productType"));
//                  if(Integer.parseInt((String)tmp.get("productType"))!=1){
//                      continue;
//                   }
//                  list.add(input);
//                     if((i+1)%number==0 || i==items.size()-1) {
//                        List addList = new ArrayList();
//                        addList.addAll(list);
//                        resultList.add(addList);
//                        list.clear();
//                     }               
//                  }
//               } catch (ParseException e) {
//               e.printStackTrace();
//            }   
//         } catch (java.io.FileNotFoundException e) {
//            resultList=null;
//         }      
//         return resultList;
//      }   
//}