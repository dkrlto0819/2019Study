<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-07-31
  Time: 14:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><%!
    int i=0;
%><%
    int j=0;
%>
<!DOCTYPE html>
<body>
    <%=i++%>
    <%=j++%>
</body>
</html>

<%-- JSP 주석
http://192.168.2.27:8081/0731/Test115.jsp

i는 멤버 변수, j는 로컬변수의 느낌이 난다.

jsp 파일을 요청하면 톰캣은 이것을 *java 파일로 변환한다. = servlet 코드

이것을 컴파일 하고, 인스턴스를 만들어, 적재하고, 인스턴스 재활용을 한다.
--%>
