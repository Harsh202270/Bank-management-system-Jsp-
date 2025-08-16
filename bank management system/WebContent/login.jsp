<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="javax.swing.*" %>
<%
    String btnval=request.getParameter("b1");
     if(btnval.equalsIgnoreCase("login"))  
     {
    	 String t1=request.getParameter("t1");
    	 String t2=request.getParameter("t2");
         try
         {
     	    Class.forName("oracle.jdbc.driver.OracleDriver");
     	    Connection conn=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","bank","bank");
     		Statement smt=conn.createStatement();
     		ResultSet rs=smt.executeQuery("select email,password from information");
            while(rs.next())
     		{
            	if(rs.getString(1).equalsIgnoreCase(t1))
				{
				  if(rs.getString(2).equals(t2))
				  {
					  session.setAttribute("email", t1);
					  out.println("<script>window.open('logina.html','_self')</script>");
					  break;
				  }//End of if 
				}//End of if
     		}//End of while
            

         }//End of try
        catch(Exception e)
        {
    	 out.println(e.toString());
        }
       } 	
     
     
     if(btnval.equalsIgnoreCase("Sign in"))
     	out.println("<script>window.open('signin.html','_self')</script>");
     %>

</body>
</html>