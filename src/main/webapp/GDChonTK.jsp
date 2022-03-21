<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.NhanVien" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chọn Thống Kê</title>
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
 <a class="box_pick box4" href="GDTKDoiTac.jsp">THỐNG KÊ ĐỐI TÁC</a>
 <a class="box_pick box5" href="GDChonTK.jsp?error=notfound">THỐNG KÊ TOUR</a>
 <a class="box_pick box6" href="GDChonTK.jsp?error=notfound">THỐNG KÊ ĐỊA ĐIỂM</a>
 <a class="box_pick box7" href="GDChonTK.jsp?error=notfound">THỐNG KÊ DỊCH VỤ</a>
</div>

<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="./js/home.js"></script>
</html>