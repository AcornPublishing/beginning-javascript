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
      alert("����ڸ��� �Է��� �ֽʽÿ�");
      form.txtUsername.focus();
   }

   else if (form.txtPassword.value == "")
   {
      alert("��ȣ�� �Է��� �ֽʽÿ�");
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
   if (Request.Form("txtUsername") == "SecureUser" &&  Request.Form("txtPassword") == "letmethrough")
   {
      Response.Cookies("IsValid") = "Yes";
      Response.Redirect("SecureHome.asp");
   }
   else
   {
      Session("LogonTrys") = parseInt(Session("LogonTrys")) + 1;
      Response.Redirect("logon.asp")
   }
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
   Response.Write("<P><FONT color=red size=+2>" + "�˼��մϴ� �Է��Ͻ� " + "����ڸ�/��ȣ�� �ùٸ��� �ʽ��ϴ�</FONT></P>")
   if ( invalidTrys <= 3)
   {
      Response.Write("<P><FONT color=black size=+2>"+ "Please re-enter your details" + "</FONT></P>")
   }
}

if ( invalidTrys <= 3)
{
%>
<P>�� ����Ʈ�� �����Ͻ÷��� �Ʒ� �Է¶��� ����ڸ�� ��ȣ�� �Է��Ͻʽÿ�</P>

<FORM ACTION="LogOn.asp" METHOD=POST ID=form1 NAME=form1 onsubmit="return form1_onsubmit()">

<P>����ڸ� : <INPUT ID=txtUsername NAME=txtUsername></P>
<P>��ȣ : <INPUT ID=txtPassword NAME=txtPassword TYPE=password></P>

<P>
<INPUT ID=reset1 NAME=reset1 TYPE=reset VALUE="����">&nbsp;
<INPUT ID=submit1 NAME=submit1 TYPE=submit VALUE="�α׿�">
</P>

</FORM>
<%
}
%>
</BODY>
</HTML>
