<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-02
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/plain; charset=UTF-8" pageEncoding="EUC-KR" %><%
    String pw = request.getParameter("pw");
    if(pw.equals("1234")){
        String[] l = {"사과", "귤", "배", "토마토"};
        String nl = "\r\n"; //줄 바꿈 표시

        for (int i = 0; i < l.length; i++) {%>
            <%=l[i]%><%=nl%>
        <%}}else{%>
      암호틀림
    <%}%>
