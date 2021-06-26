import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReturnDate extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
	    Date date = new Date();
        String todaysDate = formatter.format(date)+"";
        String studentID = request.getParameter("studentID");
        String bookID = request.getParameter("bookID");

        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_assignment","root","Akhil@123");
            PreparedStatement st = con.prepareStatement("update students set dateOfReturn = ? where studentID = ? and bookID= ?");
            st.setString(1,todaysDate);
            st.setString(2,studentID);
            st.setString(3,bookID);
            st.executeUpdate();
            st.close();
            con.close();
        }
        catch(Exception e){
            out.print(e);
        }
        response.sendRedirect("index.jsp");
    }
}