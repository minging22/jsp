<%@page import="shop.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="shortcut icon" href="images/favicon.ico">
<!-- 외부 스타일 -->
<link rel="stylesheet" href="css/common.css" />
</head>
<body>
  <!-- 제목 @: directive (지시자) 컴파일러에게 알려주는 명령 -->
  <%@ include file="include/header.jsp" %>
 <%
   //oracle data 조회 => html table tag
   // custno, custname, phone, address, joindate, grade, city
   
   sql         += "SELECT CUSTNO, CUSTNAME, PHONE, ADDRESS," ;
   sql         +=  "TO_CHAR(JOINDATE, 'YYYY-MM-DD') joindate, GRADE, CITY";
   sql         += " FROM   MEMBER_TBL";
   sql         += " ORDER BY  CUSTNO ASC";
   pstmt        = conn.prepareStatement(sql);
   ResultSet rs = pstmt.executeQuery();
   
   ArrayList<MemberVo> list = new ArrayList<>();
   
   while(rs.next()){
	   int    custno   = rs.getInt("custno");
	   String custname = rs.getString("custname");
	   String phone    = rs.getString("phone");
	   String address  = rs.getString("address");
	   String joindate = rs.getString("joindate");
	   String grade    = rs.getString("grade");
	   String city     = rs.getString("city");
	   
	   MemberVo  member = new MemberVo(  
			   custno, custname, phone, address, joindate, grade, city);
	   
	   list.add(member);
   }
   rs.close();
   pstmt.close();
   conn.close();
 %>   

  <!-- 본문 -->
  <div class="container">
    <div class="content">
      <h2>홈 쇼핑 회원 목록</h2>
      <table>
        <colgroup>
          <col width="11%">
          <col width="11%">
          <col width="17%">
          <col width="24%">
          <col width="15%">
          <col width="11%">
          <col width="11%">
        </colgroup>
        <thead>
          <tr>
            <th>회원번호</th>
            <th>회원성명</th>
            <th>전화번호</th>
            <th>주소</th>
            <th>가입 일자</th>
            <th>고객등급</th>
            <th>거주지역</th>
          </tr>
        </thead>
        <today>
        <%  for(int i=0; i<list.size();i++){ 
             MemberVo mem = list.get(i);
             String  grade = "";
             switch(mem.getGrade()){
             case "A": grade = "VIP"; break;
             case "B": grade = "일반"; break;
             case "C": grade = "직원"; break;
             }
        %>
           <tr>
             <td><%=mem.getCustno()   %></td>
             <td><a href="http://localhost:9090/WebPrj04/memedit.jsp?custno=<%=mem.getCustno() %>"><%=mem.getCustname() %></a></td>
             <td><%=mem.getPhone()    %></td>
             <td><%=mem.getAddress()  %></td>
             <td><%=mem.getJoindate() %></td>
             <td><%=     grade        %></td>
             <td><%=mem.getCity()     %></td>
           </tr>
        <% } %>
        </today>
        <tfoot></tfoot>
      </table>
    </div>
  </div>

  <!-- 바닥글 -->
  <%@ include file="include/bottom.jsp" %>

</body>
</html>