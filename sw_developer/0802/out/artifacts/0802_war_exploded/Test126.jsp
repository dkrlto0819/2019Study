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
        String[] l = {"���", "��", "��", "�丶��"};
        String nl = "\r\n"; //�� �ٲ� ǥ��

        for (int i = 0; i < l.length; i++) {%>
            <%=l[i]%><%=nl%>
        <%}}else{%>
      ��ȣƲ��
    <%}%>
