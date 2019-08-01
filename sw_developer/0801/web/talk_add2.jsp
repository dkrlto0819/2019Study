<%@ page import="study.Util" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-01
  Time: 14:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %><%
    String content = request.getParameter("content");
    content = Util.toKorean(content);

    String ctxPath = request.getContextPath();
    String level = null;
    int roomNo = -1;

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

    System.out.println(level + " : " + roomNo);

    if(level == null || roomNo == -1 || level.equals("orange")){
        response.sendRedirect(ctxPath + "/talk_login.jsp");
        return;
    }

    Exception err = null;
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe",
                "system", "1234");
        String sql = "insert into talk_t values ( seq_talk.nextval, ?, ? )";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, roomNo);
        ps.setString(2, content);

        ps.executeUpdate();

        ps.close();
        conn.close();
    }catch (Exception e) { err = e; }
    if(err != null){
        response.sendRedirect(ctxPath + "/error.jsp");
        return;
    } else {
        if(level.equals("apple")){
            response.sendRedirect(ctxPath + "/talk_view_apple.jsp");
        }else if (level.equals("banana")){
            response.sendRedirect(ctxPath + "/talk_view_banana.jsp");
        }
    }
%>
