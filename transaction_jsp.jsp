<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Transaction</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel='stylesheet' type='text/css' media='screen' href="css/transaction_jsp_css.css">
</head>
<body>
    <div class="filter">
        </div>
    <%@page import="java.sql.*" %>
    <table broder="1px">
        <tr>
            <th>Serial_No</th>
            <th>Date And Time</th>
            <th>Status</th>
            <th>Amount</th>
            <th>Balance</th>
        </tr>
        <%
            try {
			    Class.forName("com.mysql.jdbc.Driver");
			    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/bank","root","Ri#@9652");
                String acc_num=request.getParameter("account_num");
                int c=1;
			    PreparedStatement ps=con.prepareStatement("select * from transaction where account_num like ?");
                ps.setString(1,acc_num);
                ResultSet rs=ps.executeQuery();
                while(rs.next()) {
                    out.println("<tr> <td>" +c+ "</td> <td> "  +rs.getString(2)+ " </td> <td> " +rs.getString(3) + " </td> <td> " +rs.getInt(4)+ "  </td> <td> " +rs.getInt(5)+ " </td> </tr>");
                    c++;
                }
			    con.close();
		    }catch(Exception e) {
			    out.println(e);
		    }
        %>
       /* <tfoot><tr><td colspan="5"><a href="home.html">DONE</a></td></tr></tfoot> */
    </table>
    <div>
        <a href="home.html">DONE</a>
    </div>
</body>
</html>