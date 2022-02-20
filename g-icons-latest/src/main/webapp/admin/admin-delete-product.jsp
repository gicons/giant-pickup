<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
String productId = request.getParameter("d");

String DB_DRIVER = "org.postgresql.Driver";
String DB_HOST = "jdbc:postgresql://ec2-34-230-110-100.compute-1.amazonaws.com:5432" + "/deuubd3cpu6e79";
String DB_USER = "uhyjocngsxkjjk";
String DB_PASSWORD = "e7345ca4dc0d86fd595bd255af727c8bc3bfe230c628a4ac8af293030ea7a82d";


Class.forName(DB_DRIVER).newInstance();
Connection conn = DriverManager.getConnection(DB_HOST,DB_USER,DB_PASSWORD);
Statement stat = conn.createStatement();
stat.executeUpdate("delete from product where productId ='"+ productId +"'");
response.sendRedirect("admin-home.jsp");
%>

<script>
function myFunction() {
  alert("Succefully add new product!");
}
</script>