package com.jsp.exam.service;

import com.jsp.exam.dao.StudentDao;
import com.jsp.exam.entity.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentDao studentDao;

    @Override
    public void addStudent(Student student) {
        studentDao.save(student);
    }

    @Override
    public void deleteStudent(Integer id) {
        studentDao.deleteById(id);
    }

    @Override
    public void updateStudent(Student student) {
        studentDao.save(student);
    }

    @Override
    public Student findStudent(Integer id) {
        return studentDao.findById(id).get();
    }

    @Override
    public List<Student> findAllStudent() {
        return studentDao.findAll();
    }
}