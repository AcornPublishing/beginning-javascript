<%@ LANGUAGE = JavaScript%>
<HTML>
<BODY>
   <P>�̸� : <%= Request.Form("txtName") %></P>
   <P>���� ���� : <%= Request.Form("txtEmail") %></P>
   <P>���� : <%= Request.Form("radGender") %></P>
   <P>���� ��� ���� : <%= Request.Form("chkResponse") %></P>
   <P>���ɴ� : <%= Request.Form("selAgeRange") %></P>
   <PRE>
      <P>���� ���� : <%= Request.Form("txtaSuggestion") %></P>
   </PRE>
</BODY>
</HTML>

