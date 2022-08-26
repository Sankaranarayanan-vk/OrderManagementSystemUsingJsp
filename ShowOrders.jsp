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
    
        
        
        

        int order_id = 0;
        String sql = "select * from show_orders";
        PreparedStatement  stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();

       
 while (rs.next()) {
        	
            out.println(" ORDER ID: " + rs.getInt(2) + "<br> ORDER DATE: " + rs.getDate(3) + "<br> TIME: " + rs.getTime(3) + "<br> CUSTOMER ID: " + rs.getInt(4) + "<br> CUSTOMER NAME: " + rs.getString(5) + "<br> GRAND TOTAL: " + rs.getInt(6) +"<br>----------------------<br>");
            
        }
      
        
        %>

</body>
</html>