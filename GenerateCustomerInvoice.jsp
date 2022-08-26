<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<body>

<% 
String customer_name = String.valueOf(session.getAttribute("customer_name"));
String temp = request.getParameter("order_id");
int order_id = Integer.parseInt(temp);
out.println("+-------------------------------------------------------------+<br>");
out.println(" ORDER ID: " + order_id + "<br> CUSTOMER NAME: " + customer_name + "<br>");


 int grand_total = 0;
 int amount = 0;


 Connection con = null;
	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
 String sql = "select * from order_details where order_id=? and customer_name = ?";
 PreparedStatement stmt = con.prepareStatement(sql);
 stmt.setInt(1, order_id);
 stmt.setString(2,customer_name);
 ResultSet rs = stmt.executeQuery();
 if(!rs.next()){
	 out.println("-----------------------<br>NOT FOUND<br>----------------------");
 }
 try {
     while (rs.next()) {


        out.println("<br> ITEM ID: " + rs.getInt(3) +
                 "<br> ITEM NAME: " + rs.getString(4) + "<br> UNIT PRICE: " + rs.getInt(5) +
                 "<br> QUANTITY: " + rs.getInt(6) + "<br>" + "----------------<br> AMOUNT: " + rs.getInt(7) + "<br>----------------<br>");
         amount = rs.getInt(7);
         grand_total = amount + grand_total;


     }
 } catch (Exception e) {
     System.out.println(e);
 }

 
 

 out.println("----------------------------<br> GRAND TOTAL = " + grand_total + "<br>----------------------------");

 out.println("<br>+-------------------------------------------------------------+");
%>
</body>
</html>