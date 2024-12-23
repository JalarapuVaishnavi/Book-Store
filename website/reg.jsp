<%@page import="java.sql.*"%>
<%
	String rno=request.getParameter("fname");
	String sname=request.getParameter("lname");
	String mail=request.getParameter("email");
	String phone=request.getParameter("phone");
	String pswd=request.getParameter("pwd");
	try
	{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
			PreparedStatement pst=con.prepareStatement("insert into student values(?,?,?,?,?)");
			pst.setString(1,rno);
			pst.setString(2,sname);
			pst.setString(3,phone);
			pst.setString(4,mail);
			pst.setString(5,pswd);
			pst.executeUpdate();
			if(pst!=null)
			{
				//out.print("<h1> one record inserted sucessfully</h1>");
				response.sendRedirect("homepage.html");
			}
			con.close();
		}
		catch(Exception e)
		{
%>
	<%=e%>
<%		}
%>