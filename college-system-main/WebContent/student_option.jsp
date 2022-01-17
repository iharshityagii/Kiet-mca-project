<%@page import="college_system.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page import="database.Database"%>
<%@page import="college_system.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
response.setHeader("Pragma", "no-cache"); //http1.0
response.setHeader("Expires", "0"); //proxies
%>
<%Student stu = (Student)session.getAttribute("sdetail");
if(stu!=null){%>
welcome <%=stu.getName() %>!
<%}
else
	response.sendRedirect("student_login.jsp");
 %>
 <%
 Database db = (Database)application.getAttribute("dob");
 ArrayList<Exam> lx = db.getOnlineExamLinks(stu.getDeptid());
 %>
 <table>
 <tr>
 <th>Exam NAME</th>
 <th>No. Question</th>
 <th>Time Duration</th>
 </tr>
 <%for(Exam e:lx){ %>
 	<tr>
 	<td><a href="exam_instruction.jsp?eid=<%= e.getExamid()%>"><%=e.getExamName() %></a></td>
 	<td><%=e.getNoOfQues() %>
 	<td><%=e.getDtime() %><td>
 	<tr>
 <% } %>
 </table> 
<form action="Student_logout">
<button type="submit">Logout</button>
</form>
</body>
</html>