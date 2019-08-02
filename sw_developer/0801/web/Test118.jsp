<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-01
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
    ${100+100}
    ${50>100}
    ${50 gt 100}
    ${50 ge 50}
    ${(30>50) ? 'apple':'banana'}
    ${(30>50)? 'apple' : ((50<40)? 'banana' : 'kiwi')}
</body>
</html>
