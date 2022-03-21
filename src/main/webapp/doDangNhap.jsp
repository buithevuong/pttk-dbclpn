<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*" import="model.NhanVien" import="dao.NhanVienDAO" %>
<%
String username = (String)request.getParameter("username");
String password = (String)request.getParameter("password");

NhanVienDAO dao = new NhanVienDAO();
NhanVien nv = dao.nhanVienQuanLyDangNhap(username , password);
int timeout = 24*60*60;
if(nv == null){
	response.sendRedirect("GDDangNhap.jsp?err=fail");
}
else if(nv.getChucVu().equalsIgnoreCase("nhanvienketoan")){
	session.setAttribute("nhanvien", nv);
	session.setMaxInactiveInterval(timeout);
	response.sendRedirect("GDChinhQL.jsp");
	
}else if(nv.getChucVu().equalsIgnoreCase("nhanvienbanhang")){
	session.setAttribute("nhanvien", nv);
	session.setMaxInactiveInterval(timeout);
	response.sendRedirect("GDChinhQL.jsp");
	
}else if(nv.getChucVu().equalsIgnoreCase("nhanvienquanly")){
	session.setAttribute("nhanvien", nv);
	session.setMaxInactiveInterval(timeout);
	response.sendRedirect("GDChinhQL.jsp");
}

%>