<%@ LANGUAGE = Jscript%>

<%

if (Request.Cookies("IsValid") != "Yes")
{
	Response.Redirect("logon.htm")
}

%>
<HTML>
<BODY>

<P align=center>
	<FONT size=5>이 페이지는 승인된 사용자만 볼 수 있습니다</FONT>
</P>

</BODY>
</HTML>
