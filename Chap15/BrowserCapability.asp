<%@ LANGUAGE = JavaScript%>
<HTML>
<BODY>
<P>������ ���� ����</P>
<%
var BrowsCapComponent = Server.CreateObject("MSWC.BrowserType");
%>

������ �̸� : <%= BrowsCapComponent.browser %>
<BR>
������ ���� : <%= BrowsCapComponent.version %>
<BR>
������ �ڹٽ�ũ��Ʈ : <%= BrowsCapComponent.javascript %>
<BR>
������ ���� : <%= BrowsCapComponent.frames %>
<BR>
��Ű ���� : <%= BrowsCapComponent.cookies %>

<%
BrowsCapComponent = null;
%>

</BODY>
</HTML>

