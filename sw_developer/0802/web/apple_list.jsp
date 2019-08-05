<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-02
  Time: 15:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="j"%>
<html>
<body>
    <table>
        <j:forEach var="vo" items="${rl}">
            <tr>
                <td>${vo.no}</td>
                <td>${vo.gul}</td>
                <td>${vo.theTime}</td>
            </tr>
        </j:forEach>
    </table>

    <form method="post" action="apple_add2.do">
        <input type="text" name="gul" size="55" />
        <input type="submit" />
    </form>
</body>
</html>
