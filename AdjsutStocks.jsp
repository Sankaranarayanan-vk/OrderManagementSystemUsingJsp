<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.lang.*,java.sql.*"%> 



<html>

<body>
<%! 
public static int checkItemIfExists(String item_name) throws SQLException, ClassNotFoundException, InstantiationException, IllegalAccessException {
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
    
    String sql = "select * from item where item_name=?";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, item_name);
    ResultSet rs = stmt.executeQuery();
    int stock =0;
    if(rs.next()==false) {
        System.out.println("No such record found in the database");
        stock = 0;
        
    }
    else {
        stock = rs.getInt(4);
    }
    con.close();
    stmt.close();
    return  stock;

} %>

<%
String item_name = request.getParameter("item_name");
String temp = request.getParameter("stock");
int stock = Integer.parseInt(temp);


int old_stock =  checkItemIfExists(item_name);


stock = stock + old_stock;

Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
String sql = "update item set item_stock = ? where item_name = ?;";
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setInt(1, stock);
stmt.setString(2, item_name);
int i = stmt.executeUpdate();
if(i>0)
{
    out.println("Record updated sucessfully");
}else
{
    out.println("No Such record in the Database");
}
con.close();
stmt.close();

out.println("<br>---------------------<br>Stock Updated..!<br>---------------------<br>");







%>

</body>
</html>