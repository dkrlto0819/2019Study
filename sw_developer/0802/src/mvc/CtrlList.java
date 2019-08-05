package mvc;

import study.BangMyungDAO;
import study.BangMyungDAO_OracleImpl;
import study.BangMyungVO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@RequestMapping("/apple_list.do")
public class CtrlList implements Controller {
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {

        BangMyungDAO dao = new BangMyungDAO_OracleImpl(); //얘네가 모델클래스가 되는 것
        List<BangMyungVO> rl = dao.findAll();

        request.setAttribute("rl", rl);
        return "/apple_list.jsp";
    }
}
