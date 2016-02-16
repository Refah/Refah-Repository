<html>
<head>
<%@ page import="java.sql.*" %>
<%-- page import="com.mysql.jdbc.Driver" --%>
<%
// mysql driver
String driver = "com.mysql.jdbc.Driver";
//out.println(driver);
// the "url" to our DB, the last part is the name of the DB
String url = "jdbc:mysql://localhost:3306/";
String name = "root";
String pass = "refah010";
%>
<title>testServlet</title>
</head>
<body>
<p align=center ><font color="green"> Welcome To The World Of Cricket <font></font> </p> 
<%
try
{
// Test the DB connection by making an empty table
String tableStr = "select * from BattingStats.Batsman";


Class.forName("com.mysql.jdbc.Driver").newInstance();

// initialize the Connection, with our DB info ...
String database="BattingStats";
Connection con = DriverManager.getConnection( url+database, name, pass );



Statement stat = con.createStatement();
ResultSet rs= stat.executeQuery( tableStr );





%>

<p align=center > "know about the three best players of test cricket" </p> 
<%
%><table align=center border=5>
<tr>
    <th>Players</th>
    <th>Runs</th>
    <th>Average</th>
 </tr>
 <%
while(rs.next())
{
   String players = rs.getString(1);
   String runs = rs.getString(2);
   String average = rs.getString(3);
   
    %>
    
    <tr>
    <td><%=players%></td>
    <td><%=runs%></td>
    <td><%=average%></td>
    </tr>
   
    <%
   
}
 %>
 </table><%



// close connection
con.close();
}

catch (SQLException sqle)
{ out.println("<p> Error opening JDBC, cause:</p> <b> " + sqle + "</b>"); }

catch(ClassNotFoundException cnfe)
{ out.println("<p> Error opening JDBC, cause:</p> <b>" + cnfe + "</b>"); }

%>
</body>
</html>