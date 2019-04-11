--%>
 
<%@ page import ="java.sql.*" %>
<%
     String URL = "jdbc:mysql://cs692.ctdjarc52rre.us-east-1.rds.amazonaws.com:3306/CS692";
     String USER = "Assignment5";
     String PASS = "%1eTbct7i0grtM!U";
    try{
        String username = request.getParameter("username");   
        String password = request.getParameter("password");
        Class.forName("com.mysql.jdbc.Driver");  // MySQL database connection
        Connection conn = DriverManager.getConnection(URL, USER, PASS);    
        PreparedStatement pst = conn.prepareStatement("Select username,password from login where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        ResultSet rs = pst.executeQuery();                        
        if(rs.next())           
           out.println("Welcome to the CS-692- Assignment 5 Site");        
        else
           out.println("Invalid login credentials");            
   }
   catch(Exception e){       
       out.println("Something went wrong !! Please try again");       
   }      
%>