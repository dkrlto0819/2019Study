package mvc;

import study.BangMyungDAO;
import study.BangMyungDAO_OracleImpl;
import study.BangMyungVO;
import study.Util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@RequestMapping("/apple_add2.do")
public class CtrlAdd2 implements Controller{
    @Override
    public String handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String gul = Util.toKorean(request.getParameter("gul"));
        BangMyungVO vo = new BangMyungVO();
        vo.setGul(gul);

        BangMyungDAO dao = new BangMyungDAO_OracleImpl();
        dao.add(vo);

        return "redirect:/apple_list.do";
    }
}
