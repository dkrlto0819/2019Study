package mvc;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

public class DispatcherServlet extends HttpServlet {
    private Map<String, Controller> map = null;

    @Override
    public void init(ServletConfig config) throws ServletException{
        map = new Hashtable<String, Controller>();

        String cs = config.getInitParameter("controllers");
        for(String str : cs.split(",")){
            try{
                //해당 클래스 가져오고
                Class<?>  cls = Class.forName(str.trim());

                //RequestMapping에서 지정된 url 패턴 따오고
                RequestMapping an = cls.getAnnotation(RequestMapping.class); //얘 때문에 Controller에너는 Annotation!
                System.out.println("this is an : " + an);

                //해당 controller instance 받아오고
                Controller value = (Controller) cls.newInstance(); // 이름이 str인 Controller 클래스 찾기
                // url 따기
                String key = an.value();

                //url-pattern과 controller 매핑
                map.put(key, value);
            }catch (Exception e) {}
        } //String[] cs2 = cs.split(","); for(int i=0;i<cs2.length;i++)
        System.out.println(map.toString());
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String ctxPath = request.getContextPath();
        String uri = request.getRequestURI();

        uri = uri.substring(ctxPath.length()); //contextPath 다 잘라 버리고요~

        Controller ctrl = map.get(uri);
        if(ctrl == null){
            System.out.println("해당 요청은 미등록입니다.");
            return;
        }
        try {
            String l = ctrl.handleRequest(request, response);

            if(l==null){

            }else if(l.startsWith("redirect:")){
                response.sendRedirect(ctxPath + l.substring(9));
            }else{
                RequestDispatcher rd = request.getRequestDispatcher(l);
                rd.forward(request, response);
            }
        } catch (Exception e) {
            //매 jsp 마다 에러페이지로 가는 로직을 안 만들어도 되더라...
            HttpSession session = request.getSession();
            session.setAttribute("error", e);

            response.sendRedirect(ctxPath + "/apple_error.jsp");
            e.printStackTrace();
        }
    }
}
