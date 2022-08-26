<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Date"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Bill</title>
</head>
<body>
<% 


Integer order_id = (Integer)session.getAttribute("order_id");
if(order_id == null){
	out.print("Enter a valid order id");
}

 out.println("+-------------------------------------------------------------+<br>");
       out.println(" ORDER ID: " + order_id);


        int grand_total = 0;
        int amount = 0;


        Connection con = null;
    	Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
        String sql = "select * from order_details where order_id=?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1, order_id);
        ResultSet rs = stmt.executeQuery();
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
        String customer_name= String.valueOf(session.getAttribute("customer_name"));
        Integer customer_id = (Integer)session.getAttribute("customer_id");
        
        sql = "insert into show_orders (order_id,customer_id,customer_name,grand_total) values (?,?,?,?);";
        stmt = con.prepareStatement(sql);
        stmt.setInt(1,order_id);
        stmt.setInt(2,customer_id);
        stmt.setString(3,customer_name);
        stmt.setInt(4,grand_total);
        int i = stmt.executeUpdate();
        
        con.close();
        stmt.close();
%>

</body>
</html>