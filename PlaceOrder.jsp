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




int grand_total = 0;
String item_name;
int unit_price = 0;
int amount = 0;

int item_id = 0;
int stock = 0;



Integer order_id = (Integer)session.getAttribute("order_id");
String customer_name = String.valueOf(session.getAttribute("customer_name"));

item_name = request.getParameter("item_name");


String temp = request.getParameter("quantity");
int quantity = Integer.parseInt(temp);





    

   

    	Connection con = null;
    	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
        String sql = "select * from item where item_name=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setString(1, item_name);
        ResultSet rs = stmt.executeQuery();
        
        
        if (rs.next() == false) {
            System.out.println("No such record found in the database");
          
        } else {
            item_id = rs.getInt(1);
            unit_price = rs.getInt(3);
            stock = rs.getInt(4);
            // order
            

            amount = unit_price * quantity;
            stock = stock - quantity;


            grand_total = grand_total + amount;

            //adjusting stocks

            sql = "update item set item_stock = ? where item_id = ?;";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, stock);
            stmt.setInt(2, item_id);
            int i = stmt.executeUpdate();


            sql = "insert into order_details (order_id, item_id, item_name, unit_price, quantity, amount, customer_name) values (?,?,?,?,?,?,?);";
            stmt = con.prepareStatement(sql);
            stmt.setInt(1, order_id);
            stmt.setInt(2, item_id);
            stmt.setString(3, item_name);
            stmt.setInt(4, unit_price);
            stmt.setInt(5, quantity);
            stmt.setInt(6, amount);
            stmt.setString(7,customer_name);
            i = stmt.executeUpdate();
 
           con.close();
           stmt.close();
        }
        out.println("<br>Item Added to cart..!");
        out.println("<br><h3>Add another item or proceed <a href='Order.html'>Continue</a></h3>");
        out.println("<br><h3>To Proceed Order,<a href='GenerateBill.jsp'>Proceed</a></h3>");

      
%>
<center> Item Added! click continue to add another item or place order</center>
</body>
</html>