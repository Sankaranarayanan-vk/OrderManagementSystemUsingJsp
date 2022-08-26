<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.lang.*,java.sql.*"%> 



<html>

<body>

<%
Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");

        String sql = "select * from customer";
        PreparedStatement stmt = con.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
          out.println(" CUSTOMER ID: " + rs.getInt(1) + "<br> CUSTOMER NAME: " + rs.getString(2) + "<br>----------------------------------- ");
       }

        con.close();
        stmt.close();
%>



</body>
</html>