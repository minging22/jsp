） 회원정보 명세서 （테이2 명 : member_tbl_02））
1） 데이터 입출력 요건에 맞게 회원정보.회원매출정보 테이블을 생성하시오.
순서 칼럼 ID  칼럼명    형태     길이  NULL     비고
1    custno   회원번호  number   6     NOT NULL Primary Key
2    custname 회원성명  varchar2 20
3    phone    회원전화  varchar2 13 
4    address  주소      varchar2 60
5    joindate 가입일자  date
6    grade    고객등급  char 1
7    city     거주도시  char 2

［회원정보 샘플 데이터］
회원번호 고객성명 연락처        주소                   가입일자 고객등급 도시코드
100001   김행복   010-1111-2222 서울 동대문구 휘경1동  20151202  A       01
100002   이축복   010-1111-3333 서울 동대문구 유경2동  20151206  B       01
100003   장믿음   010-1111-4444 울릉구 울릉읍 독도1리  20151001  8       30
100004   최사랑   010-1111-5555 울릉구 울릉읍 독도2리  20151113  A       30 
100005   진평화   010-1111-6666 제주도 제주시 외나무골 20151225  B       60
100006   차공단   010-1111-7777 제주도 제주시 감나무골 20151211  C       60
