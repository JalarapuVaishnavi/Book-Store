<%@page import="java.sql.*"%>
<%
	String sname=request.getParameter("name");
	String mail=request.getParameter("email");
	String subj=request.getParameter("subject");
	String msg=request.getParameter("message");
	try
	{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
			PreparedStatement pst=con.prepareStatement("insert into contact values(?,?,?,?)");
			pst.setString(1,sname);
			pst.setString(2,mail);
			pst.setString(3,subj);
			pst.setString(4,msg);
			pst.executeUpdate();
			if(pst!=null)
			{
				out.print("<h1> one record inserted sucessfully</h1>");
				response.sendRedirect("homepage.html");
				//out.print("<h1> one record inserted sucessfully</h1>");
			}
			con.close();
		}
		catch(Exception e)
		{
%>
	<%=e%>
<%		}
%>