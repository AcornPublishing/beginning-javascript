<%@ LANGUAGE=JavaScript %>
<HTML>
<HEAD>
<TITLE>시스템 구입</TITLE>

<SCRIPT LANGUAGE=JavaScript>

function checkForm()
{
   var regExp = /[^\d ]/
   var formValid = true;
   var theForm = document.form1;
   var elementIndex;
   var element;
   var nowDate = new Date();
   var expMonth = parseInt(theForm.selMonth.value)
   var expYear = parseInt(theForm.selYear.value)

   for (elementIndex = 0; elementIndex < theForm.length; elementIndex++)
   {
      element = theForm[elementIndex];
      if (element.type == "text")
      {
         if (element.value == "")
         {
            formValid = false;
            element.focus();
            alert("빠짐없이 기입해 주시기 바랍니다");
            break;
         }
      }
   }

   if (formValid == true && expYear <= parseInt(nowDate.getFullYear()) && parseInt(nowDate.getMonth()) > expMonth)
   {
      formValid = false;
      theForm.selMonth.focus();
      alert("입력하신 신용카드의 만기일이 지났습니다")
   }
   else if (regExp.test(theForm.txtCCNumber.value) == true)
   {
      formValid = false;
      alert("올바른 신용카드 번호를 입력해 주십시오");
      theForm.txtCCNumber.focus();
      theForm.txtCCNumber.select();
   }

   return formValid;
}

</SCRIPT>

</HEAD>
<BODY>
<H2>시스템 구입</H2>
<P>고객님의 이름, 주소, 신용카드 정보를 아래에 입력해 주십시오</P>
<FORM ACTION="ch15Q2_FinalStage.asp" METHOD=POST NAME=form1 onsubmit="return checkForm()">
<P>
이름:
<BR>
<INPUT TYPE="text" NAME=txtName>
</P>
<P>
번지:
<BR>
<INPUT TYPE="text" NAME=txtHouse>
</P>
<P>
구/동:
<BR>
<INPUT TYPE="text" NAME=txtStreet>
</P>
<P>
시:
<BR>
<INPUT TYPE="text" NAME=txtCity>
</P>
<P>
<P>
신용카드 번호:
<BR>
<INPUT TYPE="text" NAME=txtCCNumber>
<P>
만기일
<BR>
<SELECT NAME=selMonth>
<OPTION VALUE="01">01</OPTION>
<OPTION VALUE ="02">02</OPTION>
<OPTION VALUE ="03">03</OPTION>
<OPTION VALUE ="04">04</OPTION>
<OPTION VALUE ="05">05</OPTION>
<OPTION VALUE ="06">06</OPTION>
<OPTION VALUE ="07">07</OPTION>
<OPTION VALUE ="08">08</OPTION>
<OPTION VALUE ="09">09</OPTION>
<OPTION VALUE ="10">10</OPTION>
<OPTION VALUE ="11">11</OPTION>
<OPTION VALUE ="12">12</OPTION>
</SELECT>
<SELECT NAME=selYear>
<%

var yearCount;
var nowYear = new Date();
nowYear = parseInt(nowYear.getFullYear());

for (yearCount = nowYear; yearCount < nowYear + 5; yearCount++)
{
   Response.Write("<OPTION value='" + yearCount + "'>")
   Response.Write(yearCount + "</OPTION>");	
}

%>

</SELECT>

<INPUT TYPE="hidden" NAME="txtCost" VALUE="<%=Request.Form("txtCost")%>">

<INPUT TYPE="hidden" NAME="txtDescription"
       VALUE="<%=Request.Form("txtDescription")%>">
<P>
<INPUT TYPE="submit" VALUE="확인" NAME=submit1>
</P>
</FORM>
</BODY>
</HTML>
