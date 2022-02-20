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
String custEmail= session.getAttribute("custEmail").toString();
String product_id=request.getParameter("productId");
String id = session.getAttribute("id").toString();
String incdec=request.getParameter("cartQuantity");
double price=0.0;
double total=0.0;
int quantity=0;
double final_total=0.0;
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
    ResultSet rs6=st.executeQuery("select *from cart where product_id='"+product_id+"' and cust_id='"+id+"'");
    while (rs6.next()){
    	price=rs6.getDouble(3);
    	total=rs6.getDouble(5);
    	quantity=rs6.getInt(4);
    }
    if(quantity==1 && incdec.equals("dec"))
    	response.sendRedirect("customer-cart.jsp?msg=notPossible");
    else if(quantity!=1 && incdec.equals("dec"))
    {
    	total= total-price;
    	quantity=quantity-1;
    	st.executeUpdate("update cart set cartTotalPrice='"+total+"',cartQuantity='"+quantity+"' where product_id='"+product_id+"' and cust_id='"+id+"'");
    	response.sendRedirect("customer-cart.jsp?msg=decreased");
    }
    else
    {
    	total= total+price;
    	quantity=quantity+1;
    	st.executeUpdate("update cart set cartTotalPrice='"+total+"',cartQuantity='"+quantity+"' where product_id='"+product_id+"' and cust_id='"+id+"'");
    	response.sendRedirect("customer-cart.jsp?msg=increased");
    }

	
}
catch (Exception e){
	System.out.println(e);
}



%>

</html>