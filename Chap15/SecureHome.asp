<%@ LANGUAGE = JavaScript%>

<%

if (Request.Cookies("IsValid") != "Yes")
{
   Response.Redirect("Logon.htm")
}

%>
<HTML>
<BODY>

<P ALIGN=center>
<FONT SIZE=5>올바른 사용자를 위한 페이지입니다</FONT>
</P>

</BODY>
</HTML>




