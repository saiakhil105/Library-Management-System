import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ClearTable extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_assignment","root","Akhil@123");
            Statement stmt = con.createStatement();	    
            stmt.execute("delete from students");
            stmt.close();
            con.close();
        }
        catch(Exception e){
            out.print(e);
        }
        response.sendRedirect("index.jsp");
    }
}