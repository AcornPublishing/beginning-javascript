<%@ LANGUAGE = JavaScript%>
<HTML>
<BODY>
<TABLE BORDER=1>
<THEAD>
   <TR>
   <TH>��ǰ</TH>
   <TH>��ǰ ����</TH>
   <TH>��ǰ ����</TH>
   <TH></TH>
   </TR>
</THEAD>

<%
// �����ͺ��̽��� ������ ���� ���ڵ� �¿� ǰ���� ����� ����
   var adoConnection = Server.CreateObject("ADODB.Connection");
   var adoRecordSet;
   var mySQL;
   adoConnection.Open("DSN=CompBitsCoDB");
   var mySQL = "SELECT StockId, ItemDescription, NumberInStock, ItemCost" + 
      " FROM Stock";
   adoRecordSet = adoConnection.Execute(mySQL);

// ���ڵ� ���� �ݺ��ϰ� ��ǰ ���� ������ �������� �ۼ�
   while ( adoRecordSet.Eof == false )
   {
%>
<TR>
   <TD><%=adoRecordSet("ItemDescription").Value%></TD>
   <TD><%=adoRecordSet("NumberInStock").Value%></TD>
   <TD><%=adoRecordSet("ItemCost").Value%></TD>
   <TD><A HREF="buyitem.asp?StockId=<%=adoRecordSet("StockId").Value%>">
      �����ϱ�</A></TD>
</TR>
<%
   adoRecordSet.MoveNext();
   }

// ���ڵ� �°� ������ �ݰ�
// Recordset�� Connection ��ü�� ����� �޸𸮸� ����
   adoRecordSet.Close();
   adoRecordSet = null;
   adoConnection.Close();
   adoConnection = null;
%>
</TABLE>
</BODY>
</HTML>
