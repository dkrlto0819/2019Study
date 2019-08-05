<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-02
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %><%
    Exception error = (Exception) session.getAttribute("error");
    StackTraceElement[] errors = error.getStackTrace();
%>
<html>
<body>
    <%for (int i = 0; i < errors.length; i++) {%>
        <%=errors.toString()%><br />
    <%}%>
</body>
</html>
