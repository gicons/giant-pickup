<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<%
try{
	String id = request.getParameter("id");
	String DB_DRIVER = "org.postgresql.Driver";
	   String DB_HOST = "jdbc:postgresql://ec2-34-230-110-100.compute-1.amazonaws.com:5432" + "/deuubd3cpu6e79";
	   String DB_USER = "uhyjocngsxkjjk";
	   String DB_PASSWORD = "e7345ca4dc0d86fd595bd255af727c8bc3bfe230c628a4ac8af293030ea7a82d";
     Connection conn = null;
     Statement st;
     PreparedStatement ps = null;
     Class.forName(DB_DRIVER);
     conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
     st = conn.createStatement();
     st.executeUpdate("delete from admin where adminId ='"+ id +"'");
     response.sendRedirect("admin-user.jsp");
	
	
}
catch (Exception e){
	
}
%>