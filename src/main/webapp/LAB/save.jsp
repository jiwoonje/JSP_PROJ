<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSP에서 java.sql 패키지의 하위 모든 클래스를 import
			java.util 패키지의 하위 모든 클래스를 import
-->
<%@ page import = "java.sql.* , java.util.*" %>

<!-- 클라이언트에서 넘어오는 한글이 깨지지 않게 처리 -->
<% request.setCharacterEncoding("UTF-8"); %>

<!-- 클라이언트에서 넘어오는 값을 받아서 출력 : request 객체 -->
<%
	// http://localhost:8181/JSP_PROJ02/guestboard/save.jsp?name=gildong&email=aaa%40aaa.com&subject=aa&contents=i+like+an+apple
	// 파라미터 : ?변수명=값&변수명=값&변수명=값
	// 파라미터로 넘어온 값은 모두 String
	
	String na = request.getParameter("name");
	String age = request.getParameter("age");
	String wei = request.getParameter("weight");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

%>

<!-- DB Connection 객체를 import -->
<%@ include file ="../db_conn/db_conn_oracle.jsp" %>

<!-- Statement 객체를 사용해서 DB에 저장함 -->
<%
	//client 에서 받은 값을 DB에 저장함
	String sql = null;			// sql <== SQL 쿼리를 저장하는 변수
	Statement stmt = null;		// stmt <== SQL 쿼리를 담아서 DB에 적용하는 객체
	
	sql = "insert into mem (name, age, weight, addr, phone)";
	sql = sql + " values('" + na + "', '" + age + "', '" + wei + "', '" + addr + "', '" + phone + "')" ;
	
	out.println (sql);
	
	// Statement 객체를 활성화 : Connection 객체로 Statement 객체를 생성함
	stmt = conn.createStatement();
	
	// stmt를 사용해서 DB에 값을 insert
	try {
		// DB에 값을 넣을 때 오류가 발생되더라도 전체 프로그램이 중지되지 않도록 설정
		stmt.execute(sql);
		
	}catch (Exception e) {
		
		e.printStackTrace();
		out.println("DB 저장에 실패 했습니다.");
		
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><p><p>
	<!-- 변수에 담긴 값을 출력 -->
	<h2> 넘어오는 변수 값 출력 </h2>
	<%= na %><br>
	<%= age %><br>
	<%= wei %><br>
	<%= addr %><br>
	<%= phone %><br>
	<h1> Statement </h1>
</body>
</html>