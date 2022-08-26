<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.lang.*,java.sql.*"%> 



<html>

<body>
<%
String customer_name = request.getParameter("customer_name");

        Connection con = null;
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
        
        String sql = "delete from customer where customer_name = ?;";
        PreparedStatement stmt = con.prepareStatement(sql);

        stmt.setString(1, customer_name);
        int i = stmt.executeUpdate();
        if(i>0)
        {
            out.println("<br>");
        }else
        {
            out.println("No Such record in the Database<br>");
            
        }
        con.close();
        stmt.close();
       out.println("---------------------<br>Customer Deleted..!<br>---------------------");
        %>


</body>
</html>