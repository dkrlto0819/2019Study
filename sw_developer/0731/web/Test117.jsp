<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-07-31
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%><%!
    String getColor(){
        char[] chs = "0123456789abcdef".toCharArray();
        StringBuffer sb = new StringBuffer();

        for(int i=1;i<=6;i++) {
            int index = (int)(Math.random() * 16);
            sb.append(chs[index]);
        }
        return sb.toString();
    }
%>
<html>
<body>
    <table border ="1" bordercolor="black" cellspacing = "0" align="center" cellpadding="7">
    <% for(int i=2;i<=9;i++){ %>
        <tr>
      <% for(int j=1;j<=9;j++){ %>
            <% String color = getColor(); %>
            <td bgColor="#<%=color%>" >
        <%=i%> * <%=j%> = <%=i*j%>
            </td>
      <% } %>
        </tr>
    <% } %>
</body>
</html>
<%-- --%>