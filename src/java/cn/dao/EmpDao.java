package cn.dao;

import cn.pojo.Emp;

import java.util.List;

public interface EmpDao {
    void register(Emp emp);

    boolean updateEmp(Emp emp);

    boolean deleteEmp(int empid);

    Emp getById(int empid);

    List<Emp> getAll();
}
