package com.jsp.exam.dao;

import com.jsp.exam.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * 复杂的接口需要自己添加
 */
@Repository
public interface StudentDao extends JpaRepository<Student, Integer> {
}
