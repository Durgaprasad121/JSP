<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Deposit_jsp</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href='css/withdraw_jsp.css'>
    <script src='main.js'></script>
</head>
<body>
    <div class="center">
		<form action="home.html" >
			<h2>
        <%@page import="java.sql.*" %>
        <%
        try {
            int bal;
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Ri#@9652");
			String acc=request.getParameter("account_num");
			int amt=Integer.parseInt(request.getParameter("amount"));
			PreparedStatement ps=con.prepareStatement("select account_number from customer where account_number like ?");
			ps.setString(1,acc);
			ResultSet rs=ps.executeQuery();
			if(!(rs.next())) {
				out.println("invalid account number");
			} else {
				ps=con.prepareStatement("select balance from customer where account_number like ?");
				ps.setString(1,acc);
				rs=ps.executeQuery();
				rs.next();
				bal=rs.getInt(1);
					bal+=amt;
					ps=con.prepareStatement("update customer set balance=? where account_number like ?");
					ps.setInt(1,bal);
					ps.setString(2,acc);
					ps.executeUpdate();
					out.println("successfully completed");
					PreparedStatement ps_tran=con.prepareStatement("insert into transaction values(?,?,?,?,?)");
					ps=con.prepareStatement("select now()");
					rs=ps.executeQuery();
					rs.next();
					String date_time=rs.getString(1);
					ps_tran.setString(1,acc);
					ps_tran.setString(2,date_time);
					ps_tran.setString(3,"deposit");
					ps_tran.setInt(4,amt);
					ps_tran.setInt(5,bal);
					ps_tran.executeUpdate();
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