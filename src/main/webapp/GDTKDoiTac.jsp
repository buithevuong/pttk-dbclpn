<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*" import="dao.ThongKeDoiTacDAO"
	import="model.ThongKeDoiTac"
	import="model.NhanVien" 
	import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage = "TrangLoi.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thống kê đối tác</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>

<body>
<%
	NhanVien nv = (NhanVien)session.getAttribute("nhanvien");
	if(nv==null){
		response.sendRedirect("GDDangNhap.jsp?err=timeout");
	}
%>
	<%
	
	String start;
	String finish;
	String errorMsg = null;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Date now = new Date();
	Calendar cal = Calendar.getInstance();
	cal.setTime(now);
	cal.add(Calendar.DATE, -30);
	
	if (request.getParameter("start") == null){
		start = sdf.format(cal.getTime());
		
	}else start = String.valueOf(request.getParameter("start"));

	if(request.getParameter("finish") == null){
		finish = sdf.format(new Date());
	}else finish = String.valueOf(request.getParameter("finish"));
	
	ThongKeDoiTacDAO tkdtDAO = new ThongKeDoiTacDAO();
	List<ThongKeDoiTac> tkdt = new ArrayList<>();
	try{
		tkdt = tkdtDAO.getTKDoiTac(start, finish);
	}catch(Exception e) {
		errorMsg = e.getMessage();
	}
	
	if(errorMsg != null){
		%>
		<script>alert('<%=errorMsg%>');</script>
		<%
	}
	%>


	<jsp:include page="./includes/header.jsp"></jsp:include>

	<div class="content">


		<div class="pick-date">
			<div class="pick-item">
				<span>Thống kê</span> > <span>Đối tác</span>
				<a href="GDChonTK.jsp">BACK</a>
			</div>
			<form class="pick-item" action="GDTKDoiTac.jsp" method="get">

				<div class="pick-item">
					Ngày bắt đầu <input type="date" name="start" value="<%=start%>">
				</div>


				<div class="pick-item">
					Ngày kết thúc <input type="date" name="finish" value="<%=finish%>">

				</div>
				<input type="hidden" name="page" value="0"> <input
					type="hidden" name="size" value="10">
				<button type="submit" class="pick-item">Thống kê</button>

			</form>


		</div>


		<table id="tbl-doitac">
			<tr>
				<th>Mã</th>
				<th>Đối tác</th>
				<th>Email</th>
				<th>Số Điện Thoại</th>
				<th>Tổng chi (VNĐ)</th>
			</tr>

			<%
			if (tkdt != null) {
				for (ThongKeDoiTac tkDoitac : tkdt) {
			%>


			<tr
				onclick="toDichVuDoiTac(<%=tkDoitac.getId()%>,'<%=start%>','<%=finish%>')">
				<td><%=tkDoitac.getId()%></td>
				<td><%=tkDoitac.getTen()%></td>
				<td><%=tkDoitac.getEmail()%></td>
				<td><%=tkDoitac.getSodienthoai()%></td>
				<td><%=tkDoitac.getTongdoanhthu()%></td>
			</tr>
			<%
			}
			}
			%>
		</table>

		<div class="end"></div>
	</div>
	
	<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="./js/home.js"></script>
</html>