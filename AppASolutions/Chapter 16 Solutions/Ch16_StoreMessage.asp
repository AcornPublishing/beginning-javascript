<%@ LANGUAGE=JavaScript %>
<HTML>
<HEAD>
<TITLE>Message Added</TITLE>
</HEAD>
<BODY>

<%

var months = new Array("Jan","Feb","Mar","Apr","May","Jun", "Jul","Aug","Sep","Oct","Nov","Dec");

var messageSubject = Request.Form("txtMessageSubject");
var messageBody = Request.Form("txtMessageBody");
var userName = Request.Form("txtUserName");
var postedDate = new Date();
postedDate = postedDate.getDate() + " " + months[postedDate.getMonth()] + " " + postedDate.getFullYear();

if (messageSubject != "" && messageBody != "" && userName != "")
{
   var mySQL = "INSERT INTO Message " + "(UserName, MessageSubject, " + " MessageBody,DatePosted) " + "VALUES ('" + userName + "'," + "'" + messageSubject + "'," + "'" + messageBody + "'," + "#" + postedDate + "#)";

   var adoConnection = Server.CreateObject("ADODB.Connection");
   adoConnection.Open("DSN=MessageBoardDSN")
   adoConnection.Execute(mySQL);
   adoConnection.Close();
   adoConnection = null;
   Response.Write("<H2>메시지를 성공적으로 전송하였습니다</H2>");
}

%>
<FORM NAME=form1>
   <INPUT TYPE="button" VALUE="게시판으로 돌아가기"
          onclick="window.location.href='MessageBoard.htm'"
          NAME=button1>
</FORM>
</BODY>
</HTML>
