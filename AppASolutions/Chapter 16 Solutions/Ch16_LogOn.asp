<%@ LANGUAGE = JavaScript %>
<HTML>
<HEAD>
<SCRIPT LANGUAGE=JavaScript>
function form1_onsubmit() 
{
   var form = document.form1;
   var returnValue = false;

   if (form.txtUsername.value == "")
   {
      alert("����ڸ��� �Է��Ͻʽÿ�");
      form.txtUsername.focus();
   }
   else if (form.txtPassword.value == "")
   {
      alert("��ȣ�� �Է��Ͻʽÿ�");
      form.txtPassword.focus();
   }
   else
   {
      returnValue = true;
   }

   return returnValue;

}
</SCRIPT>
</HEAD>
<BODY>
<%

if (Request.Form.Count != 0)
{

   var userNameInDatabase;
   var userName = new String(Request.Form("txtUsername")).toLowerCase();
   var password = new String(Request.Form("txtPassword")).toLowerCase();

   var mySQL = "SELECT UserName FROM User WHERE " +  "UserName='" + userName + "' AND Password='" + password + "'";

   var adoRecordset = Server.CreateObject("ADODB.Recordset")
   adoRecordset.Open(mySQL,"DSN=SecureUsersDSN");

   if (adoRecordset.EOF == false )
   { 
      var userNameInDatabase = adoRecordset("Username").Value;
      userNameInDatabase = userNameInDatabase.toLowerCase();
      if (userNameInDatabase == userName)
      {
         Response.Cookies("IsValid") = "Yes";
         Response.Redirect("SecureHome.asp");
      }
      else
      {
         Session("LogonTrys") = parseInt(Session("LogonTrys")) + 1;
      }
   }
   else
   {
      Session("LogonTrys") = parseInt(Session("LogonTrys")) + 1;
   }

   adoRecordset.Close();
   adoRecordset = null;
}

var invalidTrys = Session("LogonTrys");
if (isNaN(invalidTrys))
{
   invalidTrys = 1;
   Session("LogonTrys") = invalidTrys;
}
else
{
   invalidTrys = parseInt(invalidTrys);
}

if ( invalidTrys != 1 )
{
   Response.Write("<P><FONT color=red size=+2>" + "�˼��մϴ�. �Է��Ͻ� ����ڸ�/��ȣ��"  + " �ùٸ��� �ʽ��ϴ�</FONT></P>");
   if ( invalidTrys <= 3)
   {
      Response.Write("<P><FONT color=black size=+2>"  + "�ٽ� �ѹ� �Է��� �ֽʽÿ�"  + "</FONT></P>");
   }
}

if ( invalidTrys <= 3)
{
%>
   <P>�� ����Ʈ�� �����Ͻ÷��� �Ʒ� �Է¶��� ����ڸ�� ��ȣ�� �Է��Ͻʽÿ�</P>

   <FORM ACTION="CH16_LogOn.asp" METHOD=POST 
         ID=form1 NAME=form1 
         ONSUBMIT="return form1_onsubmit()">

   <P>����ڸ� : <INPUT ID=txtUsername NAME=txtUsername></P>
   <P>��ȣ : <INPUT ID=txtPassword NAME=txtPassword TYPE=password></P>

   <P><INPUT ID=reset1 NAME=reset1 TYPE=reset VALUE="����">&nbsp;
      <INPUT ID=submit1 NAME=submit1 TYPE=submit VALUE="�α׿�">
   </P>

   </FORM>
<%
}
%>
</BODY>
</HTML>
