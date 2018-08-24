package cn.controller;

import cn.pojo.Emp;
import cn.service.EmpService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/emp")
public class EmpController {
    @Autowired
    private EmpService es;

    public EmpService getEs() {
        return es;
    }

    public void setEs(EmpService es) {
        this.es = es;
    }



    @RequestMapping("empPage")
    public String getPages(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model){
        PageHelper.startPage(pn,3);
        List<Emp> emp = es.getAll();
        PageInfo page = new PageInfo(emp,5);
        model.addAttribute("pageInfo",page);
        return "allEmp";
    }
    /**
     *跳转到添加用户页面
     */
    @RequestMapping("toAddEmp")
    public String toAddEmp(){
        return "addEmp";
    }

    /**
     * 添加用户重定向
     * @param model
     * @param emp
     * @return
     */
    @RequestMapping("addEmp")
    public String addEmp(Model model,Emp emp){
        if(emp != null){
            es.register(emp);
        }
        return "redirect:/emp/empPage";
    }

    /**
     * 修改用户
     * @param model
     * @param emp
     * @return
     */
    @RequestMapping("updateEmp")
    public String updateEmp(Model model,Emp emp){
        if(es.updateEmp(emp)){
            emp = es.getById(emp.getEmpid());
            model.addAttribute("emp",emp);
            return "redirect:/emp/empPage";
        }
        return "/error";
    }

    /**
     * 查询所有用户
     * @param model
     * @return
     */
    @RequestMapping("getAll")
    public String getAll(Model model){
        List<Emp> elist = es.getAll();
        model.addAttribute("empall",elist);
        return "allEmp";
    }

    /**
     * 根据ID查询一条信息
     * @param model
     * @param empid
     * @return
     */
    @RequestMapping("/getEmp")
    public String getEmp(Model model,int empid){
        model.addAttribute("emp",es.getById(empid));
        return "ediEmp";
    }

    /**
     *根据ID删除用户
     * @param model
     * @param empid
     * @return
     */
    @RequestMapping("/delEmp")
    public String delEmp(Model model,int empid){
        model.addAttribute("emp",es.deleteEmp(empid));
        return "redirect:/emp/empPage";
    }
}
