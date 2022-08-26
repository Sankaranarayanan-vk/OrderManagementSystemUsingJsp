<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.lang.*,java.sql.*"%> 



<html>

<body>

<%
String name = request.getParameter("name");
String temp = request.getParameter("stock");
int stock = Integer.parseInt(temp);
String temp2 = request.getParameter("price");
int price = Integer.parseInt(temp2);
Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
        String sql = "insert into item (item_name, unit_price, item_stock) values (?,?,?);";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setInt(2, price);
        stmt.setInt(3, stock);
        int i = stmt.executeUpdate();
        con.close();
        stmt.close();
        %>
        Item added Successfully.....!
        <meta http-equiv="refresh" content="2;url=http://localhost:8080/JspTurorial/AdminMenu.html" />
</body>
</html>