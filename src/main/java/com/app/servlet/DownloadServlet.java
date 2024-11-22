// package com.app.servlet;

// import java.io.File;
// import java.io.FileInputStream;
// import java.io.IOException;
// import java.io.OutputStream;
// import javax.servlet.ServletException;
// import javax.servlet.annotation.WebServlet;
// import javax.servlet.http.HttpServlet;
// import javax.servlet.http.HttpServletRequest;
// import javax.servlet.http.HttpServletResponse;

// @WebServlet("/downloadLog")
// public class DownloadServlet extends HttpServlet {
//     private static final long serialVersionUID = 1L;

//     @Override
//     protected void doGet(HttpServletRequest request, HttpServletResponse response)
//             throws ServletException, IOException {
//         String filePath = getServletContext().getRealPath("/WEB-INF/log.txt");
//         File downloadFile = new File(filePath);

//         if (!downloadFile.exists()) {
//             response.getWriter().write("Log file not found.");
//             return;
//         }

//         response.setContentType("text/plain");
//         response.setHeader("Content-Disposition", "attachment;filename=log.txt");

//         try (FileInputStream inStream = new FileInputStream(downloadFile);
//              OutputStream outStream = response.getOutputStream()) {
//             byte[] buffer = new byte[4096];
//             int bytesRead;
//             while ((bytesRead = inStream.read(buffer)) != -1) {
//                 outStream.write(buffer, 0, bytesRead);
//             }
//         }
//     }
// }
