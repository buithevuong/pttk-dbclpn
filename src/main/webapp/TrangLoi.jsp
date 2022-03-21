<%@ page isErrorPage = "true" %>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
   <head>
      <title>Đã xảy ra lỗi</title>
   </head>
   
   <body>
      <h1>Ồ...</h1>
      <p>Xin lỗi , đã xẩy ra lỗi !!!</p>
      <pre><%= exception.getMessage() %></pre>
   </body>
</html>