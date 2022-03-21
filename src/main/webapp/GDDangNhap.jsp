<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
<%
	if(request.getParameter("err") !=null && request.getParameter("err").equalsIgnoreCase("timeout")){
	%>
	 <h4>Hết phiên làm việc. Làm ơn đăng nhập lại!</h4><%
	 
	}else if(request.getParameter("err") !=null && request.getParameter("err").equalsIgnoreCase("fail")){
	%> 
	<h4 style="color : red">Sai tên đăng nhập hoặc mật khẩu!</h4><%
	}
%>
<h2>Hệ thống quản lý đặt vé tour du lịch</h2>
<h2> Đăng nhập </h2>

 <form class="modal-content animate" action="doDangNhap.jsp" method="post">

    <div class="container">
      <label for="username"><b>Tên đăng nhập</b></label>
      <input type="text" placeholder="Nhập tên đăng nhập" name="username" required>

      <label for="password"><b>Mật khẩu</b></label>
      <input type="password" placeholder="Nhập mật khẩu" name="password" required>
        
      <button type="submit">Đăng nhập</button>
    
    </div>
	
  </form>

</body>
</html>