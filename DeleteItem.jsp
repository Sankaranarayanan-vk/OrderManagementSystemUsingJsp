<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.lang.*,java.sql.*"%> 



<html>

<body>


<%
String item_name = request.getParameter("item_name");

Connection con = null;
Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");


String sql = "delete from item where item_name = ?;";
PreparedStatement stmt = con.prepareStatement(sql);
stmt.setString(1, item_name);
int i = stmt.executeUpdate();
if(i>0)
{
   out.println("Record Deleted Successfully");
}
else
{
   out.println("No Such Record in the Database");
}

con.close();
stmt.close();


%>

</body>
</html>