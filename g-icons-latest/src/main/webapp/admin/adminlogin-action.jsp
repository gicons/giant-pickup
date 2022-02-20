<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%
String email = request.getParameter("email");
String password = request.getParameter("password");
if("email".equals(email) && "password".equals(password)){
	session.setAttribute("email", email);
	response.sendRedirect("admin-home.jsp");
}
else
{
	int z=0;
	int adminId;
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
	       String data = "select * from admin where adminEmail='"+email+"'and adminPassword ='" + password + "'";
	       res = stat.executeQuery(data);
	       while(res.next())
	       {
	    	   z=1;
	    	   session.setAttribute("email",email);
	    	   session.setAttribute("adminId",res.getString("adminId"));
	    	   response.sendRedirect("admin-home.jsp");
	       }
	       if(z==0)
	    	   response.sendRedirect("admin-login.jsp?msg=notexist");
	}
	catch(Exception e)
	{
		response.sendRedirect("admin-login.jsp?msg=invalid");	
	}
}
%>
