package com.jsp.exam.service;

import com.jsp.exam.entity.Student;

import java.util.List;

public interface StudentService {

    public void addStudent(Student student);
    public void deleteStudent(Integer id);
    public void updateStudent(Student student);
    public Student findStudent(Integer id);
    public List<Student> findAllStudent();
}
