package study;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.rmi.ServerException;

// /session 으로 접근 가능하게 만드세요
/*
http://localhost:8081/0731/state?use=readCookie
JSESSIONID, F80C01959241ACDCF5DAECE8C0D77A6B >>  얜 대체 무엇이여 모두? 세션 번호!

최초 getSession() 호출시에는 고유넘버가 없이 요청이 들어온다.
- 기억장소 생성 MAP<String, Object> 형태
- 고유넘버 생성
- JSESSIONID 키 값으로 고유넘버를 쿠키에 저장

그 이후에 getSession() 호출 : 고유 넘버 물고 왔으니 그걸로 기억장소를 찾는다.
브라우저마다 개별적인 기억장소가 생성된다.
 */

public class SessionServlet extends HttpServlet {
    @Override
    protected void service (HttpServletRequest request, HttpServletResponse response)
            throws ServerException, IOException {
        //처음만 true 나
        HttpSession session = request.getSession();
        System.out.println(session.isNew());

        session.setAttribute("apple", "Object!!");
        Object value = session.getAttribute("apple");
        System.out.println(value.toString());
    }
}
