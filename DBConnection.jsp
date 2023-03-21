<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    // import  ctrl + shift + m
    String driver = "oracle.jdbc.OracleDriver";
    String dburl  = "jdbc:oracle:thin:@localhost:1521:xe";
    String dbuid  = "jsp";
    String dbpwd  = "1234";
    
    Class.forName(driver);
    Connection   conn = DriverManager.getConnection(dburl, dbuid, dbpwd);
    PreparedStatement pstmt= null;
    
    String          sql = "";
    out.print("Databse 접속에 성공하였습니다");
%>