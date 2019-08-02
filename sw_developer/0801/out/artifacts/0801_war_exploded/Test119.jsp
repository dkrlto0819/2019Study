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
    vo.setApple("청송사과");
    vo.setBanana("제주바나나");

    request.setAttribute("t", vo);
%>
<html>
<body>
${t.roomNo} ${t.banana} ${t.apple}
${apple}
${ab[0]}
</body>
</html><%--
실제로 html 안은 복잡한 코드보다 단순한 코드가 훨씬 많다.
그런 모든 작업을 EL로 처리 가능하면 디자인 속도가 훨씬 빠를 것이다.

request.setAttribute 또는 session.setAttribute를 통해서 저장된 값은 키 값을 이용해서 EL에서 사용이 가능하다.

정리 : session, request, application 3개 객채는 모두
void setAttribute(String, Object),
Object getAttribute(String),
void removeAttribute(String)을 지원한다.

EL이 반응이 좋아서 보다 확장한 기능인 jstl을 지원하게 되었다.
jstl : 태그로 만든 언어 <if></if>와 유사

SGML 에서 태그를 처음 도입
- 미 국방성에서 문서를 전산화 할 수 있는 언어를 개발했다.
- MathML, MusicML, postscript 등 파생된 서브셋이 엄청 많다.
- postscript 가 발전해서 pdf 로 발전
- 파생된 것들 중 가장 성공한 것이 XML, hml 이다.

태그의 특징
1. 최 외각의 태그는 단 하나만 존재해야 한다.(<html>)
2. 태그는 중첩해서 선언하지 않는다.
    <banana><apple></apple></banana> (O)
    <banana><apple></banana></apple> (X)
3. 속성은 시작태그에 선언한다. (bgColor="red" 이게 속성)
    <body bgColor = "red"></body>
4. 속성은 key="value" 또는 key='value' 로 선언되어야 한다.
    단 ''안에 '' 불가 (key='va'l'ue'는 안되고 key="va'l'ue"는 됨)
5. 하나의 태그에서 속성은 두번 선언하지 않는다.
    <body bgColor="red" bgColor="green"></body> (X)
6. 시작태그가 있으면 반드시 끝 태그가 있다.
    <apple></apple> 과 같이 내용이 없는 경우 <apple />로 쓴다.
    : <br /><input type-"text" /> :: 이것이 맞는 문법
--%>
