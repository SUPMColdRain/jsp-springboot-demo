package com.jsp.exam.service;

import com.jsp.exam.entity.Student;

import java.util.List;

public interface StudentService {

    void addStudent(Student student);
    void deleteStudent(Integer id);
    void updateStudent(Student student);
    Student findStudent(Integer id);
    List<Student> findAllStudent();
}
