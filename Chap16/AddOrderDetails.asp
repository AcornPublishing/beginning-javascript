<%@ LANGUAGE = JavaScript%>
<HTML>
<HEAD>
</HEAD>
<BODY>
<%
   // 월의 이름을 저장하는 배열
   // 일 월 년 의 형식으로 날짜를 만드는 데 사용함
   var month = new Array("Jan","Feb","Mar","Apr","May","Jun","Jul",
      "Aug","Sep","Oct","Nov","Dec");
   var nowDate = new Date();
   var nowDate = nowDate.getDate() + " " + month[nowDate.getMonth()] + " " + 
      nowDate.getFullYear();
   var orderNo;

   // 데이터베이스에 연결
   var adoConnection = Server.CreateObject("ADODB.Connection");
   adoConnection.Open("DSN=CompBitsCoDB");
   var adoRecordset;

   // 주문을 CustomerOrder 테이블에 입력하기 위한 SQL 작성
   var mySQL = "INSERT INTO CustomerOrder " + 
      "(CustomerName, CustomerAddress, TelNumber, OrderDate)";
   mySQL = mySQL + " VALUES ('" + Request.Form("txtCustomerName") + "','";
   mySQL = mySQL + Request.Form("txtCustomerAddress") + "','";
   mySQL = mySQL + Request.Form("txtTelNumber") + "','";
   mySQL = mySQL + nowDate + "')";

   // SQL을 실행하여 새로운 주문 추가
   adoConnection.Execute(mySQL);

   // 방금 추가한 주문에서 OrderNo의 일련번호를 얻어오는 SQL 작성
   mySQL = "SELECT Max(OrderNo) AS MaxOrderNo FROM CustomerOrder WHERE ";
   mySQL = mySQL + " OrderDate = #" + nowDate + "# AND ";
   mySQL = mySQL + " CustomerName = '" + Request.Form("txtCustomerName") + "'";

   // SQL로 레코드 셋을 처리하여 OrderNo를 얻어옴
   adoRecordset = adoConnection.Execute(mySQL);

   orderNo = adoRecordset("MaxOrderNo").Value;

   // 이제 레코드 셋이 필요하지 않으므로 레코드 셋을 닫고 메모리를 해제함
   adoRecordset.Close();
   adoRecordset = null;

   // OrderItem 테이블에 판매한 품목을 삽입할 수 있는 SQL 작성
   var mySQL = "INSERT INTO OrderItem (OrderNo, StockId, QtyOrdered)"
   mySQL = mySQL + " VALUES (" + orderNo + ","
   mySQL = mySQL + Request.Form("txtStockId") + ","
   mySQL = mySQL + "1)"
   
   // SQL을 실행하여 판매한 품목의 주문 정보를 삽입함
   adoConnection.Execute(mySQL);

   // 이제 더 이상 데이터베이스에 접근하지 않으므로
   // 연결을 닫고 이제 메모리가 필요없다는 것을 알려줌
   adoConnection.Close();
   adoConnection = null;

   Response.Write("<H2><CENTER>주문이 성공적으로 처리되었습니다" +
      "</CENTER></H2>");
%>
</BODY>
</HTML>
