<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.appspot.tserv282520.HelloAppEngine" %>

<%@ page import="java.net.Socket" %>
<%@ page import="java.net.ServerSocket" %>
<%@ page import="java.io.*" %>
<html>
<head>
  <link href='//fonts.googleapis.com/css?family=Marmelad' rel='stylesheet' type='text/css'>
  <title>Hello App Engine Standard Java 8</title>

</head>
<body>
   <%
     Socket clientSocket; //сокет для общения
     ServerSocket server = null; // серверсокет
     BufferedReader in = null; // поток чтения из сокета
     BufferedWriter outt = null; // поток записи в сокет

     try {
       try {
         server = new ServerSocket(8080);
         clientSocket = server.accept();
         try {
           in = new BufferedReader(new InputStreamReader(clientSocket.getInputStream()));
           outt = new BufferedWriter(new OutputStreamWriter(clientSocket.getOutputStream()));
           String word = in.readLine();

           outt.write("Привет, это Сервер! Подтверждаю, вы написали : " + word + "\n");
           outt.flush();

         } finally {
           clientSocket.close();
           in.close();
           outt.close();
         }
       } finally {
         //server.close();
       }
     } catch (IOException e) {
       //8===D
     }
           %>
    <h1>Hello App Engine -- Java 8!</h1>

  <p>This is <%= HelloAppEngine.getInfo() %>.</p>
  <table>
    <tr>
      <td colspan="2" style="font-weight:bold;">Available Servlets:</td>
    </tr>
    <tr>
      <td><a href='/hello'>Hello App Engine</a></td>
    </tr>
  </table>

</body>
</html>
