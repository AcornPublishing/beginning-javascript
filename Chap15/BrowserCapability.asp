<%@ LANGUAGE = JavaScript%>
<HTML>
<BODY>
<P>브라우저 세부 정보</P>
<%
var BrowsCapComponent = Server.CreateObject("MSWC.BrowserType");
%>

브라우저 이름 : <%= BrowsCapComponent.browser %>
<BR>
브라우저 버전 : <%= BrowsCapComponent.version %>
<BR>
브라우저 자바스크립트 : <%= BrowsCapComponent.javascript %>
<BR>
프레임 지원 : <%= BrowsCapComponent.frames %>
<BR>
쿠키 지원 : <%= BrowsCapComponent.cookies %>

<%
BrowsCapComponent = null;
%>

</BODY>
</HTML>

