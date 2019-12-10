package com.jsp.exam.service;

import com.jsp.exam.entity.Student;

import java.util.List;

public interface StudentService {

    void addStudent(Student student);
    void deleteStudent(Integer id);
    void updateStudent(Student student);
    Student findStudentOne(int id);
    List<Student> findStudent(String id);
    List<Student> findAllStudent();
}
