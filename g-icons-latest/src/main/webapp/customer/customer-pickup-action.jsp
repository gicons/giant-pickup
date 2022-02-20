<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import = "java.util.Date, java.sql.Time, java.sql.Timestamp,java.text.ParseException,java.text.SimpleDateFormat"%>
<%
String orderPickupDate = request.getParameter("orderPickupDate");
String orderPickupTime = request.getParameter("orderPickupTime");
String custId = request.getParameter("custId");
String store = request.getParameter("pickupStore");
String productId= request.getParameter("productId");
	try
	{
		String DB_DRIVER = "org.postgresql.Driver";
		   String DB_HOST = "jdbc:postgresql://ec2-34-230-110-100.compute-1.amazonaws.com:5432" + "/deuubd3cpu6e79";
		   String DB_USER = "uhyjocngsxkjjk";
		   String DB_PASSWORD = "e7345ca4dc0d86fd595bd255af727c8bc3bfe230c628a4ac8af293030ea7a82d";
	       Connection conn = null;
	       ResultSet rs;
	       Class.forName(DB_DRIVER);
	       conn = DriverManager.getConnection(DB_HOST, DB_USER, DB_PASSWORD);
	       Statement st=conn.createStatement();
	       PreparedStatement ps = conn.prepareStatement("INSERT INTO orders (orderStatus, orderPickupStore, orderPickupDate, orderPickupTime, custId) VALUES (?,?,?,?,?)");
	       ps.setString(1,"Preparing");
	       ps.setString(2,store);
	       ps.setString(3,orderPickupDate);
	       ps.setString(4,orderPickupTime);
	       ps.setString(5,custId);
	       ps.executeUpdate();
	       response.sendRedirect("customer-summary.jsp");
	}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		response.sendRedirect("customer-home.jsp?msg=invalid");	
	}

%>