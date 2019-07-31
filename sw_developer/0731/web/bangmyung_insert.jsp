<%@ page import="study.BangMyungVO" %>
<%@ page import="study.BangMyungDAO" %>
<%@ page import="study.BangMyungDAO_OracleImpl" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-07-31
  Time: 17:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="study.*" %>
<%
    Exception err = null;
    String gul = request.getParameter("gul");

    BangMyungVO pvo = new BangMyungVO();
    pvo.setGul(gul);

    BangMyungDAO dao = new BangMyungDAO_OracleImpl();
    try{
        dao.add(pvo);
    }catch (Exception e) { err = e; }

    err = new ClassNotFoundException();

    if(err != null) {
        session.setAttribute("error", err);
        response.sendRedirect("/0731/error.jsp");
    }
    else response.sendRedirect("/0731/bangmyung_list.jsp");
%>
<html>
<body>

</body>
</html>
