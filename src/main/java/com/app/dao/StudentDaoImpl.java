package com.app.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.app.model.Student;
import com.app.util.DBConnectionUtility;

public class StudentDaoImpl implements StudentDao {

    @Override
    public void addStudent(Student student) {
        String query = "INSERT INTO student (firstName, lastName, course, year) VALUES (?, ?, ?, ?)";
        
        try (Connection conn = DBConnectionUtility.getDBConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            
            preparedStatement.setString(1, student.getFirstName());
            preparedStatement.setString(2, student.getLastName());
            preparedStatement.setString(3, student.getCourse());
            preparedStatement.setInt(4, student.getYear());
            
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Consider adding more specific exception handling or logging
        }
    }

    @Override
    public void deleteStudent(int studentId) {
        String query = "DELETE FROM student WHERE studentId = ?";
        
        try (Connection conn = DBConnectionUtility.getDBConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            
            preparedStatement.setInt(1, studentId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void updateStudent(Student student) {
        String query = "UPDATE student SET firstName = ?, lastName = ?, course = ?, year = ? WHERE studentId = ?";
        
        try (Connection conn = DBConnectionUtility.getDBConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            
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
        String query = "SELECT * FROM student";
        
        try (Connection conn = DBConnectionUtility.getDBConnection();
             Statement statement = conn.createStatement();
             ResultSet resultSet = statement.executeQuery(query)) {
            
            while (resultSet.next()) {
                students.add(mapResultSetToStudent(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    @Override
    public Student getStudentById(int studentId) {
        Student student = null;
        String query = "SELECT * FROM student WHERE studentId = ?";
        
        try (Connection conn = DBConnectionUtility.getDBConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(query)) {
            
            preparedStatement.setInt(1, studentId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    student = mapResultSetToStudent(resultSet);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return student;
    }

    // Helper method to map ResultSet to Student
    private Student mapResultSetToStudent(ResultSet resultSet) throws SQLException {
        Student student = new Student();
        student.setStudentId(resultSet.getInt("studentId"));
        student.setFirstName(resultSet.getString("firstName"));
        student.setLastName(resultSet.getString("lastName"));
        student.setCourse(resultSet.getString("course"));
        student.setYear(resultSet.getInt("year"));
        return student;
    }
	public List<Student> searchStudents(String searchQuery) {
    List<Student> students = new ArrayList<>();
    try (Connection conn = DBConnectionUtility.getDBConnection()) {
        String query = "SELECT * FROM student WHERE firstName LIKE ? OR lastName LIKE ? OR course LIKE ?";
        PreparedStatement preparedStatement = conn.prepareStatement(query);
        String searchPattern = "%" + searchQuery + "%";  // For partial match
        preparedStatement.setString(1, searchPattern);
        preparedStatement.setString(2, searchPattern);
        preparedStatement.setString(3, searchPattern);

        ResultSet resultSet = preparedStatement.executeQuery();
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
}
