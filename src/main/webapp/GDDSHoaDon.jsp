<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*" import="dao.DichVuSuDungDAO" import="model.DichVuSuDung" 
	import="model.NhanVien" 
	import="java.text.SimpleDateFormat" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Danh sách hóa đơn dịch vụ</title>
<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<%
NhanVien nv = (NhanVien)session.getAttribute("nhanvien");
	if(nv==null){
		response.sendRedirect("GDDangNhap.jsp?err=timeout");
	}
%>
<%
String start ;
String finish ;
Long idDichVu, idDoiTac;
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

if(request.getParameter("idDichVu")==null) idDichVu=0L;
else idDichVu = Long.valueOf(request.getParameter("idDichVu"));

if(request.getParameter("idDoiTac")==null) idDoiTac=0L;
else idDoiTac = Long.valueOf(request.getParameter("idDoiTac"));

if(request.getParameter("start")==null) start = sdf.format(new Date());
else start = String.valueOf(request.getParameter("start"));

if(request.getParameter("finish")==null) finish = sdf.format(new Date());
else finish = String.valueOf(request.getParameter("finish"));

DichVuSuDungDAO hdDAO = new DichVuSuDungDAO();
List<DichVuSuDung> dsHd = hdDAO.getDSDichVuSuDung(idDichVu,start, finish);
%>

<body>
	<jsp:include page="./includes/header.jsp"></jsp:include>
	<jsp:include page="./includes/menu.jsp"></jsp:include>

<div class="content">

 
 <div class="pick-date">
 <div class="pick-item">
 <span>Thống kê</span> > <span>Hóa Đơn Dv</span>
 <a href="GDTKDichVu.jsp?idDoiTac=<%=idDoiTac %>&start=<%=start%>&finish=<%=finish %>">BACK</a>
 </div>
 	
 </div>

 
 <table id="tbl-doitac">
  <tr>
    <th>Mã</th>
    <th>Tên Dịch Vụ</th>
    <th>Đơn giá(VNĐ)</th>
    <th>Thành Tiền(VNĐ)</th>
    <th>Ngày sử dụng</th>
  </tr>
  
  <%
			if (dsHd != null) {
				for (DichVuSuDung hddv : dsHd) {
			%>
			<tr
				>
				<td><%=hddv.getDichvudoitac().getId() %></td>
				<td><%=hddv.getDichvudoitac().getDichvu().getTen() %></td>
				<td><%=hddv.getDongia() %></td>
				<td><%=hddv.getThanhtien() %></td>
				<td><%=hddv.getNgaybatdau() %></td>
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