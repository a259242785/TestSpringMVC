package cn.service.impl;

import cn.dao.EmpDao;
import cn.pojo.Emp;
import cn.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class EmpServiceImpl implements EmpService{
    @Autowired
    private EmpDao ed;

    public EmpDao getEd() {
        return ed;
    }

    public void setEd(EmpDao ed) {
        this.ed = ed;
    }

    @Override
    public void register(Emp emp) {
        ed.register(emp);
    }

    @Override
    public boolean updateEmp(Emp emp) {
        return ed.updateEmp(emp);
    }

    @Override
    public boolean deleteEmp(int empid) {
        return ed.deleteEmp(empid);
    }

    @Override
    public Emp getById(int empid) {
        Emp e = ed.getById(empid);
        return e;
    }

    @Override
    public List<Emp> getAll() {
        List<Emp> elist = ed.getAll();
        return elist;
    }
}
