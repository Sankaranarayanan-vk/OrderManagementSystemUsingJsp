import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

class dbmsconnection{
    String url;
    String username;
    String password;

    public dbmsconnection(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public Connection getConnection() throws InstantiationException, IllegalAccessException, ClassNotFoundException, SQLException {
        Connection con=null;
        Class.forName("com.mysql.cj.jdbc.Driver").newInstance();
        con = DriverManager.getConnection(url,username,password);
        return con;
    }

    public void closeConnection(Connection con, Statement stmt) throws SQLException
    {
        stmt.close();
        con.close();
    }
}