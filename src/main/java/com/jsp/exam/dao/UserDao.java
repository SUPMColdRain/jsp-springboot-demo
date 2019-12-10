package com.jsp.exam.dao;

import com.jsp.exam.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;

/**
 * 复杂的接口需要自己添加
 */

public interface UserDao extends JpaRepository<User, Integer> {

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "INSERT INTO user (id, userPwd) VALUES (?1, ?2)" , nativeQuery = true)
    void add(int id, String userPwd);
}
