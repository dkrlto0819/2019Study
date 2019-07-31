package study;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
servlet의 instance는 재활용된다.

instance는 재활용을 위해 내부적으로 적재되는데, 적재되는 시첨에 호출되는 함수가 init() ==> 최초 요청시에만 호출

 */

public class ConfigServlet extends HttpServlet {
    @Override
    public void service(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        System.out.println("service");


        //Context 경로
        String path = request.getContextPath();
        System.out.println("getContextPath : " + path);


        //IP 주소 다음 나오는 전체경로
        String uri = request.getRequestURI();
        System.out.println("getRequestURI : " + uri);


        // 접속한 브라우저의 IP 주소값
        String Addr = request.getRemoteAddr();
        System.out.println("getRemoteAddr : " + Addr);

        /*
        접속한 브라우저와 운영체제 정ㅂ를 담은 문자열이 얻어진다.
        이것을 이요하여 모바일로 접근한건지 컴으로 접근한 건지 알 수 있고 모바일용 화면과 컴용 화면을 구분하여 제공할 수 있다.
         */
        String header = request.getHeader("User-Agent");
        System.out.println("getHeader : " + header);
    }

    @Override
    public void init(ServletConfig config) throws ServletException{
        System.out.println("init");
        String val = config.getInitParameter("apple"); //==> web.xml 과 관련 여기에 설정된 내용을 읽어들일 수 있는 방법을 제공
        System.out.println(val);

        // WEB-INF 폴더의 절대경로값을 얻어온다.
        /*
        브라우저가 접근 못하는 폴더가 업로드 파일을 놓기에 가장 적합하다.
        허락 받고 (돈내고 다운 받을 때) FileInputStream 으로 읽어 내보낸다.
        그때 FileInputSream은 절대경로를 필요로 한다.
        그 경우에 getRealPath는 유용하게 쓰인다.
         */

        ServletContext application = config.getServletContext();
        String path = application.getRealPath("/WEB-INF/");
        System.out.println(path);
    }
}
