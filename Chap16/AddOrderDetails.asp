<%@ LANGUAGE = JavaScript%>
<HTML>
<HEAD>
</HEAD>
<BODY>
<%
   // ���� �̸��� �����ϴ� �迭
   // �� �� �� �� �������� ��¥�� ����� �� �����
   var month = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul",
      "Aug","Sep","Oct","Nov","Dec");
   var nowDate = new Date();
   var nowDate = nowDate.getDate() + " " + month[nowDate.getMonth()] + " " + 
      nowDate.getFullYear();
   var orderNo;

   // �����ͺ��̽��� ����
   var adoConnection = Server.CreateObject("ADODB.Connection");
   adoConnection.Open("DSN=CompBitsCoDB");
   var adoRecordset;

   // �ֹ��� CustomerOrder ���̺� �Է��ϱ� ���� SQL �ۼ�
   var mySQL = "INSERT INTO CustomerOrder " + 
      "(CustomerName, CustomerAddress, TelNumber, OrderDate)";
   mySQL = mySQL + " VALUES ('" + Request.Form("txtCustomerName") + "','";
   mySQL = mySQL + Request.Form("txtCustomerAddress") + "','";
   mySQL = mySQL + Request.Form("txtTelNumber") + "','";
   mySQL = mySQL + nowDate + "')";

   // SQL�� �����Ͽ� ���ο� �ֹ� �߰�
   adoConnection.Execute(mySQL);

   // ��� �߰��� �ֹ����� OrderNo�� �Ϸù�ȣ�� ������ SQL �ۼ�
   mySQL = "SELECT Max(OrderNo) AS MaxOrderNo FROM CustomerOrder WHERE ";
   mySQL = mySQL + " OrderDate = #" + nowDate + "# AND ";
   mySQL = mySQL + " CustomerName = '" + Request.Form("txtCustomerName") + "'";

   // SQL�� ���ڵ� ���� ó���Ͽ� OrderNo�� ����
   adoRecordset = adoConnection.Execute(mySQL);

   orderNo = adoRecordset("MaxOrderNo").Value;

   // ���� ���ڵ� ���� �ʿ����� �����Ƿ� ���ڵ� ���� �ݰ� �޸𸮸� ������
   adoRecordset.Close();
   adoRecordset = null;

   // OrderItem ���̺� �Ǹ��� ǰ���� ������ �� �ִ� SQL �ۼ�
   var mySQL = "INSERT INTO OrderItem (OrderNo, StockId, QtyOrdered)"
   mySQL = mySQL + " VALUES (" + orderNo + ","
   mySQL = mySQL + Request.Form("txtStockId") + ","
   mySQL = mySQL + "1)"
   
   // SQL�� �����Ͽ� �Ǹ��� ǰ���� �ֹ� ������ ������
   adoConnection.Execute(mySQL);

   // ���� �� �̻� �����ͺ��̽��� �������� �����Ƿ�
   // ������ �ݰ� ���� �޸𸮰� �ʿ���ٴ� ���� �˷���
   adoConnection.Close();
   adoConnection = null;

   Response.Write("<H2><CENTER>�ֹ��� ���������� ó���Ǿ����ϴ�" +
      "</CENTER></H2>");
%>
</BODY>
</HTML>
