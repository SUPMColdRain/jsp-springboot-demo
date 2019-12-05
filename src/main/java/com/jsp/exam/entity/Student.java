package com.jsp.exam.entity;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.sql.Timestamp;
import java.util.Objects;

@Entity
public class Student {
    private int id;
    private String stuName;
    private String sex;
    private int age;
    private int jsp;
    private int math;
    private int c;
    private Timestamp createDate;
    private Timestamp updateDate;

    @Id
    @Column(name = "id", nullable = false)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "stuName", nullable = false, length = 12)
    public String getStuName() {
        return stuName;
    }

    public void setStuName(String stuName) {
        this.stuName = stuName;
    }

    @Basic
    @Column(name = "sex", nullable = false, length = 4)
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Basic
    @Column(name = "age", nullable = false)
    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    @Basic
    @Column(name = "jsp", nullable = false)
    public int getJsp() {
        return jsp;
    }

    public void setJsp(int jsp) {
        this.jsp = jsp;
    }

    @Basic
    @Column(name = "math", nullable = false)
    public int getMath() {
        return math;
    }

    public void setMath(int math) {
        this.math = math;
    }

    @Basic
    @Column(name = "c", nullable = false)
    public int getC() {
        return c;
    }

    public void setC(int c) {
        this.c = c;
    }

    @Basic
    @Column(name = "createDate", nullable = false)
    public Timestamp getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    @Basic
    @Column(name = "updateDate", nullable = false)
    public Timestamp getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Timestamp updateDate) {
        this.updateDate = updateDate;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Student student = (Student) o;
        return id == student.id &&
                age == student.age &&
                jsp == student.jsp &&
                math == student.math &&
                c == student.c &&
                Objects.equals(stuName, student.stuName) &&
                Objects.equals(sex, student.sex) &&
                Objects.equals(createDate, student.createDate) &&
                Objects.equals(updateDate, student.updateDate);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, stuName, sex, age, jsp, math, c, createDate, updateDate);
    }
}
