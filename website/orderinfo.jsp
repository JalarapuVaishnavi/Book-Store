<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
    <title>User Table</title>
    <style>
        body {
            background-color: black;
            color: white;
        }

        table {
            width: 90%;
            border-collapse: collapse;
        }

        th, td {
            height: 45px;
            text-align: left;
            padding: 8px;
            border: 1px solid white;
        }

        tr:nth-child(even) {
            background-color: black;
        }

        tr:nth-child(odd) {
            background-color: black;
        }
    </style>
</head>
<body>
    <center>
        <table>
            <tr>
                <th>Bookname</th>
                <th>money</th>
                <th>Address</th> 
                <th>phone</th>
                <th>name</th>
              

            </tr>
            <% 
                try {
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
                    Statement stmt = conn.createStatement();
                    String sql = "SELECT * FROM orderss";
                    ResultSet rs = stmt.executeQuery(sql);

                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString(1) %></td>
                <td><%= rs.getString(2) %></td>
                <td><%= rs.getString(3) %></td>
                <td><%= rs.getString(4) %></td>
                <td><%= rs.getString(5) %></td>
          
            </tr>
            <% 
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println(e);
                }
            %>
        </table>
    </center>
</body>
</html>