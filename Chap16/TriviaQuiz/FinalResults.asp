<FORM NAME="quizForm" ACTION="" METHOD="post">

<SCRIPT LANGUAGE=JavaScript>
   window.top.fraTopFrame.fraGlobalFunctions.stopTimer();
</SCRIPT>

<FONT COLOR=darkslateblue FACE="Comic Sans MS">
<P><IMG SRC="quizcomplete.gif"></P>
<%=Session("numberOfQuestionsCorrect")%>
�������� <%= Session("NoQsToAsk") %>������ ���߼̽��ϴ�.
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
         Response.Write("�й��ϼž߰ڱ���!");
         break;
      case 4:
      case 5:
      case 6:
      case 7:
         Response.Write("�����̱���");
         break;
      default:
         Response.Write("������ �����̽ó׿�!");
   }

   var previousNoCorrect = Math.floor(Request.Cookies("previousNoCorrect"));
   var previousNoAsked = Math.floor(Request.Cookies("previousNoAsked"));
   var currentAvgScore = Math.round(numberOfQuestionsCorrect /
      numberOfQuestionsAsked * 100);

   Response.Write("<BR>�̹� ���� ���ӿ��� ȹ���� ������ " + currentAvgScore + "���Դϴ�");

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

   Response.Write("<BR>���ݱ����� ������� ��� ������ " +currentAvgScore + "���Դϴ�");

%>

<P>
<INPUT TYPE=button VALUE='��������� ���� �����ϱ�' NAME=buttonReset
   onclick="window.top.fraTopFrame.fraGlobalFunctions.setCookie('previousNoAsked', 0,'','Mon, 1 Jan 1970')" >

<P>
<INPUT TYPE=button VALUE='�絵���ϱ�' NAME=buttonRestart
   onclick="window.location.replace('quizpage.asp')" >
</FORM>
