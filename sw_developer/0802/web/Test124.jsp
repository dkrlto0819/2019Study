<%--
  Created by IntelliJ IDEA.
  User: ddang
  Date: 2019-08-02
  Time: 13:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="EUC-KR" %><%
    int i=0;
    if(i!=0) {
        /*
        Test124_1.jsp�� �ٴµ�, �ּ�â�� �ּҴ� �״�δ�...
        - sendRedirect�� �ּҰ� �ٲ��. ������ ��� �����ִ� �ּҴ� �״��
        - forward�� ������������ ���� ������ �����ƴ�(��ȭ������)
        sendRedirect�� �Ұ��ϴ�

        forward�� ���� Context ������ �����ϰ�
        request�� �ɾ ������ �޴� �ʿ����� ������ �� �� �ִ�.
         */
        request.setAttribute("�޽���", "����Ŀ ����");
        RequestDispatcher rd = request.getRequestDispatcher("/Test124_1.jsp");
        rd.forward(request, response);
    }else{
        request.setAttribute("�޽���", "����Ŀ ����");
        String ctxPath = request.getContextPath();
        response.sendRedirect(ctxPath + "/Test124_1.jsp");
        /*

            �������� �Ͽ��� ���ο� ��û�� �ϵ��� �����Ѵ�.
            ������ �� ���� ����κ��� �̿��Ѵ�.
            ���� : ������ ������ ������� ���Ŀ��� ����� �������� ���� �� �ִ�.
             WAS���� ���̴� ��
         */
    }
%>