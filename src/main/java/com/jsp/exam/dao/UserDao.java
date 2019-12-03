package com.jsp.exam.dao;

import com.jsp.exam.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 复杂的接口需要自己添加
 */

public interface UserDao extends JpaRepository<User, Integer> {
}
