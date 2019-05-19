import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;


public abstract class Main {



    public static void main(String[] args) {

        String clientId = "M4vUIeo4s5bE1me9G6NX";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "9tajP4Bfap";//애플리케이션 클라이언트 시크릿값";
        JsonParser jsonParser = new JsonParser();
        try {
            BufferedReader br;
            br = new BufferedReader(new InputStreamReader(System.in));

            // 상품 사용자에게 입력받음
            String Item_name = br.readLine();
            // 텍스ㅌ 인코딩 작업
            String text = URLEncoder.encode(Item_name, "UTF-8");
            ;
            // 쿼리 뒤에 입력받은 상품을 붙혀 API 날림
            String apiURL = "https://openapi.naver.com/v1/search/shop.json?query=" + text;

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
            String date = jsonObject1.get("lastBuildDate").getAsString();

            //date 값 확인
            System.out.println("-------------------"+"주식회사 Palim 입니다.조회 시간은" + date+"------------------");
            // Item JsonObject 불러오기

            JsonArray jsonArray = (JsonArray)jsonObject1.get("items");

            for (int i = 0; i < jsonArray.size(); i++) {


                //아이템의 JSONArray 불러오는 코드
                JsonObject object = (JsonObject) jsonArray.get(i);
                // 파싱 작업하고 String 변수에 넣어놈
                String  lprice = object.get("lprice").getAsString();
                String  title = object.get("title").getAsString();
                String  hprice = object.get("hprice").getAsString();
                String  mallName = object.get("mallName").getAsString();
                String  Link = object.get("link").getAsString();
                String  image = object.get("image").getAsString();


                // 출력값 확인
                System.out.println("아이템 이름: "+title);
                System.out.println("제일 싼 가격: "+lprice);
                System.out.println("제일 비싼 가격:"+hprice);
                System.out.println("판매 지역:"+mallName);
                System.out.println("구매 링크:"+Link);
                System.out.println("상품 사진"+ image);
                System.out.println();
            }

        } catch (Exception e) {
            System.out.println(e);
        }
    }
}