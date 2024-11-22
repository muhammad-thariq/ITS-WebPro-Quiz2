package com.app.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.dao.StudentDao;
import com.app.dao.StudentDaoImpl;
import com.app.model.Student;

@WebServlet("/StudentServlet.do")
public class StudentServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    public static final String lIST_STUDENT = "/listStudents.jsp";
    public static final String INSERT_OR_EDIT = "/student.jsp";
    private StudentDao dao = new StudentDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String forward = "";
        String action = request.getParameter("action");

        if (action == null) {
            action = ""; // Set default action to avoid NullPointerException
        }

        if (action.equalsIgnoreCase("delete")) {
            forward = lIST_STUDENT;
            try {
                int studentId = Integer.parseInt(request.getParameter("studentId"));
                dao.deleteStudent(studentId);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
            request.setAttribute("students", dao.getAllStudents());
        } else if (action.equalsIgnoreCase("edit")) {
            forward = INSERT_OR_EDIT;
            try {
                int studentId = Integer.parseInt(request.getParameter("studentId"));
                Student student = dao.getStudentById(studentId);
                request.setAttribute("student", student);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        } else if (action.equalsIgnoreCase("insert")) {
            forward = INSERT_OR_EDIT;
        } else {
            forward = lIST_STUDENT;
            request.setAttribute("students", dao.getAllStudents());
        }
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String course = request.getParameter("course");
        String yearStr = request.getParameter("year");
        String studentId = request.getParameter("studentId");

        if (firstName == null || lastName == null || course == null || yearStr == null || studentId == null) {
            // Log error if parameters are missing
            System.out.println("Error: Missing required form data.");
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page
            return;
        }

        Student student = new Student();
        student.setFirstName(firstName);
        student.setLastName(lastName);
        student.setCourse(course);
        
        try {
            student.setYear(Integer.parseInt(yearStr));
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("errorPage.jsp"); // Redirect to an error page for invalid input
            return;
        }

        if (studentId == null || studentId.isEmpty()) {
            dao.addStudent(student);
        } else {
            try {
                student.setStudentId(Integer.parseInt(studentId));
                dao.updateStudent(student);
            } catch (NumberFormatException e) {
                e.printStackTrace();
                response.sendRedirect("errorPage.jsp");
                return;
            }
        }

        RequestDispatcher view = request.getRequestDispatcher(lIST_STUDENT);
        request.setAttribute("students", dao.getAllStudents());
        view.forward(request, response);
    }
}
