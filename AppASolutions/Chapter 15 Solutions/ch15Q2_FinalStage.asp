<%@ LANGUAGE = JavaScript %>
<HTML>
<HEAD>
<TITLE>���� Ȯ��</TITLE>
</HEAD>
<BODY>

<H3>�ֹ� ���� Ȯ��</H3>

<%

var description = Request.Form("txtDescription").item;
var cost = Request.Form("txtCost").Item
var name = Request.Form("txtName").Item
var houseNo = Request.Form("txtHouse").Item
var street = Request.Form("txtStreet").Item
var city = Request.Form("txtCity").Item
var ccNumber = Request.Form("txtCCNumber").Item

var expiryDate = Request.Form("selMonth") + "/" +Request.Form("selYear")

Response.Write ("<P>" + description + "</P>")
Response.Write ("<P>�� ���� ������ ��޵˴ϴ�</P>")
Response.Write ("<P>�̸� : " + name + "</P>")
Response.Write ("<P>�ּ� : </P>")
Response.Write ("<P>" + houseNo + " " + street + "<BR>")
Response.Write (city)
Response.Write ("<P>�ſ�ī�� ��ȣ�� " + ccNumber)
Response.Write (" �̸� �������� " + expiryDate)
Response.Write (" �Դϴ�. �� $" + cost + "�� û���˴ϴ�")

%>

<FORM action="ch15Q2_PurchaseOrder.asp" method=POST name=form1>
<INPUT TYPE="hidden" NAME="txtName" VALUE ="<%=name%>">
<INPUT TYPE="hidden" NAME="txtDescription" VALUE ="<%=description%>">
<INPUT TYPE="hidden" NAME="txtCost" VALUE ="<%=cost%>">
<INPUT TYPE="hidden" NAME="txtHouseNo" VALUE ="<%=houseNo%>">
<INPUT TYPE="hidden" NAME="txtStreet" VALUE ="<%=street%>">
<INPUT TYPE="hidden" NAME="txtCity" VALUE ="<%=city%>">
<INPUT TYPE="hidden" NAME="txtCCNumber" VALUE ="<%=ccNumber%>">
<INPUT TYPE="hidden" NAME="txtExpiryDate" VALUE ="<%=expiryDate%>">
<INPUT TYPE="submit" VALUE ="�ý��� ����" NAME=submit1>
<P>
<INPUT TYPE="button" value="�ֹ� ���" name=butCancel onclick="window.location.replace('Ch15Q2_TopFrame.htm')" >
</P>
</FORM>

</BODY>
</HTML>
