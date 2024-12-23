<%@ page import="java.sql.*" %>
<%
try {
    // Create a connection to the Oracle database
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","admin");

    // Get the values of the parameters from the HTML form
    String em = request.getParameter("email");
    String ps = request.getParameter("pass");

    // Create a prepared statement to insert data into the reg1 table
    PreparedStatement st = con.prepareStatement("INSERT INTO reg1 VALUES (?, ?)");
    st.setString(1, em);
    st.setString(2, ps); 

    // Execute the SQL query and get the number of rows affected
    int rows = st.executeUpdate(); 

    // Close the prepared statement and the database connection
    st.close();
    con.close();

    // Check if any rows were affected
    if (rows > 0) {
        out.print("Data Inserted Successfully..."); 
        response.sendRedirect("home.html");
    } else {
        out.println("Invalid user details"); 
    } 

} catch (SQLException e) {
    // Handle any exceptions that occur
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    // Handle any exceptions that occur
    out.println("Error: " + e.getMessage());
    e.printStackTrace();
}
%>