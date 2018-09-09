package com.xxx.Servlet;

import com.xxx.model.user;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import java.util.ArrayList;
import java.util.List;


/**
 * 用户注册的初始化类
 */
public class initServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        //创建一个list用于保存用户信息
        List<user> list=new ArrayList<user>();
        user u =new user("admin","1","12345678900","afadf","男");
        list.add(u);
        //保存list到servletContext中：servletContext作用域是全工程的
        this.getServletContext().setAttribute("list",list);
    }
}
