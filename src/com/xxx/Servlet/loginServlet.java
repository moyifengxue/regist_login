package com.xxx.Servlet;

import com.xxx.model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/loginServlet")
public class loginServlet  extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取用户输入的验证码
        String kaptcha = request.getParameter("kaptcha");
        //获取系统生成的验证码
        String kaptcha_value = (String) request.getSession().getAttribute("kcode");
        if(!kaptcha.equalsIgnoreCase(kaptcha_value)){
            request.setAttribute("msg","验证码输入错误");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
        String user_id = request.getParameter("user_id");
        String password = request.getParameter("password");
        List<user> list= (List<user>) request.getServletContext().getAttribute("list");
        for (user u:list
             ) {
            if(u.getUser_id().equals(user_id)){
                System.out.println(u.getPassword());
                System.out.println(password);
                if(u.getPassword().equals(password)){
                    //response.sendRedirect("index2.jsp");
//                    response.sendRedirect("http://localhost:8080/index.jsp");
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }else {
                    request.setAttribute("msg","密码输入错误");
                    request.getRequestDispatcher("login.jsp").forward(request,response);
                    return;
                }
            }
        }
        request.setAttribute("msg","请输入正确账号");
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
