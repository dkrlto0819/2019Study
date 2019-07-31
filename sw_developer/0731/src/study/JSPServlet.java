package study;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class JSPServlet extends HttpServlet {
    private ServletContext application = null;
    private ServletConfig config = null;

    @Override
    public void init(ServletConfig config) throws ServletException{
        this.config = config;
        application = config.getServletContext();
    } // 적재되는 시점

    //-------------------------------------
    // <%! ... %> 은 여기에 온다.
    //int i=0;

    //-------------------------------------
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException{
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();

        out.flush();
        out.close();

        //-------------------------------------
        // <% ... %> 은 여기에 온다.
        // <%= ... %> 은 out.println(...); 으로 감싸져서 들어온다

        /*
        Test115.jsp는
        int j=0;
        out.println(i++);
        out.println(j++); 가 된다.
         */

        //-------------------------------------
    }
}
