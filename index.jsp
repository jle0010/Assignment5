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
            public class Actor {
                String URL = "jdbc:mysql://cs692.ctdjarc52rre.us-east-1.rds.amazonaws.com:3306/CS692";
                String USERNAME = "Assignment5";
                String PASSWORD = "%1eTbct7i0grtM!U";
                
                Connection connection =null;
                PreparedStatement insertActors =null;
                ResultSet resultSet =null;

                public Actor() {
                
                try {

                    connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                    insertActors = connection.prepareStatement(
                    "INSERT INTO Actor (first_name , last_name, password)"
                    + " VALUES (?, ?, ?)");
                } catch (SQLException e){
                    e.printStackTrace();
                    }
                }
                
                public int setActors (String first, String last, String password){
//,Timestamp timeStamp){

                        int result = 0;
                        
                        try{
                            insertActors.setString(1, first);
                            insertActors.setString(2, last);
                            insertActors.setString(3, password);
                            //insertActors.setTimestamp(3,timeStamp);
                            result = insertActors.executeUpdate();
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
                String password = new String();
                
                if (request.getParameter("first") != null){
                    first_name = request.getParameter("first");
                }
                
                if (request.getParameter("last") != null){
                    last_name = request.getParameter("last");
                }
                
                if (request.getParameter("password") != null){
                    password = request.getParameter("password");
                }
                
                //Date date = new Date();
                //Timestamp timeStamp = new Timestamp(date.getTime());
                
                Actor actor = new Actor();
                result = actor.setActors(first_name, last_name, password);
                //timeStamp);
              
                %>
        <form name="LogIn Data" action="index.jsp" method="POST">
            <table border="0">
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
                        <td>Password:</td>
                        <td><input type="text" name="password" value="" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" />
            <input type="submit" value="Register" />
        </form>
    </body>
</html>
