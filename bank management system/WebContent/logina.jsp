<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
	
    String emaill = (String) session.getAttribute("email");
    String balance = "0.00";
    String account = "**********";
    if (emaill != null) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "bank", "bank");

            PreparedStatement ps = conn.prepareStatement("SELECT balance, account_no FROM information WHERE email=?");
            ps.setString(1, emaill);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                double bal = rs.getDouble("balance");
                balance = String.format("%.2f", bal);
                account = rs.getString("account_no");
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            balance = "Error";
            account = "Error";
        }
    } else {
        balance = "No Session";
        account = "No Session";
    }

    out.print(balance + "," + account); // Example format: "1234.56,AC12345678"
    session.setAttribute("account_no", account);
    
    
%>
