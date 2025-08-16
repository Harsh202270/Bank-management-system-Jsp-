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
    String btnval=request.getParameter("b1");
    if(btnval.equalsIgnoreCase("create"))
     {
    	String t1=request.getParameter("t1");
    	String t2=request.getParameter("t2");
    	String t3=request.getParameter("t3");
    	String t4=request.getParameter("t4");
    	String t5=request.getParameter("t5");
    	String t6=request.getParameter("t6");
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bank","bank");
    	    PreparedStatement psmt=conn.prepareStatement("insert into information values(?,?,?,?,?,?)");
    	    psmt.setString(1,t1);
    	    psmt.setString(2,t2);
    	    psmt.setString(3,t3);
    	    psmt.setString(4,t4);
    	    psmt.setString(5,t5);
    	    psmt.setString(6,t6);
    	   	psmt.executeQuery();
    	   	PreparedStatement psm=conn.prepareStatement("insert into tranhistory(account_no,amount,payment_method,payment_type) values (?,?,'Cash','Create Deposit')");
    	    psm.setString(1,t1);
    	    psm.setString(2,t5);
    	   	psm.executeQuery();
    	    out.println("<script>alert('Record saved....')</script>");
    	    out.println("<script>window.open('login.html','_self')</script>");
        }
        catch(Exception e)
        {
        	JOptionPane.showMessageDialog(null,e);
        }
     }//End of save
     
     if(btnval.equalsIgnoreCase("delete"))
     {
    	String t1=request.getParameter("t1");
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vardhan","vardhan");
    	    PreparedStatement psmt=conn.prepareStatement("delete from payments where payment_id='"+t1+"'");
    	   	psmt.executeQuery();
    	    out.println("<script>alert('Record Deleted....')</script>");
    	    out.println("<script>window.open('PAYMENTS.html','_self')</script>");
        }
        catch(Exception e)
        {
    	 out.println(e.toString());
        }
     }//End of delete
     
     if(btnval.equalsIgnoreCase("update"))
     {
    	String t1=request.getParameter("t1");
    	String t2=request.getParameter("t2");
    	String t3=request.getParameter("t3");
    	String t4=request.getParameter("t4");
    	try
    	{
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vardhan","vardhan");
    	    PreparedStatement psmt=conn.prepareStatement("update payments set booking_id=?, amount=?,payment_date=? where payment_id=?");
    	    psmt.setString(4,t1);
    	    psmt.setString(1,t2);
    	    psmt.setString(2,t3);
    	    psmt.setString(3,t4);
    	   	psmt.executeQuery();
    	    out.println("<script>alert('Record Update....')</script>");
    	    out.println("<script>window.open('PAYMENTS.html','_self')</script>");
        }
        catch(Exception e)
        {
    	 out.println(e.toString());
        }
     }//End of save

     if(btnval.equalsIgnoreCase("allsearch"))  
     {
         try
         {
     	    Class.forName("oracle.jdbc.driver.OracleDriver");
     	    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "vardhan","vardhan");
     		Statement smt=conn.createStatement();
     		ResultSet rs=smt.executeQuery("select * from payments");
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
