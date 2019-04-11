<%-- 
    Document   : index
    Created on : Apr 8, 2019, 9:07:28 PM
    Author     : jessicaeason
--%>

<%@page import="java.sql.*, java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LogIn Data</title>
    </head>
    <body>
        <h1>Register for Site</h1>
        <%!
            public class Login {
                String URL = "jdbc:mysql://cs692.ctdjarc52rre.us-east-1.rds.amazonaws.com:3306/CS692";
                String USERNAME = "Assignment5";
                String PASSWORD = "%1eTbct7i0grtM!U";
                
                Connection connection =null;
                PreparedStatement insertLogin =null;
                ResultSet resultSet =null;

                public Login() {
                
                try {

                    connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                    insertLogin = connection.prepareStatement(
                    "INSERT INTO login (first_name , last_name,username, password)"
                    + " VALUES (?, ?, ?, ?)");
                } catch (SQLException e){
                    e.printStackTrace();
                    }
                }
                
                public int setLogin (String first, String last,String username, String password){
//,Timestamp timeStamp){

                        int result = 0;
                        
                        try{
                            insertLogin.setString(1, first);
                            insertLogin.setString(2, last);
                            insertLogin.setString(3, username);
                            insertLogin.setString(4, password);
                            //insertActors.setTimestamp(3,timeStamp);
                            result = insertLogin.executeUpdate();
                        } catch (SQLException e){
                            e.printStackTrace();
                        }

                    return result;

                }
            }
            %>
            <%
                int result = 0;
                String first_name =new String();
                String last_name =new String();
                String username =new String();
                String password = new String();
                
                if (request.getParameter("first") != null){
                    first_name = request.getParameter("first");
                }
                
                if (request.getParameter("last") != null){
                    last_name = request.getParameter("last");
                }
                
                if (request.getParameter("username") != null){
                    username = request.getParameter("username");
                }
                
                if (request.getParameter("password") != null){
                    password = request.getParameter("password");
                }
                
                Login login = new Login();
                result = login.setLogin(first_name, last_name, username, password);
                //timeStamp);
              
                %>
                <form name="Register" action="Register.jsp" method="POST">
                    <table border="1">
                        <tbody>
                            <tr>
                                <td>First Name:</td>
                                <td><input type="text" name="first" value="" /></td>
                            </tr>
                            <tr>
                                <td>Last Name:</td>
                                <td><input type="text" name="last" value="" /></td>
                            </tr>
                            <tr>
                                <td>Username:</td>
                                <td><input type="text" name="username" value="" /></td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td><input type="password" name="password" value="" /></td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" value="Submit" />
                    <input type="reset" value="Clear" />
                </form>
                <form action="Login.jsp">
                <input type="submit" value="Go To Login" />
                </form>
    </body>
</html>

