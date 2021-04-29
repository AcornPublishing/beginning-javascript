<%@ LANGUAGE = JavaScript%>
<HTML>
<BODY>

<P>URL에서 전송된 정보</P>
이름 : <%= Request.QueryString("Name") %>
<BR>
나이 : <%= Request.QueryString("Age") %>

</BODY>
</HTML>
