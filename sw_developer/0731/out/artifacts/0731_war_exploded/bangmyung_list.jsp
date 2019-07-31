<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-07-31
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"
import="java.util.List, study.*"%><%
    //1. 변수선언
    List<BangMyungVO> rl = null;
    String gul = request.getParameter("gul");
    Exception err = null;


    //2. DB연동
    BangMyungDAO dao = new BangMyungDAO_OracleImpl();
    try{
        rl = dao.findAll();
    }catch (Exception e ) {err = e;}

    //3. 흐름 만들기
    if(rl == null || err != null){
        response.sendRedirect("/study/error.jsp");
    }else{
%>
    <html>
        <body>
            <table border=\"0\" cellspacing='2' cellpadding='8'>
                <% for( BangMyungVO vo : rl ) { %>
                <tr>
                    <td><%=vo.getNo()%></td>
                    <td><%=vo.getGul()%></td>
                    <td><%=vo.getTheTime()%></td>
                </tr>
            <% } %>
            </table>
            <br />
            <form method="POST" action="bangmyung_insert.jsp">
                <input type="text" name="gul" size="50"/>
                <input type="submit"/>
            </form>
        </body>
    </html>

<% } %>
