package study;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// /study/state 로 접근 가능하게 세팅하세요
// >> 나는 /0731/state
// http://localhost:8081/0731/state?use=addCookie

/*
servlet => 요청과 응답. 방법은 2가지 :: GET/POST
GET은 엽서, POST는 택배

http://localhost:8081/0731/state?use=addCookie
엽소의 주소와 내욜을 구분하는 선의 역할 : ?
? 오른쪽의 내용은 key=value 형태로 구성되고 request.getParameter를 이용하여 추출 가능

거의 대부분 GET 방식이고 form에서 method="POST" 로 지정된 경우만 POST

response는 응답 쪽에 관여한다

 */
public class StateServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
    throws IOException, ServletException {
        String use = request.getParameter("use");

        if("addCookie".equals(use)){
            Cookie ck = new Cookie("name", "choco");
            response.addCookie(ck);
        }
        else if ("readCookie".equals(use)){
            Cookie[] cks = request.getCookies();
            if(cks != null){
                for (int i = 0; i < cks.length; i++) {
                    System.out.println(cks[i].getName() + ", " + cks[i].getValue());
                }
            }else{
                System.out.println("Cookie is null");
            }
        }
    }
}
