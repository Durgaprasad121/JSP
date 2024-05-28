<html>
    <head>
        <link rel="stylesheet" href="css/withdraw_jsp.css"
    </head>
    <body>
        <div class="center">
		<form action="home.html" >
			<h2>
        <%@page import="java.sql.*" %>
        <%
        try {
            int bal;
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1522:xe","dp","durgaprasad");
			String acc1=request.getParameter("acc");
			PreparedStatement ps=con.prepareStatement("select acc from customer where acc like ?");
			ps.setString(1,acc1);
			ResultSet rs=ps.executeQuery();
			if(!(rs.next())) {
				out.println("invalid account number");
			} else {
				ps=con.prepareStatement("delete from customer where account_number like ?");
                ps.setString(1,acc1);
                ps.executeUpdate();
				ps=con.prepareStatement("delete from transaction where account_num like ?");
                ps.setString(1,acc1);
                ps.executeUpdate();
                out.print("successfully deleted");
			}
			con.close();
		}catch(Exception e) {
			out.print(e);
		}
        %>
			</h2>
			<input type="submit" value="DONE">
	</form>
        </div>
    </body>
</html>