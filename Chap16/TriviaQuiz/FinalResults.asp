<FORM NAME="quizForm" ACTION="" METHOD="post">

<SCRIPT LANGUAGE=JavaScript>
   window.top.fraTopFrame.fraGlobalFunctions.stopTimer();
</SCRIPT>

<FONT COLOR=darkslateblue FACE="Comic Sans MS">
<P><IMG SRC="quizcomplete.gif"></P>
<%=Session("numberOfQuestionsCorrect")%>
문제에서 <%= Session("NoQsToAsk") %>문제를 맞추셨습니다.
<BR><BR>

<%
   var numberOfQuestionsCorrect = parseInt(Session("numberOfQuestionsCorrect"));
   var numberOfQuestionsAsked = parseInt(Session("NoQsToAsk"));
   switch(Math.round(((numberOfQuestionsCorrect / numberOfQuestionsAsked)
      * 10)))
   {
      case 0:
      case 1:
      case 2:
      case 3:
         Response.Write("분발하셔야겠군요!");
         break;
      case 4:
      case 5:
      case 6:
      case 7:
         Response.Write("보통이군요");
         break;
      default:
         Response.Write("퀴즈의 달인이시네요!");
   }

   var previousNoCorrect = Math.floor(Request.Cookies("previousNoCorrect"));
   var previousNoAsked = Math.floor(Request.Cookies("previousNoAsked"));
   var currentAvgScore = Math.round(numberOfQuestionsCorrect /
      numberOfQuestionsAsked * 100);

   Response.Write("<BR>이번 퀴즈 게임에서 획득한 점수는 " + currentAvgScore + "점입니다");

   if (previousNoAsked == 0)
   {
      previousNoCorrect = 0;
   }

   previousNoCorrect = previousNoCorrect + numberOfQuestionsCorrect;
   previousNoAsked = previousNoAsked + numberOfQuestionsAsked;

   currentAvgScore = Math.round(previousNoCorrect / previousNoAsked * 100);

   var nowDate = new Date();
   nowDate.setMonth(nowDate.getMonth() + 3);
   cookieExpires = nowDate.toGMTString();
   cookieExpires = cookieExpires.slice(5,cookieExpires.length - 4);

   Response.Cookies("previousNoAsked") = previousNoAsked;
   Response.Cookies("previousNoAsked").Expires = cookieExpires;

   Response.Cookies("previousNoCorrect") =  previousNoCorrect;
   Response.Cookies("previousNoCorrect").Expires = cookieExpires;

   Response.Cookies("AverageScore") = currentAvgScore;
   Response.Cookies("AverageScore").Expires = cookieExpires;

   Response.Write("<BR>지금까지의 퀴즈게임 평균 점수는 " +currentAvgScore + "점입니다");

%>

<P>
<INPUT TYPE=button VALUE='현재까지의 점수 리셋하기' NAME=buttonReset
   onclick="window.top.fraTopFrame.fraGlobalFunctions.setCookie('previousNoAsked', 0,'','Mon, 1 Jan 1970')" >

<P>
<INPUT TYPE=button VALUE='재도전하기' NAME=buttonRestart
   onclick="window.location.replace('quizpage.asp')" >
</FORM>
