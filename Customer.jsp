<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.lang.*,java.sql.*"%> 



<html>

<body>

<% 
String customer_name = request.getParameter("customer_name");
String password = request.getParameter("pwd");


       

    Connection con = null;
    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
    
    String sql = "select * from customer where customer_name = ?";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setString(1, customer_name);
    ResultSet rs = stmt.executeQuery();
    
    
    
    int customer_id = 0;
    
    if(!rs.next()) {
    	
    	
         sql = "insert into customer (customer_name,customer_pwd) values (?,?);";
         stmt = con.prepareStatement(sql);
         stmt.setString(1, customer_name);
         stmt.setString(2, password);
         int i = stmt.executeUpdate();
         con.close();
         stmt.close();
         
     
         con = null;
         Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
         con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
         sql = "select * from customer where customer_name=?";
         stmt = con.prepareStatement(sql);
         stmt.setString(1, customer_name);
         rs = stmt.executeQuery();
         
        
         if(rs.next()==false) {
           out.println("No such record found in the database");
           
         }
         else {
             customer_id = rs.getInt(1);

         }
         out.println("<center>Welcome  " + customer_name + "<br>"  + " Your customer id is : " + customer_id + "<br>And Your password is set :"+ password+ "<br></center>" );
         
        
    }
   else{
	 
			con = null;
		    Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
		    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sankar","root","sankar199");
		    
		    sql = "select * from customer where customer_name = ?";
		    stmt = con.prepareStatement(sql);
		    stmt.setString(1, customer_name);
		    rs = stmt.executeQuery();
		    rs.next();
		    String pwd = rs.getString(3);
		    
		    if(pwd.equals(password)){
		    	  customer_id = rs.getInt(1); 
		          out.println("<center>Welcome Back " + customer_name + "<br>"   + " Your customer id is : " + customer_id  + "<br></center>") ;
		    	
		    }
		    else{

		    	out.println("wrong password");
		        out.println("<br>Go Back to Login <a href='index.html'>Back</a><br>");
		    }
			
		
	 
     

}
   
    session.setAttribute("customer_name", customer_name); 


sql = "insert into orders (customer_id,customer_name) values (?,?);";
stmt = con.prepareStatement(sql);
stmt.setInt(1,customer_id);
stmt.setString(2,customer_name);
int i = stmt.executeUpdate();
int order_id =0;

sql = "select * from orders order by time desc limit 1;";
stmt = con.prepareStatement(sql);
rs = stmt.executeQuery();
if (rs.next() == false) {
   out.println("No such record found in the database");
    //Main.homePage();
} else {
    order_id = rs.getInt(1);
}

con.close();
stmt.close();

Integer ord_id = new Integer(order_id);
session.setAttribute("order_id", ord_id);




Integer cus_id = new Integer(customer_id);
session.setAttribute("customer_id", cus_id);
out.println("<br>Login success..!  <a href='CustomerMenu.html'>Menu</a><br>");

    
%>





</body>

</html>