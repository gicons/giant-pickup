<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<!DOCTYPE html>
<html>
<% 
String orderId=request.getParameter("orderId");
try{
	String DB_DRIVER = "org.postgresql.Driver";
	   String DB_HOST = "jdbc:postgresql://ec2-34-230-110-100.compute-1.amazonaws.com:5432" + "/deuubd3cpu6e79";
	   String DB_USER = "uhyjocngsxkjjk";
	   String DB_PASSWORD = "e7345ca4dc0d86fd595bd255af727c8bc3bfe230c628a4ac8af293030ea7a82d";
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs;
    Class.forName(DB_DRIVER);
    conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
    Statement st=conn.createStatement();
    st.executeUpdate("delete from orders where orderId='"+orderId+"'");
    response.sendRedirect("admin-status.jsp?msg=order-deleted");	
%>

<script>
function myFunction() {
  alert("Succefully delete an order!");
}
</script>
<%
}
catch (Exception e){
	System.out.println(e);

}

%>

