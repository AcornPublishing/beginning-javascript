<%@ LANGUAGE = JavaScript%>
<HTML>
<HEAD>
<META HTTP-EQUIV="expires" CONTENT="Mon, 1 Jan 1980 00:00:00 GMT">
<SCRIPT LANGUAGE=JavaScript>

function cmdStartQuiz_onclick() 
{
   var cboNoQuestions = document.frmQuiz.cboNoQuestions;
   var noQuestions = cboNoQuestions.options[cboNoQuestions.selectedIndex].value;
   var cboTimeLimit = document.frmQuiz.cboTimeLimit;
   var timeLimit = cboTimeLimit.options[cboTimeLimit.selectedIndex].value;
   window.top.fraTopFrame.fraGlobalFunctions.resetQuiz(noQuestions,timeLimit);

   document.frmQuiz.submit();
}

</SCRIPT>
</HEAD>

<BODY BACKGROUND="bluewash.jpg">
<H2 ALIGN="center">
   <FONT COLOR=coral FACE="����ü" SIZE=6>
      �¶��� ���� ���ӿ� ���� ���� ȯ���մϴ�
   </FONT>
</H2>
<P>
<FONT COLOR=darkslateblue FACE="����ü" >
   <STRONG>
      �Ʒ��� �ִ� ���� ���� ��ư�� �����ð� ��� ������ ������!
   </STRONG>
</FONT>
</P>
<P>
<FORM NAME="frmQuiz" METHOD="post" ACTION="NoteUserSelections.asp">
<P>
���� ���� <BR>
<SELECT name=cboNoQuestions size=1>
   <OPTION value=3>3
   <OPTION value=5
<%
      if (Session("NoQsToAsk") == 5)
      {
         Response.Write(" SELECTED ");
      }
   %>
   >5
</SELECT>
</P>
<P>
���� �ð� <BR>
<SELECT name=cboTimeLimit size=1>
   <OPTION value=-1>���� �ð� ����
   <OPTION value=60
   <%
      if (Session("TimeLimit") == 60)
      {
         Response.Write(" SELECTED ");
      }
   %>
   >1��
   <OPTION value=180
   <%
      if (Session("TimeLimit") == 180)
      {
         Response.Write(" SELECTED ");
      }
   %>
   >3��
   <OPTION value=300
   <%
      if (Session("TimeLimit") == 300)
      {
         Response.Write(" SELECTED ");
      }
   %>
   >5��
</SELECT>
</P>

   <INPUT NAME=cmdStartQuiz TYPE=button VALUE="���� ����"
      onclick="return cmdStartQuiz_onclick()">
</FORM>
</P>
</BODY>
</HTML>
