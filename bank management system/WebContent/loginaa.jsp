<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.*" %>
<%
String emaill = (String) session.getAttribute("account_no");
    String btnval=request.getParameter("b1");
    
     if(btnval.equalsIgnoreCase("thistory"))  
     {
         try
         {
     	    Class.forName("oracle.jdbc.driver.OracleDriver");
     	    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bank","bank");
     		Statement smt=conn.createStatement();
     		ResultSet rs=smt.executeQuery("SELECT ACCOUNT_NO,AMOUNT,PAYMENT_METHOD,PAYMENT_TYPE,TO_CHAR(PAYMENT_DATE, 'YYYY-MM-DD') ,TO_CHAR(PAYMENT_DATE, 'HH24:MI:SS') FROM TRANHISTORY where account_no = '"+emaill+"' order by payment_date desc");
         %>
     		<table border=3>
     		<tr>
     		    <th>  Account Number  </th>
         		<th>  Transaction Amount </th>
         		<th>Payment Method</th>
         		<th>Payment Type</th>
         		<th>Payment Date Only</th>
         		<th>Payment Time Only</th>
     		</tr>
     		<%
     			while(rs.next())
     			{
     		%>
     		<tr>
            	<th><%=rs.getString(1)%></th>
            	<th><%=rs.getString(2)%></th>
            	<th><%=rs.getString(3)%></th>
            	<th><%=rs.getString(4)%></th>
            	<th><%=rs.getString(5)%></th>
            	<th><%=rs.getString(6)%></th>
          	 </tr>
            <%}
         }
        catch(Exception e)
        {
    	 out.println(e.toString());
        }%>
     		<input type=button value="Print" onclick="window.print()">
     </table>
     <%}
     
     if(btnval.equalsIgnoreCase("psearch"))  
    	 {
    		String t1=request.getParameter("t1");
         	try
         	{
     	    Class.forName("oracle.jdbc.driver.OracleDriver");
     	    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vardhan","vardhan");
     		Statement smt=conn.createStatement();
     		ResultSet rs=smt.executeQuery("select * from payments where booking_id='"+t1+"'");
        	 %>
     		<table border=3>
     		<tr>
     		    <th>Payment Id</th>
         		<th>Booking Id</th>
         		<th>Amount</th>
         		<th>Payment Date</th>
     		</tr>
     		<%
     			while(rs.next())
     			{
     		%>
     		<tr>
            	<th><%=rs.getString(1)%></th>
            	<th><%=rs.getString(2)%></th>
            	<th><%=rs.getString(3)%></th>
            	<th><%=rs.getString(4)%></th>
          	 </tr>
            <%}
         }
        catch(Exception e)
        {
    	 out.println(e.toString());
        }%>
     		<input type=button value="Print" onclick="window.print()">
     </table>
     <%}%>
</body>
</html>