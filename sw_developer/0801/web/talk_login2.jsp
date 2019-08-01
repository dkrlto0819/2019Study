<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-01
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%><%@ page contentType="text/html;charset=UTF-8" import="study.Util, study.TalkRoomVO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="study.TalkRoomVO" %><%
    String ctxPath = request.getContextPath();


    // 문자열 숫자 변환시에 에러 발새될 수 있으니 감안한 코드
    int roomNo = Util.parseInt(request.getParameter("roomNo"));
    String pwd = request.getParameter("pwd");

    if(roomNo == -1 || pwd == null || "".equals(pwd)){
        response.sendRedirect(ctxPath + "/talk_login.jsp");

        //sendRedirect 뒤의 코드는 의미가 없기 때문
        return;
    }

    Exception err = null;
    TalkRoomVO vo = null;

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe",
                "system", "1234");

        //String sql = "select * from talk_room_t where room_no =" + roomNo;
        String sql = "select * from talk_room_t where room_no = ?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, roomNo);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){
            vo = new TalkRoomVO();
            vo.setRoomNo(rs.getInt("room_no"));
            vo.setApple(rs.getString("apple"));
            vo.setBanana(rs.getString("banana"));
            vo.setOrange(rs.getString("Orange"));
        }

        rs.close();
        ps.close();
        conn.close();

    }catch (Exception e) { err = e; }

    System.out.println(vo);

    if(err != null){
        response.sendRedirect(ctxPath + "/error.jsp");
    }
    else if(vo.getApple().equals(pwd)){
        Cookie ck = new Cookie("level", "apple");
        response.addCookie(ck);

        Cookie ck2 = new Cookie("roomNo", String.valueOf(roomNo));
        response.addCookie(ck2);

        response.sendRedirect(ctxPath+"/talk_view_apple.jsp");
    }
    else if(vo.getBanana().equals(pwd)){
        Cookie ck = new Cookie("level", "banana");
        response.addCookie(ck);

        Cookie ck2 = new Cookie("roomNo", String.valueOf(roomNo));
        response.addCookie(ck2);

        response.sendRedirect(ctxPath+"/talk_view_banana.jsp");
    }
    else if(vo.getOrange().equals(pwd)){
        Cookie ck = new Cookie("level", "orange");
        response.addCookie(ck);

        Cookie ck2 = new Cookie("roomNo", String.valueOf(roomNo));
        response.addCookie(ck2);

        response.sendRedirect(ctxPath+"/talk_view_orange.jsp");

    }else{
        response.sendRedirect(ctxPath+"/talk_login.jsp");
        return;
    }
%>
<html>
<body>
</body>
</html>
