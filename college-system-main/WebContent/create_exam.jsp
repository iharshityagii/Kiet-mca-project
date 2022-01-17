<%@page import="college_system.Teacher"%>
<%@page import="java.util.Map"%>
<%@page import="database.Database"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1.1
response.setHeader("Pragma", "no-cache"); //http1.0
response.setHeader("Expires", "0"); //proxies %>
<%Database db = (Database)application.getAttribute("dob");
Map<Integer,String> m = db.getDepartment();
%>
<%
 Teacher te = (Teacher)session.getAttribute("tdetail");
if(te == null){ 
	response.sendRedirect("teacher_login.jsp");
}

%>
<form action="Create_exam">
<label>Exam name: </label>
<input type="text" name="examName"><br><br>
<label>Date</label>
<input type="date" name="date"><br><br>
<label>Start Time:</label>
<input type="time" name="time"><br><br>
<label>Exam Duration time</label>
<input type="number" name="dtime"><br><br>
<label>Department</label>
<select name="deptid"><% for(Map.Entry<Integer,String> mp: m.entrySet())
	{%>
		 <option value="<%=mp.getKey() %>"><%=mp.getValue() %></option>
	<% }%>
	
</select><br><br>
<label>No. of question</label>
<input type="number" name="noOfQues"><br><br>
<label>Positive marking:</label>
<input type="number" name="pmarks"><br><br>
<label>Negative marking:</label>
<input type="number" name="nmarks"><br><br>
<button type="submit">submit</button><br><br>
</form>
</body>
</html>