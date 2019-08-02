<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-01
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" isELIgnored="false"
import="study.TalkRoomVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jc" %><%
    List<String> rl = new ArrayList<String>();
    rl.add("one");
    rl.add("two");
    rl.add("three");
    rl.add("four");
    request.setAttribute("rl", rl);
%>
<html>
    <body>
        <table border="1" cellspacing="0">
        <jc:forEach var="vo" items="${rl}">
            <tr>
                <td>${vo}</td>
            </tr>
        </jc:forEach>
        </table>
        <jc:forEach var="i" begin="0" end="4">
            <jc:choose>
                <jc:when test="${i%3==0}">apple</jc:when>
                <jc:when test="${i%3==1}">banana</jc:when>
                <jc:otherwise></jc:otherwise>
            </jc:choose>
        </jc:forEach>
    </body>
</html>
<!--
jstl은 태그를 ㅇ용하여 만들어진 언어인데 eL과 연동한다.
디자이너와 친근하게 접근하게

어제와 코드와 비교하면 장단점이 있다.
어제코드 : 들여쓰기 정리가 안된다. 어려운 코드 구사할 여지가 많다.
오늘 코드 : 들여쓰기 깔끔 정리. 쓰는 코드밖에는 못쓴다.
-->
