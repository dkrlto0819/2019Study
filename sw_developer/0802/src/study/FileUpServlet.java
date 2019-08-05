package study;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.rmi.ServerException;

public class FileUpServlet extends HttpServlet {

    private ServletContext application = null;

    @Override
    public void init(ServletConfig config) throws ServletException{
        application = config.getServletContext();
    }

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response)
        throws ServerException, IOException {
        String l = process2(request);
        System.out.println(l);
    }

    public String process2(HttpServletRequest request) throws IOException {
        // fileup 디렉토리의 실제 저장위치 (절대경로) 값을 파악한다.
        String path = application.getRealPath("/WEB-INF/fileup"); //업로드 이루워질 폴더
        System.out.println(path);

        MultipartRequest mpr = new MultipartRequest
                (request, path, 1024 * 1024 * 20,
                        "UTF-8", new DefaultFileRenamePolicy()); //maximum 20MB file

        //DefaultFileRenamePolicy => 중복 파일이 있으면 자동으로 이름을 바꿔 올려주는 역할
        // ==> 올릴 떄 이름과 서버 저장 이름과 다를 수 있다!

        String ofn = mpr.getOriginalFileName("apple");  //업로드한 원래 파일의 이름 (파라미터 값!!!)
        String fsn = mpr.getFilesystemName("apple");  //중첩되는 경우의 이름 = 서버에 올라가는 이름
        System.out.println(ofn + ", " + fsn);

        String title = mpr.getParameter("title");
        // multiPartRequest를 쓰면 기존의 request.getParameter 못 씀
        // 대신 MultipartRequest 안의 getParameter 써야함/한글처리 내부에서 다 해줌
        System.out.println(title);



        return null;
    }

    public String process(HttpServletRequest request) throws IOException{
        byte[] buf = new byte[1024];
        int len = 0;

        StringBuffer sb = new StringBuffer();
        InputStream in = request.getInputStream(); //클라이언트 파일? 브라우저에서 넘어은 정보
        while((len = in.read(buf)) != -1){
            sb.append(new String(buf, 0, len));
        }

        return sb.toString();
    }
}

/*
request는 요청, 브라우저에서 서버로 전달하는 개념
request.getInputStream()을 이용해 브라우저에서 서버로 전달되는 내용을 볼 수 있다.

이 내용을 재구성하는 기능이 cos.jar 파일의 MultipartRequest이다.
 */