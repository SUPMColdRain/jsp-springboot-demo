package com.jsp.exam.dao;

import com.jsp.exam.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;

/**
 * 复杂的接口需要自己添加
 */
@Repository
public interface StudentDao extends JpaRepository<Student, Integer> {

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "INSERT INTO student (stuName, sex, age, jsp, math, c) VALUES (?1,?2,?3,?4,?5,?6)" , nativeQuery = true)
    void add(String stuName, String sex, int age, int jsp, int math, int c);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE student s SET s.stuName=?1, s.sex=?2, s.age=?3, s.jsp=?4, s.math=?5, s.c=?6 WHERE s.id=?7", nativeQuery = true)
    void update(String stuName, String sex, int age, int jsp, int math, int c, int id);
}
