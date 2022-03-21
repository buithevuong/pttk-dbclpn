<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="model.NhanVien" import="java.util.Map"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Giao diện chính quản lý</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
<%
	NhanVien nv = (NhanVien)session.getAttribute("nhanvien");
	if(nv==null){
		response.sendRedirect("GDDangNhap.jsp?err=timeout");
	}
%>
	<jsp:include page="./includes/header.jsp"></jsp:include>
	

<div class="content">
<%
	if(request.getParameter("error")!= null && request.getParameter("error").equals("notfound")){
		%>
		<h4 style="margin-left: 200px ; color : red;">Chức năng chưa có !</h4>
		<%
	}
	%>
<a class="box_pick box1" href="GDChinhQL.jsp?error=notfound">QUẢN LÝ</a>
<a class="box_pick box2" href="GDChonTK.jsp">THỐNG KÊ</a>
 <a class="box_pick box3" href="GDChinhQL.jsp?error=notfound">THANH TOÁN CHO ĐỐI TÁC</a>
</div>

<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="./js/home.js"></script>
</html>