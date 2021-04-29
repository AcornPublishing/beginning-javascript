<%@ LANGUAGE = JavaScript%>
<HTML>
<BODY>
   <P>이름 : <%= Request.Form("txtName") %></P>
   <P>전자 우편 : <%= Request.Form("txtEmail") %></P>
   <P>성별 : <%= Request.Form("radGender") %></P>
   <P>응답 희망 여부 : <%= Request.Form("chkResponse") %></P>
   <P>연령대 : <%= Request.Form("selAgeRange") %></P>
   <PRE>
      <P>제안 사항 : <%= Request.Form("txtaSuggestion") %></P>
   </PRE>
</BODY>
</HTML>

