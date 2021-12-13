<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage=""%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="ecourts_java.*"%>

<% 
    session.invalidate(); 
    response.sendRedirect("home.jsp");
%>