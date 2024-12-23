<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
//String currentPassword=request.getParameter("current");
String Newpass=request.getParameter("new");
String conpass=request.getParameter("confirm");
String pass="";
String name;
try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");
			PreparedStatement pst=con.prepareStatement("update student where password='conpass'");
			ResultSet rs=st.executeQuery("select * from student where password="+conpass+"");
			while(rs.next()){
			name=rs.getString(4);
			pass=rs.getString(5);
	}
	System.out.println(name+ " "+pass);
	//if(pass.equals(currentPassword)){
		//Statement st1=con.createStatement();
		//int i=st1.executeUpdate("update login set password='"+Newpass+"' where id='"+id+"'");
		out.println("Password changed successfully");
		//st1.close();
		con.close();
	}
	else{
	out.println("Invalid Current Password");
	}
	}
	catch(Exception e){
		out.println(e);
}
%>