<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="ecourts_java.*"%>
<%@ page errorPage="error.jsp"%>


<% 
    session.invalidate(); 
    response.sendRedirect("home.jsp");
%>