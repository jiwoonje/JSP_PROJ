<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%
	Connection conn = null;
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mydb";
	
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(url, "root", "1234");
		
		out.println("성공적으로 접속 되었습니다. - MySQL <br>");
		
	}catch (Exception e) {
		
		out.println("접속 실패 했습니다. - MySQL <br>");
		e.printStackTrace();
		
	}
	
//	out.println ("<br><br>")
//	out.println ("프로그램이 정상 작동됩니다. ")
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>