<%@ LANGUAGE = JavaScript %>
<HTML>
<HEAD>
<TITLE>최종 확인</TITLE>
</HEAD>
<BODY>

<H3>주문 정보 확인</H3>

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
Response.Write ("<P>이 다음 정보로 배달됩니다</P>")
Response.Write ("<P>이름 : " + name + "</P>")
Response.Write ("<P>주소 : </P>")
Response.Write ("<P>" + houseNo + " " + street + "<BR>")
Response.Write (city)
Response.Write ("<P>신용카드 번호는 " + ccNumber)
Response.Write (" 이며 만기일은 " + expiryDate)
Response.Write (" 입니다. 총 $" + cost + "가 청구됩니다")

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
<INPUT TYPE="submit" VALUE ="시스템 구입" NAME=submit1>
<P>
<INPUT TYPE="button" value="주문 취소" name=butCancel onclick="window.location.replace('Ch15Q2_TopFrame.htm')" >
</P>
</FORM>

</BODY>
</HTML>
