<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="model.NhanVien" import="dao.NhanVienDAO" %>
<%

if(request.getParameter("logout") != null && request.getParameter("logout").equals("1")){
	
	session.removeAttribute("nhanvien");
	response.sendRedirect("GDDangNhap.jsp");
}

%>