package main;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.net.URLConnection;

public class Test126 {
    public static void main(String[] args) throws Exception{
        /*
            URL의 소스코드를 다 읽어오는 애
            java.net.URL은 이것 자체가 작은 웹브라우저의 역할을 한다.
            요청을 날리고 그에 해당하는 응답을 받아들인다

            안드로이드 앱에서 버튼을 누르면 오늘의 배송정보가 넘어오는 ?
            배송정보는 서버에 올라와 있는 상태!
            => 이 다운 받는 역할, 서버에 존재하는 배송정보를 다운받는 역할을 수행한다.

            소켓으로 다 짜는 것이 아니라 http 프로토콜로 서버와 통신할 때는 이 클래스를 주로 이용한다.

            앱 같은 경우에서 서버로부터 많은 데이터를 다운 받아야 할 경우에 URL 클래스를 이용하여 jsp 파일로부터 정보를 다운받는다

            이게 워낙 많이 쓰이다 보니 이를 강화한 오픈 소스 라이브러리가 등장
             = apache http client 프로젝트 = 안드로이드의 http 기반 표준 통신 수단

             구글에서 httpclient-4.4.jar
         */

        URL rl = new URL("http://localhost:8081/0802/Test126.jsp?pw=1230");
        URLConnection ucon = rl.openConnection();
        InputStream in = ucon.getInputStream();

        BufferedReader bin = new BufferedReader(new InputStreamReader(in, "UTF-8")); //>> char 단위로 읽게해주는 adapter
        //사실 UTF-8 빼도 되더라 얜 응답 내용
        String l = null;
        while((l = bin.readLine()) !=null){
            System.out.println(l);
        }

        in.close();
    }
}
