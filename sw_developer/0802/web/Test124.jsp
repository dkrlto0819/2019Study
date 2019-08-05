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
        Test124_1.jsp로 뛰는데, 주소창의 주소는 그대로다...
        - sendRedirect는 주소가 바뀐다. 하지만 얘는 보여주는 주소는 그대로
        - forward는 다음페이지에 뭔가 전달이 가느아다(전화돌리기)
        sendRedirect는 불가하다

        forward는 같은 Context 에서만 가능하고
        request에 심어서 보내면 받는 쪽에서는 꺼내어 쓸 수 있다.
         */
        request.setAttribute("메시지", "스토커 주의");
        RequestDispatcher rd = request.getRequestDispatcher("/Test124_1.jsp");
        rd.forward(request, response);
    }else{
        request.setAttribute("메시지", "스토커 주의");
        String ctxPath = request.getContextPath();
        response.sendRedirect(ctxPath + "/Test124_1.jsp");
        /*

            브라우저로 하여금 새로운 요청을 하도록 지시한다.
            응답의 맨 앞의 헤더부분을 이용한다.
            주의 : 응답의 내용이 만들어진 이후에는 제대로 동작하지 않을 수 있다.
             WAS마다 차이는 있
         */
    }
%>