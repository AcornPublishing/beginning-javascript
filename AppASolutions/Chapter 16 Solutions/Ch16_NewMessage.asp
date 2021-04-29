<HTML>
<HEAD>
<TITLE>새 메시지 쓰기</TITLE>
<SCRIPT LANGUAGE=JavaScript>

function checkForm()
{
   var form = document.form1
   var controlCounter;
   var returnValue = true;
   var formControl;

   for (controlCounter = 0; controlCounter < form.length; controlCounter++)
   {
      formControl = form.elements[controlCounter]
      if ((formControl.type == "text" || formControl.type == "textarea") && formControl.value == "")
      {
         alert("Please complete all of the form");
         formControl.focus();
         returnValue = false;
         break;
      }
   }

   return returnValue;
}

</SCRIPT>
</HEAD>
<BODY>
<H2>새 메시지 쓰기</H2>
<FORM ACTION="Ch16_StoreMessage.asp" METHOD=POST NAME=form1 onsubmit="return checkForm()">
<P>
이름:<BR>
<INPUT TYPE="text" NAME=txtUserName MAXLENGTH=50>
</P>
<P>
제목:<BR>
<INPUT TYPE="text" MAXLENGTH=50 NAME=txtMessageSubject>
</P>
<P>
본문:<BR>
<TEXTAREA ROWS=8 COLS=60 NAME=txtMessageBody></TEXTAREA>
</P>
<P>
<INPUT TYPE="submit" VALUE="전송" NAME=submit1>
</P>
</FORM>
</BODY>
</HTML>

