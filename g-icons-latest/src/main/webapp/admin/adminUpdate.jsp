<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.io.*" %>

<% 
String email=session.getAttribute("email").toString();
String phone = request.getParameter("phone");
String address=request.getParameter("address");
String city = request.getParameter("city");
int postcode = Integer.parseInt(request.getParameter("postcode"));
String state = request.getParameter("state");

try
{   
	String DB_DRIVER = "org.postgresql.Driver";
	   String DB_HOST = "jdbc:postgresql://ec2-34-230-110-100.compute-1.amazonaws.com:5432" + "/deuubd3cpu6e79";
	   String DB_USER = "uhyjocngsxkjjk";
	   String DB_PASSWORD = "e7345ca4dc0d86fd595bd255af727c8bc3bfe230c628a4ac8af293030ea7a82d";

	Connection conn = null;
    Statement stat = null;
    ResultSet res = null;
	Class.forName(DB_DRIVER);
	conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	stat = conn.createStatement();
    PreparedStatement ps = conn.prepareStatement("update admin set adminPhoneNum=?, adminAddress=?, adminPostcode=?, adminCity=?, adminState=? where adminEmail='" + email + "'");
    ps.setString(1, phone);
    ps.setString(2, address);
    ps.setInt(3, postcode);
    ps.setString(4, city);
    ps.setString(5, state);
    ps.executeUpdate();
    response.sendRedirect("admin-account.jsp?msg=valid");
    
    
    
}
catch(Exception e)
{
	response.sendRedirect("admin-account.jsp?msg=invalid");
}


%>