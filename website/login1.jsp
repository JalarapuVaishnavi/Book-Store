<%@ page import="java.sql.*" %>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","admin");   
String un=request.getParameter("t1");
String ps=request.getParameter("t2"); 
PreparedStatement st=con.prepareStatement("select * from reg1 where email=? and password=?");
st.setString(1,un);
st.setString(2,ps);
ResultSet rs=st.executeQuery(); 
int x=0;
while(rs.next())
{
x++;
response.sendRedirect("adm.html");
}
if(x==0)
{
%>  
<div style="text-align: center; color: white; font-size: 25px;">
Invalid ADMIN Details
</div>
<jsp:include page="admin.html"/>
<%

}
}
catch(Exception e)
{
System.out.println(e);
}
%>