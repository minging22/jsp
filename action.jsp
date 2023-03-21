<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@include file="include/DBConnection.jsp" %>  
    
<%
 //넘어온 정보처리 
  //custno
  // 넘어온 한글을 처리하려면 (POST방식에서 피수 선정)
  // get(Get()) 방식에서 server.xml 에 추가 설정
  //server.xml 63 line 에 URIEencoding="UTF-8" 추가port 번호 9090으로 
  // <Connector connectionTimeout="20000" port="9090" protocol="HTTP/1.1" 
  //   redirectPort="8443" URIEncoding="UTF-8"/>
  // 수정하고 저장한 뒤에 tomcat 서버를 재시작하여야 동작한다 
  // -> tomcat 8 에서 별도 설정 필요없음 
  request.setCharacterEncoding("UTF-8");
  
  String   custno   = request.getParameter("custno");
  String   custname = request.getParameter("custname");
  String   phone    = request.getParameter("phone");
  String   address  = request.getParameter("address");
  String   joindate = request.getParameter("joindate");
  String   grade    = request.getParameter("grade");
  String   city     = request.getParameter("city");
  
  //회원가입
  sql  += "INSERT INTO member_tbl ";
  sql  += " (custno, custname, phone, address, joindate, grade, city)";
  sql  += " VALUES ( seq_custno.nextval, ?, ?, ?, ?, ?, ? )";
  pstmt  = conn.prepareStatement(sql);
  pstmt.setString(1, custname);
  pstmt.setString(2, phone);
  pstmt.setString(3, address);
  pstmt.setString(4, joindate);
  pstmt.setString(5, grade);
  pstmt.setString(6, city);
  
  pstmt.executeUpdate();  // 저장

  
  // Home(list.jsp)로 이동 (자바스크립트 location href 로 버튼안누루고이동함
  String url = "http://localhost:9090/WebPrj04/list.jsp";
  response.sendRedirect(url);
  
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