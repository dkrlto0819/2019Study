<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-07-31
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%!
    /*
    멤버변수는 선언은 가능하나 연산은 불가
     */
    // String l = request.getParameter("abcd"); ==> 호출도 불가

%>
<html>

<body>
<%
    out.println(config.toString()); //띠용 이게 되네
    String l = config.getInitParameter("abcd"); // 올바른 코드. 다 들어가 있으니까!
    /*
    JSPServlet 에서
        private ServletConfig config = null; 있고
        PrintWriter out = response.getWriter(); 있고
        <!%  얘는 멤버변수라 안돼
     */
%>
</body>
</html>

<%-- 문법적으로 맞는지 아닌지 확실하게 판단을 할 것.
--%>
