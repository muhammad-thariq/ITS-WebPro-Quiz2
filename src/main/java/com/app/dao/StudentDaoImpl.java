package com.app.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.app.model.Student;
import com.app.util.DBConnectionUtility;

public class StudentDaoImpl implements StudentDao {

    @Override
    public void addStudent(Student student) {
        if (student == null) {
            System.out.println("Student object is null in addStudent()");
            return;
        }
        
        try (Connection conn = DBConnectionUtility.getDBConnection()) {
            if (conn == null) {
                System.out.println("Connection is null in addStudent()");
                return;
            }
            
            String query = "INSERT INTO student (firstName, lastName, course, year) VALUES (?,?,?,?)";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, student.getFirstName());
            preparedStatement.setString(2, student.getLastName());
            preparedStatement.setString(3, student.getCourse());
            preparedStatement.setInt(4, student.getYear());
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteStudent(int studentId) {
        try (Connection conn = DBConnectionUtility.getDBConnection()) {
            if (conn == null) {
                System.out.println("Connection is null in deleteStudent()");
                return;
            }
            
            String query = "DELETE FROM student WHERE studentId=?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, studentId);
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateStudent(Student student) {
        if (student == null) {
            System.out.println("Student object is null in updateStudent()");
            return;
        }

        try (Connection conn = DBConnectionUtility.getDBConnection()) {
            if (conn == null) {
                System.out.println("Connection is null in updateStudent()");
                return;
            }
            
            String query = "UPDATE student SET firstName=?, lastName=?, course=?, year=? WHERE studentId=?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setString(1, student.getFirstName());
            preparedStatement.setString(2, student.getLastName());
            preparedStatement.setString(3, student.getCourse());
            preparedStatement.setInt(4, student.getYear());
            preparedStatement.setInt(5, student.getStudentId());
            preparedStatement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        try (Connection conn = DBConnectionUtility.getDBConnection()) {
            if (conn == null) {
                System.out.println("Connection is null in getAllStudents()");
                return students;
            }

            Statement statement = conn.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM student");
            while (resultSet.next()) {
                Student student = new Student();
                student.setStudentId(resultSet.getInt("studentId"));
                student.setFirstName(resultSet.getString("firstName"));
                student.setLastName(resultSet.getString("lastName"));
                student.setCourse(resultSet.getString("course"));
                student.setYear(resultSet.getInt("year"));
                students.add(student);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public Student getStudentById(int studentId) {
        Student student = new Student();
        try (Connection conn = DBConnectionUtility.getDBConnection()) {
            if (conn == null) {
                System.out.println("Connection is null in getStudentById()");
                return student;
            }

            String query = "SELECT * FROM student WHERE studentId=?";
            PreparedStatement preparedStatement = conn.prepareStatement(query);
            preparedStatement.setInt(1, studentId);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                student.setStudentId(resultSet.getInt("studentId"));
                student.setFirstName(resultSet.getString("firstName"));
                student.setLastName(resultSet.getString("lastName"));
                student.setCourse(resultSet.getString("course"));
                student.setYear(resultSet.getInt("year"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }
}
