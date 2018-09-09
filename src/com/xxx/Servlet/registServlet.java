package com.xxx.Servlet;

import com.xxx.model.user;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/registServlet")
public class registServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flag = request.getParameter("flag");
        String data="";
        if("1".equals(flag)){
            String phone_number = request.getParameter("phone_number");
            request.getSession().setAttribute("phone_number",phone_number);
        }else if("2".equals(flag)){
            String user_id = request.getParameter("user_id");
            request.getSession().setAttribute("user_id",user_id);
            String password = request.getParameter("password");
            request.getSession().setAttribute("password",password);
        }else if("3".equals(flag)){
            String user_name = request.getParameter("user_name");
            request.getSession().setAttribute("user_name",user_name);
            String sex = request.getParameter("sex");
            request.getSession().setAttribute("sex",sex);
        }else if("11".equals(flag)){
            String code = request.getParameter("code");
            String kaptcha_value = (String) request.getSession().getAttribute("kcode");
            if(code.equalsIgnoreCase(kaptcha_value)){
                data="1";
            }else {
                data="0";
            }
        }
        response.getOutputStream().write(data.getBytes("utf-8"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String phone_number= (String) request.getSession().getAttribute("phone_number");
        String user_id= (String) request.getSession().getAttribute("user_id");
        String password= (String) request.getSession().getAttribute("password");
        String user_name= (String) request.getSession().getAttribute("user_name");
        String sex= (String) request.getSession().getAttribute("sex");

        List<user> list= (List<user>) request.getServletContext().getAttribute("list");
        user iuser = new user(user_id,password,phone_number,user_name,sex);
        list.add(iuser);
//        request.getServletContext().setAttribute("list",list);
//        list= (List<user>) request.getServletContext().getAttribute("list");
//        for (user userq:list
//             ) {
//            System.out.println(userq.getPassword());
//        }
    }
}
