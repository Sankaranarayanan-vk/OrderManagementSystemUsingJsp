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
Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
        String sql = "select * from item";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        if (rs.next()) {
            while (rs.next()) {
               out.println(" ITEM ID: " + rs.getInt(1) + "<br> ITEM NAME: " + rs.getString(2) + "<br> UNIT PRICE: " + rs.getInt(3) + "<br> ITEM STOCK: " + rs.getInt(4) + "<br>-----------------<br>");
            }


        } else {
            out.println("Item List is empty...!");
           
        }
        con.close();
        stmt.close();
        
        %>
</body>
</html>