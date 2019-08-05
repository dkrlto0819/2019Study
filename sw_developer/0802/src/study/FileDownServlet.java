package study;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

public class FileDownServlet extends HttpServlet {
    @Override
    protected void service (HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException{
        String fsn = request.getParameter("fsn");
        String ofn = request.getParameter("ofn");

        if(ofn == null){
            ofn = fsn;
        }

        System.out.println(fsn);

        String path = request.getServletContext().getRealPath("/WEB-INF/fileup");
        path = path + "/" + fsn;

        response.setContentType("application/octet-stream"); // 응답 이전에 클라이언트에게 통보하는 기능

        // 다운받으면서 저장되는 파일의 이름을 지정할 수 있다.
        response.setHeader("content-disposition", "attchment;filename=" + ofn);
        // 저장되는 이름은 다른데 보내는 건 같은 이름이어야 하니까 나오는 메커니즘

        /*
        전송 이전에 어떤 성격의 정보를 전달할 지를 먼저 브라우저에 ㅌㅇ보한다.
        application/octet-stream과 같은 것을 MIME TYPE 이라고 한다
        국제적으로 정해져 있음
         */

        //서버에 보관중인 파일ㅇ르 읽어서 브라우저로 내보내는 전송 프로그램
        InputStream in = new FileInputStream(path);
        OutputStream out = response.getOutputStream();

        byte[] buf = new byte[1024*4];
        int len = 0;
        while ((len = in.read()) != -1){
            out.write(buf, 0, len);
            out.flush();
        }

        out.close();
        in.close();
    }
}
