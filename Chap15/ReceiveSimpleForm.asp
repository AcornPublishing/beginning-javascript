<%@ LANGUAGE = JavaScript%>
<HTML>
<HEAD>
<%
   var lastName = Request.Form("txtLastName");
%>
</HEAD>
<BODY>
   <P>성으로 입력한 값은 
   <%= Request.Form("txtFirstName") %> 입니다</P>
   <P>이름으로 입력한 값은 
   <%= lastName %> 입니다</P>
</BODY>
</HTML>


