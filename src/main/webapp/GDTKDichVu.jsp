<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  import="java.util.*" import="dao.ThongKeDichVuDoiTacDAO" import="model.ThongKeDichVuDoiTac" 
	import="model.NhanVien" 
	import="java.text.SimpleDateFormat" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thống kê dịch vụ của đối tác</title>
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

String start ;
String finish ;
Long idDoiTac;

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

if(request.getParameter("idDoiTac")== null) idDoiTac = 0L;
else idDoiTac = Long.valueOf(request.getParameter("idDoiTac"));
if(request.getParameter("start")== null) start = sdf.format(new Date()) ;
else start = String.valueOf(request.getParameter("start"));
if(request.getParameter("finish")== null) finish = sdf.format(new Date());
else finish = String.valueOf(request.getParameter("finish"));
	
ThongKeDichVuDoiTacDAO tkdvdtDAO = new ThongKeDichVuDoiTacDAO();
List<ThongKeDichVuDoiTac> listDv = tkdvdtDAO.getThongKeDichVuDoiTac(idDoiTac,start, finish);


%>

	<jsp:include page="./includes/header.jsp"></jsp:include>
	<jsp:include page="./includes/menu.jsp"></jsp:include>

<div class="content">

 
 <div class="pick-date">
 <div class="pick-item">
 
 <span>Thống kê</span> > <span>Dịch Vụ Đối Tác</span>
 
 <a href="GDTKDoiTac.jsp?start=<%=start%>&finish=<%=finish %>">BACK</a>
 </div>
 </div>

 
 <table id="tbl-doitac">
  <tr>
    <th>Mã</th>
    <th>Dịch vụ</th>
    <th>Tổng số lượt dùng</th>
    <th>Tổng chi phí (VNĐ)</th>
  </tr>
    <% if(listDv != null){
	  for(ThongKeDichVuDoiTac tkDvdt : listDv){ %>
 
  <tr 
  	onclick="toHoaDonDv(<%=tkDvdt.getId()%>,<%=idDoiTac%>,'<%=start%>','<%=finish%>')">
  <td><%=tkDvdt.getId() %></td>
  <td><%=tkDvdt.getDichvu().getTen() %></td>
   <td><%=tkDvdt.getTongLuotDung() %></td>
    <td><%=tkDvdt.getTongChiPhi() %></td>
  </tr>
   <% 	}
	  }%>
</table>
 
 <div class="end"></div>
</div>

<jsp:include page="./includes/footer.jsp"></jsp:include>
</body>
<script type="text/javascript" src="./js/home.js"></script>
</html>