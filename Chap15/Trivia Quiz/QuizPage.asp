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
   <FONT COLOR=coral FACE="돋움체" SIZE=6>
      온라인 퀴즈 게임에 오신 것을 환영합니다
   </FONT>
</H2>
<P>
<FONT COLOR=darkslateblue FACE="돋움체" >
   <STRONG>
      아래에 있는 퀴즈 시작 버튼을 누르시고 퀴즈에 도전해 보세요!
   </STRONG>
</FONT>
</P>
<P>
<FORM NAME="frmQuiz" METHOD="post" ACTION="NoteUserSelections.asp">
<P>
문제 개수 <BR>
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
제한 시간 <BR>
<SELECT name=cboTimeLimit size=1>
   <OPTION value=-1>제한 시간 없음
   <OPTION value=60
   <%
      if (Session("TimeLimit") == 60)
      {
         Response.Write(" SELECTED ");
      }
   %>
   >1분
   <OPTION value=180
   <%
      if (Session("TimeLimit") == 180)
      {
         Response.Write(" SELECTED ");
      }
   %>
   >3분
   <OPTION value=300
   <%
      if (Session("TimeLimit") == 300)
      {
         Response.Write(" SELECTED ");
      }
   %>
   >5분
</SELECT>
</P>

   <INPUT NAME=cmdStartQuiz TYPE=button VALUE="퀴즈 시작"
      onclick="return cmdStartQuiz_onclick()">
</FORM>
</P>
</BODY>
</HTML>
