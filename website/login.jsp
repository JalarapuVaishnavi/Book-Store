<%@page import="java.sql.*"%>
<%
	String mail=request.getParameter("email");
	String pswd=request.getParameter("pwd");
	try
	{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
			 PreparedStatement stmt = con.prepareStatement("SELECT * FROM student WHERE email=? AND password=?");
			stmt.setString(1, mail);
			stmt.setString(2, pswd);
			ResultSet rs = stmt.executeQuery();
			// If a matching record is found, redirect the user to the home page
			int x=0;
			if(rs.next()) {
				x++;
					response.sendRedirect("homepage.html");
			} else{
					// If no matching record is found, display an error message
				//System.out.println("invalid usere details");
				out.println("<p style='color:red;'>Invalid username or password. Please try again.</p>");
				//request.setAttribute("errorMessage","invalid user or password");
				//RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
                //dispatcher.include(request,response);
				//response.sendRedirect("homepage.html");
				%>
				<jsp:include page="sample.html"/>
			<%
			}
			rs.close();
			stmt.close();
			con.close();
	}
		catch(Exception e)
		{
			out.println(e);
	}
%>