<%@ LANGUAGE = JavaScript%>
<HTML>
<HEAD>
<%
   var lastName = Request.Form("txtLastName");
%>
</HEAD>
<BODY>
   <P>������ �Է��� ���� 
   <%= Request.Form("txtFirstName") %> �Դϴ�</P>
   <P>�̸����� �Է��� ���� 
   <%= lastName %> �Դϴ�</P>
</BODY>
</HTML>


