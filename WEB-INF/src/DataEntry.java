import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;
public class DataEntry extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException{
        PrintWriter out = response.getWriter();

        String studentID = request.getParameter("studentID");
        String studentName = request.getParameter("studentName");
        String bookID = request.getParameter("bookID");
        String bookName = request.getParameter("bookName");
        String dateOfIssue = request.getParameter("dateOfIssue");

        
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_assignment","root","Akhil@123");
            PreparedStatement st = con.prepareStatement("insert into students values(?,?,?,?,?,?)");
            st.setString(1,studentID);
            st.setString(2,studentName);
            st.setString(3,bookID);
            st.setString(4,bookName);
            st.setString(5,dateOfIssue);
            st.setString(6,"");
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