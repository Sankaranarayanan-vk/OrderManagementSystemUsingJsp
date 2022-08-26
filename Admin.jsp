<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.lang.*,java.sql.*"%> 



<html>

<body>

<% 
    String admin = request.getParameter("admin_name");
    String password = request.getParameter("pwd");
	Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
    
    String sql = "select * from admin where admin_name = ?";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, admin);
    ResultSet rs = stmt.executeQuery();
    rs.next();
    String pwd = rs.getString(3);
    if(pwd.equals(password)){
      	out.println("Welcome Admin");
    	out.println("<br>Login success..!  <a href='AdminMenu.html'>Menu</a><br>");
    }
    else{
    	out.println("wrong password");
        out.println("<br>Go Back to Login <a href='index.html'>Back</a><br>");
    }
	
 
    	%>

    


</body>
</html>