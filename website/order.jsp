<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>

<%
String breed = request.getParameter("breed");
String costParam = request.getParameter("cost");
String address = request.getParameter("address");
String phone = request.getParameter("phone");
String name = request.getParameter("name");
String trans = request.getParameter("tra");

String jdbcURL = "jdbc:oracle:thin:@localhost:1521:XE";
String dbUsername = "system";
String dbPassword = "admin";

if (breed.isEmpty() || costParam.isEmpty() || address.isEmpty() || phone.isEmpty() || name.isEmpty()) 
{
    out.println("Please fill in all the required fields will you please go back and select your pet."); 
%>
<jsp:include page="order.html"/>
<%
} 
else {
   try {
        // Connect to the database
        Connection conn = DriverManager.getConnection(jdbcURL, dbUsername, dbPassword);
        
        // Prepare and execute the SQL statement
        String sql = "INSERT INTO orderss VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement statement = conn.prepareStatement(sql);
        statement.setString(1, breed);
        statement.setString(2, costParam);
        statement.setString(3, address);
        statement.setString(4, phone);
        statement.setString(5, name);
		statement.setString(6, trans);
        int rowsInserted = statement.executeUpdate();
        
        if (rowsInserted > 0) {
            out.println("Order placed successfully.");
        } else {
            out.println("Failed to place the order.");
        }
        
        // Close the database connection
        if (conn != null) {
            conn.close();
        }
    } catch (Exception e) {
        out.println("An error occurred while processing the order:"+e.getMessage());
	}
}
%>