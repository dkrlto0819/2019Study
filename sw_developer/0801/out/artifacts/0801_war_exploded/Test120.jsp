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
jstl�� �±׸� �����Ͽ� ������� ����ε� eL�� �����Ѵ�.
�����̳ʿ� ģ���ϰ� �����ϰ�

������ �ڵ�� ���ϸ� ������� �ִ�.
�����ڵ� : �鿩���� ������ �ȵȴ�. ����� �ڵ� ������ ������ ����.
���� �ڵ� : �鿩���� ��� ����. ���� �ڵ�ۿ��� ������.
-->
