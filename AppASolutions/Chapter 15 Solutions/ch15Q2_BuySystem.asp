<%@ LANGUAGE=JavaScript %>
<HTML>
<HEAD>
<TITLE>�ý��� ����</TITLE>

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
            alert("�������� ������ �ֽñ� �ٶ��ϴ�");
            break;
         }
      }
   }

   if (formValid == true && expYear <= parseInt(nowDate.getFullYear()) && parseInt(nowDate.getMonth()) > expMonth)
   {
      formValid = false;
      theForm.selMonth.focus();
      alert("�Է��Ͻ� �ſ�ī���� �������� �������ϴ�")
   }
   else if (regExp.test(theForm.txtCCNumber.value) == true)
   {
      formValid = false;
      alert("�ùٸ� �ſ�ī�� ��ȣ�� �Է��� �ֽʽÿ�");
      theForm.txtCCNumber.focus();
      theForm.txtCCNumber.select();
   }

   return formValid;
}

</SCRIPT>

</HEAD>
<BODY>
<H2>�ý��� ����</H2>
<P>������ �̸�, �ּ�, �ſ�ī�� ������ �Ʒ��� �Է��� �ֽʽÿ�</P>
<FORM ACTION="ch15Q2_FinalStage.asp" METHOD=POST NAME=form1 onsubmit="return checkForm()">
<P>
�̸�:
<BR>
<INPUT TYPE="text" NAME=txtName>
</P>
<P>
����:
<BR>
<INPUT TYPE="text" NAME=txtHouse>
</P>
<P>
��/��:
<BR>
<INPUT TYPE="text" NAME=txtStreet>
</P>
<P>
��:
<BR>
<INPUT TYPE="text" NAME=txtCity>
</P>
<P>
<P>
�ſ�ī�� ��ȣ:
<BR>
<INPUT TYPE="text" NAME=txtCCNumber>
<P>
������
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
<INPUT TYPE="submit" VALUE="Ȯ��" NAME=submit1>
</P>
</FORM>
</BODY>
</HTML>
