<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2018/9/6
  Time: 15:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
</head>
<link rel="stylesheet" href="./css/login.css">
<body>
<div class="login">
    <div class="header">
        <h1>
            <a href="./login.jsp" >登录</a> <a href="./regist.jsp">注册</a>
        </h1>

    </div>
    <form action="loginServlet" method="post">
            <%
                if(request.getAttribute("msg")!=null){
            %><%=request.getAttribute("msg")%><%
            }
          %>
        <table>
            <tr>
                <td class="td1">用户名</td>
                <td><input type="text" class="input1" name="user_id" minlength="5" placeholder="请输入用户名"></td>
            </tr>
            <tr>
                <td class="td1">密码</td>
                <td><input type="password" class="input1" name="password" minlength="4" placeholder="请输入密码"></td>
            </tr>

            <tr>
                <td class="td1">验证码</td>
                <td>
                    <form action="submit.action">
                        <input type="text" class="input1" name="kaptcha" maxlength="4" placeholder="请输入验证码" value="">
                        <img src="/kaptcha.jpg">
                    </form>
                </td>
            </tr>
            <%--<tr>--%>
                <%--<td class="td1" colspan="2">--%>
                    <%--<input type="checkbox" name="remember" value="true" checked="checked"> 记住用户名</td>--%>
            <%--</tr>--%>
            <tr>
                <td colspan="2">
                    <div class="btn-red">
                        <input type="submit" value="登录" id="login-btn">
                    </div>
                </td>
            </tr>
        </table>

    </form>
</div>
</body>
</html>
