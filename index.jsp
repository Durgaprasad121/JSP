<html>
    <body>
        <%@page import="java.sql.*"%>
        <%
            response.setContentType("text/html");
            String un=request.getParameter("t1");
            String pass=request.getParameter("t2");
            try{
                
                Class.forName("oracle.jdbc.driver.OracleDriver");
                Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","dp","durgaprasad");
			    Statement stmt=con.createStatement();  
                ResultSet rs=stmt.executeQuery("select * from employee"); 
                while(rs.next())
			    {
                    if(un.equals(rs.getString(1)) && pass.equals(rs.getString(5)))
                    {
                        response.sendRedirect("home.html");
                    }
                    else
                    {
                        out.print("login failed try again");
                    }
                }
            }catch(Exception e){
                out.print(e);
            }
         %>
    </body>

</html>

