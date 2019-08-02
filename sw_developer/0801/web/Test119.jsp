<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-01
  Time: 16:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="EUC-KR" isELIgnored="false"
import="study.TalkRoomVO" %><%
    request.setAttribute("apple", 100);
    request.setAttribute("ab", new int[]{1, 2, 3, 4});

    TalkRoomVO vo = new TalkRoomVO();
    vo.setRoomNo(10101);
    vo.setApple("û�ۻ��");
    vo.setBanana("���ֹٳ���");

    request.setAttribute("t", vo);
%>
<html>
<body>
${t.roomNo} ${t.banana} ${t.apple}
${apple}
${ab[0]}
</body>
</html><%--
������ html ���� ������ �ڵ庸�� �ܼ��� �ڵ尡 �ξ� ����.
�׷� ��� �۾��� EL�� ó�� �����ϸ� ������ �ӵ��� �ξ� ���� ���̴�.

request.setAttribute �Ǵ� session.setAttribute�� ���ؼ� ����� ���� Ű ���� �̿��ؼ� EL���� ����� �����ϴ�.

���� : session, request, application 3�� ��ä�� ���
void setAttribute(String, Object),
Object getAttribute(String),
void removeAttribute(String)�� �����Ѵ�.

EL�� ������ ���Ƽ� ���� Ȯ���� ����� jstl�� �����ϰ� �Ǿ���.
jstl : �±׷� ���� ��� <if></if>�� ����

SGML ���� �±׸� ó�� ����
- �� ���漺���� ������ ����ȭ �� �� �ִ� �� �����ߴ�.
- MathML, MusicML, postscript �� �Ļ��� ������� ��û ����.
- postscript �� �����ؼ� pdf �� ����
- �Ļ��� �͵� �� ���� ������ ���� XML, hml �̴�.

�±��� Ư¡
1. �� �ܰ��� �±״� �� �ϳ��� �����ؾ� �Ѵ�.(<html>)
2. �±״� ��ø�ؼ� �������� �ʴ´�.
    <banana><apple></apple></banana> (O)
    <banana><apple></banana></apple> (X)
3. �Ӽ��� �����±׿� �����Ѵ�. (bgColor="red" �̰� �Ӽ�)
    <body bgColor = "red"></body>
4. �Ӽ��� key="value" �Ǵ� key='value' �� ����Ǿ�� �Ѵ�.
    �� ''�ȿ� '' �Ұ� (key='va'l'ue'�� �ȵǰ� key="va'l'ue"�� ��)
5. �ϳ��� �±׿��� �Ӽ��� �ι� �������� �ʴ´�.
    <body bgColor="red" bgColor="green"></body> (X)
6. �����±װ� ������ �ݵ�� �� �±װ� �ִ�.
    <apple></apple> �� ���� ������ ���� ��� <apple />�� ����.
    : <br /><input type-"text" /> :: �̰��� �´� ����
--%>
