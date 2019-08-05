<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-02
  Time: 10:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" %>
<html>
<body>
    <!--
        <input type="file"> 은 파일을 서버로 업로드 할 때 사용한다.
        이때는 반드시 enctype="multipart/form-data" 를 사용한다.

        fileup에 해당하는 서블릿은 cos.jar 파일의 MultipartRequest를 이용하여 업로드를 처리하는 것이 일반적이다.
    -->
    <form method="POST" action="fileup" enctype="multipart/form-data">
        <input type="text" name="title" size="20" />
        <input type="file" name="apple" />
        <input type="submit" />
    </form>
</body>
</html>
