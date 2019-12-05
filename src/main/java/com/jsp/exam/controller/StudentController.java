package com.jsp.exam.controller;

import com.jsp.exam.entity.Student;
import com.jsp.exam.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
//@Controller
@RequestMapping("/api/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/list")
    public List<Student> findAllStudent() {
        return studentService.findAllStudent();
    }

    @GetMapping("/query/{id}")
    public Student findStudentRestful(@PathVariable("id") Integer id) {
        return studentService.findStudent(id);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteStudentRestful(@PathVariable("id") Integer id) {
        studentService.deleteStudent(id);
    }

    @PostMapping("/add")
    public void addStudentRestful(Student student) {
        studentService.addStudent(student);
    }

    @PutMapping("/update")
    public void updateStudentRestful(Student student) {
        studentService.updateStudent(student);
    }
}
