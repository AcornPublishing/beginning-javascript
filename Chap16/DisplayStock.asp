<%@ LANGUAGE = JavaScript%>
<HTML>
<BODY>
<TABLE BORDER=1>
<THEAD>
   <TR>
   <TH>상품</TH>
   <TH>상품 수량</TH>
   <TH>상품 가격</TH>
   <TH></TH>
   </TR>
</THEAD>

<%
// 데이터베이스의 연결을 열고 레코드 셋에 품목의 목록을 넣음
   var adoConnection = Server.CreateObject("ADODB.Connection");
   var adoRecordSet;
   var mySQL;
   adoConnection.Open("DSN=CompBitsCoDB");
   var mySQL = "SELECT StockId, ItemDescription, NumberInStock, ItemCost" + 
      " FROM Stock";
   adoRecordSet = adoConnection.Execute(mySQL);

// 레코드 셋을 반복하고 상품 세부 정보를 페이지에 작성
   while ( adoRecordSet.Eof == false )
   {
%>
<TR>
   <TD><%=adoRecordSet("ItemDescription").Value%></TD>
   <TD><%=adoRecordSet("NumberInStock").Value%></TD>
   <TD><%=adoRecordSet("ItemCost").Value%></TD>
   <TD><A HREF="buyitem.asp?StockId=<%=adoRecordSet("StockId").Value%>">
      구입하기</A></TD>
</TR>
<%
   adoRecordSet.MoveNext();
   }

// 레코드 셋과 연결을 닫고
// Recordset과 Connection 객체가 사용한 메모리를 해제
   adoRecordSet.Close();
   adoRecordSet = null;
   adoConnection.Close();
   adoConnection = null;
%>
</TABLE>
</BODY>
</HTML>
