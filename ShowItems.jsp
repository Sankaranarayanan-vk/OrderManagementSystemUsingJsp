<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.lang.*,java.sql.*"%> 
<html>
<body>

<% 

Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");

String sql = "select * from item";
PreparedStatement stmt = con.prepareStatement(sql);
ResultSet rs = stmt.executeQuery();

out.println("</center>");
out.println("<center><table border=1 style='text-align:center'><tr><th>ITEM NAME</th><th>UNIT PRICE</th></tr>");        
while (rs.next()) {
    out.println( "<tr><td>"+rs.getString(2)+"</td><td>"+ +rs.getInt(3)+"</td></tr>" );
}


out.println("</table>\n</center>");



con.close();
stmt.close();
out.println("<h3>Click and order ==> <a href='Order.html'>Order</a></h3>");
%>

