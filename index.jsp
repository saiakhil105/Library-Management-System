<!DOCTYPE html>
<%@ page import = "java.sql.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="resources/css/CustomStyling.css">
    <link rel="icon" type="image/png" href="resources/image_resources/bookImg.png"/>
    <script src="resources/js/bootstrap.min.js"></script>
    <script src="resources/js/jQuery.js"></script>
    <title>Library Management System</title>
</head>

<body>
    <div class="container-fluid">
        <div class="d-flex justify-content-center align-items-center mt-3">
            <div class="mr-3">
                <img src="resources/image_resources/bookImg.png" class="book rounded img-fluid" alt="...">
            </div>
            <div>
                <span class="h2 heading">LIBRARY MANAGEMENT SYSTEM</span>
            </div>
        </div>
        <hr class="hr container">
        <div class="d-flex justify-content-center">
            <div class="card border-secondary AddDataForm m-4 p-5 mt-5">
                <div class="d-flex justify-content-center mb-3">
                    <span class="h1 AddDataText">ADD DATA</span>
                </div>
                <div>
                    <form class="FormDiv" method="GET" action="dataEntry.do">
                        <div class="form-group">
                            <input type="text" class="form-control" id="studentID" placeholder="Student ID" name="studentID"
                                pattern="\d{4}-\d{2}-\d{3}-\d{3}"
                                oninvalid="setCustomValidity('Please enter a valid Student ID')"
                                title="You should enter a valid student ID in format of '1602-18-737-001'"
                                oninput="setCustomValidity('')" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="studentName" placeholder="Student Name" name="studentName"
                                oninvalid="setCustomValidity('Please enter the Student Name')"
                                title="Enter Student Name" oninput="setCustomValidity('')" required>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" id="bookID" placeholder="Book ID" name="bookID"
                                oninvalid="setCustomValidity('Please enter the Book ID')" title="Enter Book ID"
                                oninput="setCustomValidity('')" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="bookName" placeholder="Book Name" name="bookName"
                                oninvalid="setCustomValidity('Please enter the Book Name')" title="Enter Book Name"
                                oninput="setCustomValidity('')" required>
                        </div>
                        <div class="form-group">
                            <input type="text" class="form-control" id="dateOfIssue" placeholder="Date Of Issue" name="dateOfIssue"
                                pattern="\d{1,2}-\d{1,2}-\d{4}"
                                oninvalid="setCustomValidity('Please enter a Valid Date')"
                                title="You should enter a valid te in format of 'dd-mm-yyyy'"
                                oninput="setCustomValidity('')" required>
                        </div>
                        <div class="d-flex justify-content-center">
                            <button type="submit" class="btn btn-info">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="InfoTable m-2">
                <div>
                    <div class="d-flex justify-content-center mb-3">
                        <div class="h2 LogEntryText text-center">LOG ENTRY</div>
                        
                    </div>
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Student ID</th>
                                <th scope="col">Student Name</th>
                                <th scope="col">Book ID</th>
                                <th scope="col">Book Name</th>
                                <th scope="col">Date Of Issue</th>
                                <th scope="col">Date of Return</th>
                            </tr>
                        </thead>
                        <tbody class="TableBody">
                            <%
                                try{
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/wt_assignment","root","Akhil@123");
                                    Statement stmt = con.createStatement();
                                    ResultSet rs = stmt.executeQuery("select * from students");
                                    while(rs.next()){
                            %>
                            <% if(rs.getString(6).length()==0) {%>
                            <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td>
                                    <form method="GET" action="returnDate.do">
                                        <input type="text" style="display:none;" name="studentID" value="<%=rs.getString(1)%>">
                                        <input type="text" style="display:none;" name="bookID" value="<%=rs.getString(3)%>">
                                        <input type="submit" name="return" class="btn btn-success returnButton" value="Returned">
                                    </form>
                                </td>
                            </tr>
                            <% } else { %>
                                <tr>
                                <td><%=rs.getString(1)%></td>
                                <td><%=rs.getString(2)%></td>
                                <td><%=rs.getString(3)%></td>
                                <td><%=rs.getString(4)%></td>
                                <td><%=rs.getString(5)%></td>
                                <td><%=rs.getString(6)%></td>
                            </tr>
                            <% } %>

                            <%
                                    }
                                    con.close();
                                }
                                catch(Exception e){
                                    out.print(e);
                                }
                            %> 
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="text-center">
            <form method="GET" action="ClearTable.do">
                <button class="btn btn-danger">Clear Records</button>
            </form>
        </div>
    </div>
</body>

</html>