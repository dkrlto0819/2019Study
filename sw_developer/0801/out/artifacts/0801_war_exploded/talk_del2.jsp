<%@ page import="study.Util" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-01
  Time: 13:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%><%
    String ctxPath = request.getContextPath();
    int talkNo = Util.parseInt(request.getParameter("talkNo"));
    int roomNo = -1;
    String level = null;
    Exception err = null;

    Cookie[] cks = request.getCookies();
    if(cks == null){
        response.sendRedirect(ctxPath + "/talk_login.jsp");
        return;
    }

    for (int i = 0; i < cks.length; i++) {
        if(cks[i].getName().equals("level"))
            level = cks[i].getValue();
        else if(cks[i].getName().equals("roomNo"))
            roomNo = Util.parseInt(cks[i].getValue());
    }

    if(level == null || roomNo == -1 || !level.equals("apple")){
        response.sendRedirect(ctxPath + "/talk_login.jsp");
        return;
    }

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe",
                "system", "1234");

        String sql = "delete from talk_t where room_no =? and talk_no = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, roomNo);
        ps.setInt(2, talkNo);

        ps.executeUpdate();

        ps.close();
        conn.close();

    }catch (Exception e ) { err = e; }

    if(err != null){
        response.sendRedirect(ctxPath + "/error.jsp");
        return;
    } else{
        response.sendRedirect(ctxPath + "/talk_view_apple.jsp");
    }
%>
<html>
<body>

</body>
</html>
