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
        <input type="file"> �� ������ ������ ���ε� �� �� ����Ѵ�.
        �̶��� �ݵ�� enctype="multipart/form-data" �� ����Ѵ�.

        fileup�� �ش��ϴ� ������ cos.jar ������ MultipartRequest�� �̿��Ͽ� ���ε带 ó���ϴ� ���� �Ϲ����̴�.
    -->
    <form method="POST" action="fileup" enctype="multipart/form-data">
        <input type="text" name="title" size="20" />
        <input type="file" name="apple" />
        <input type="submit" />
    </form>
</body>
</html>
