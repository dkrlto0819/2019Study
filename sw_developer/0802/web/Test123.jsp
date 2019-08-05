<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-02
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<html>
<body>
<%--    <a href="WEB-INF/fileup/3주차.pdf">fileDown</a>--%>
    <!-- 안됨 ! 왜? 브라우저는 WEB-INF에 접근 불가 -->
    <a href="filedn?fsn=3주차.pdf">fileDown</a>
    <a href="filedn?ofn=3주차.pdf&fsn=3주차.pdf">fileDown</a>
</body>
</html>
