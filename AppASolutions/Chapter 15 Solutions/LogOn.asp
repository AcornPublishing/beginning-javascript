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
      alert("사용자명을 입력해 주십시오");
      form.txtUsername.focus();
   }

   else if (form.txtPassword.value == "")
   {
      alert("암호를 입력해 주십시오");
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
   Response.Write("<P><FONT color=red size=+2>" + "죄송합니다 입력하신 " + "사용자명/암호가 올바르지 않습니다</FONT></P>")
   if ( invalidTrys <= 3)
   {
      Response.Write("<P><FONT color=black size=+2>"+ "Please re-enter your details" + "</FONT></P>")
   }
}

if ( invalidTrys <= 3)
{
%>
<P>웹 사이트에 접속하시려면 아래 입력란에 사용자명과 암호를 입력하십시오</P>

<FORM ACTION="LogOn.asp" METHOD=POST ID=form1 NAME=form1 onsubmit="return form1_onsubmit()">

<P>사용자명 : <INPUT ID=txtUsername NAME=txtUsername></P>
<P>암호 : <INPUT ID=txtPassword NAME=txtPassword TYPE=password></P>

<P>
<INPUT ID=reset1 NAME=reset1 TYPE=reset VALUE="리셋">&nbsp;
<INPUT ID=submit1 NAME=submit1 TYPE=submit VALUE="로그온">
</P>

</FORM>
<%
}
%>
</BODY>
</HTML>
