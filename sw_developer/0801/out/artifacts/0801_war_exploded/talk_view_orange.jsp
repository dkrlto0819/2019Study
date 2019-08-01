<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-01
  Time: 15:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.CollationKey" %><%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-01
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" import="study.Util" %>
<%@ page import="java.util.List" %>
<%@ page import="study.TalkVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="study.TalkRoomVO" %><%
    String ctxPath = request.getContextPath();

    Cookie[] cks = request.getCookies();
    if(cks == null){
        response.sendRedirect(ctxPath + "/talk_login.jsp");
        return;
    }
    int roomNo = -1;
    String level = null;

    for(int i=0;i<cks.length;i++){
        if(cks[i].getName().equals("level")){
            level = cks[i].getValue();
        }else if (cks[i].getName().equals("roomNo")){
            roomNo=Util.parseInt(cks[i].getValue());
        }
    }

    if(level == null || !level.equals("orange")){
        response.sendRedirect(ctxPath + "/talk_login.jsp");
        return;
    }

    List<TalkVO> rl = new ArrayList<TalkVO>();
    Exception err = null;

    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@127.0.0.1:32771/xe", "system", "1234");

        String sql = "select * from talk_t where room_no = ? order by talk_no desc";
        PreparedStatement ps = conn.prepareStatement(sql);

        ps.setInt(1, roomNo);
        ResultSet rs = ps.executeQuery();

        while(rs.next()){
            TalkVO vo = new TalkVO();
            vo.setTalkNo(rs.getInt("talk_no"));
            vo.setRoomNo(rs.getInt("room_no"));
            vo.setContent(rs.getString("content"));

            rl.add(vo);
        }

        ps.close();
        conn.close();

    }catch (Exception e){ err = e; }

    if(err != null){
        response.sendRedirect(ctxPath + "/error.jsp");
        return;
    }else{ %>

<%}%>

<!DOCTYPE html>
<body>
<table border="1" cellpadding="8" cellspacing="2">
    <tr>
        <td widht="80" align="center">번호</td>
        <td width="500" align="center">내용</td>
    </tr>
    <% for(TalkVO vo : rl){ %>
    <tr>
        <td><%=vo.getTalkNo()%></td>
        <td><%=vo.getContent()%></td>
        <% } %>
    </tr>
</table>
<br>
</body>
</DOCTYPEhtml>
