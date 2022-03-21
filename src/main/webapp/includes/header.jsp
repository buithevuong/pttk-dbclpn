<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.NhanVien" import="java.util.Map" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Header</title>
</head>
<body>
<%
	NhanVien sv = (NhanVien)session.getAttribute("nhanvien");
	if(sv==null){
		response.sendRedirect("GDDangNhap.jsp.jsp?err=timeout");
	}
%>
	<div class="header">
		<a href="GDChinhQL.jsp"><img id="logo" src="./images/logo.png" width="60px"
			style="float: left"></a>


		<p id="name-web">Phần mềm quản lý bán vé tour du lịch</p>

		<ul class="list-header">
			
			<li><a href="doLogOut.jsp?logout=1" ><button
						id="btnHeader">Đăng xuất</button></a></li>
		</ul>
	</div>
</body>
</html>