<%@page import="shop.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 등록</title>
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<!-- 외부 스타일 -->
<link rel="stylesheet" href="css/common.css" />
<!-- 내부 스타일 -->
<style>
  a:hover { text-decoration : none; }
</style>
<script>//custno, custname, phone, address, joindate, grade, city
window.onload = function(){
	let formEl = document.getElementsByTagName('form')[0];
	console.log( formEl );
	formEl.onsubmit = function(event){

		let custnameEl = document.querySelector('[name=custname]');
		let phoneEl    = document.querySelector('[name=phone]');
		let addressEl  = document.querySelector('[name=address]');
		let joindateEl = document.querySelector('[name=joindate]');
		let gradeEl    = document.querySelector('[name=grade]');
		let cityEl     = document.querySelector('[name=city]');
	
		if ( custnameEl.value.trim() == '' ){
			event.preventDefault();
			event.stopPropagation();
			alert('이름이 없습니다')
		} else {
			if ( phoneEl.value.trim() == '' ){
				event.preventDefault();
				event.stopPropagation();
				alert('전화번호가 없습니다')
			} else {
				if ( addressEl.value.trim() == '' ){
					event.preventDefault();
					event.stopPropagation();
					alert('주소가 없습니다')
				} else{
					  var regex = RegExp(/^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/);
	                  if ( !regex.test(joindateEl.value.trim()) ) {
	                     event.preventDefault();
	                     event.stopPropagation();

						alert('날짜 형식이 틀립니다(2023-01-15)')
					} else{
						if ( gradeEl.value.trim() == '' ){
							event.preventDefault();
							event.stopPropagation();
							alert('등급이 선택되지 않았습니다')
						} else{
							if ( cityEl.value.trim() == '' ){
								event.preventDefault();
								event.stopPropagation();
								alert('거주코드가 입력되지 않았습니다')
							}
						}
					}
				}
			}
		}
	}// onsubmit
}

</script>


</head>
<body>
  <!-- 제목 @: directive (지시자) 컴파일러에게 알려주는 명령 -->
  <%@ include file="include/header.jsp" %>

  <!-- 본문 -->
  <div class="container">
    <div class="content">
      <h2>홈쇼핑 회원 등록</h2>
      <!-- 입력받은 정보를 서버로 전송한다 -->
      <form action="action.jsp" method="GET"> 
      <table>
        <tr>
         <td>회원번호(자동발생)</td>
         <td><input type="text" name="custno" value="" /></td>
        </tr>
        <tr>
         <td>회원성명</td>
         <td><input type="text" name="custname" value="윈터" /></td>
        </tr>
        <tr>
         <td>회원전화</td>
         <td>
         <input type="text" name="phone" maxlength= "13" value="010-1111-1111" />
         <input class="btn btn-primary" type="button" value="중복확인" id="dupCheck" />
         </td>
        </tr>
        <tr>
         <td>회원주소</td>
         <td><input type="text" name="address" value="서울 인사동" /></td>
        </tr>
        <tr>
         <td>가입일자</td>
         <td><input type="text" name="joindate" value="2023-01-01" /></td>
        </tr>
        <tr>
         <td>고객등급(A:VIP, B:일반, C:직원)</td>
         <td>
            <select name="grade">
              <option value="">선택하세요</option>
              <option value="A">VIP</option>
              <option value="B">일반</option>
              <option value="C">직원</option>
            </select>
         </td>
        </tr>
        <tr>
         <td>도시코드</td>
         <td><input type="text" name="city" value="01" /></td>
        </tr>
        <tr>
         <td colspan="2">
         <input class="btn btn-primary" type="submit" value="등록">
         <input class="btn btn-primary" type="submit" value="조회" />
         </td>
        </tr>
      </table>
      </form>
    </div>
  </div>

  <!-- 바닥글 -->
  <%@ include file="include/bottom.jsp" %>

</body>
</html>