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
    <title>注册页面</title>
</head>
<link rel="stylesheet" href="./css/reg.css">
<body>
<div class="reg">
    <div class="header">
        <h1>
            <a href="./login.jsp" >登录</a> <a href="./regist.jsp">注册</a>
        </h1>
    </div>
    <br>
    <br>
    <div class="body" id="body" align="center">
        <table>
            <tr>
                <td class="td1">手  机</td>
                <td><input type="text" class="input1" name="phone_number" id="phone_number" minlength="11" maxlength="11" placeholder="请输入手机号"></td>
            </tr>
            <tr>
                <td class="td1">验证码</td>
                <td>
                    <form action="submit.action">
                        <input type="text" class="input1" id="code" name="kaptcha" maxlength="4" placeholder="请输入验证码" value="">
                        <img src="/kaptcha.jpg">
                    </form>
                </td>
            </tr>
            <tr>
            <td colspan="2">
                <div class="btn-red">
                    <input type="button" value="下一步" id="login-btn" onclick="phone()">
                </div>
            </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">

        /**
         * 电话信息处理
         */
        function phone() {
            //验证手机号
            var phone_length = document.getElementById("phone_number").value.length;
            if(phone_length!=11){
                alert("手机号错误")
                return;
            }
            //验证验证码是否正确
            var xmlhttp0 = new XMLHttpRequest();
            var code = document.getElementById("code").value;
            var code_flag="11";
            xmlhttp0.open("GET","http://localhost:8080//registServlet?flag=11&code="+code,true);
            xmlhttp0.send();
            xmlhttp0.onreadystatechange=function () {
                if(xmlhttp0.readyState==4&&xmlhttp0.status==200){
                    code_flag=xmlhttp0.responseText;
                    if(code_flag==0){
                        alert("验证码错误");
                        return;
                    }else{
                        var xmlhttp = new XMLHttpRequest();
                        var phone_number = document.getElementById("phone_number").value;
                        xmlhttp.open("GET","http://localhost:8080//registServlet?flag=1&phone_number="+phone_number,true);
                        xmlhttp.send();
                        var xmlhttp2 = new XMLHttpRequest();
                        xmlhttp2.open("GET","XML/user_id.xml",true);
                        xmlhttp2.send();
                        xmlhttp2.onreadystatechange=function () {
                            if(xmlhttp2.readyState==4&&xmlhttp2.status==200){
                                document.getElementById("body").innerHTML=xmlhttp2.responseText;
                            }
                        }
                    }
                }
            }

        }

        /**
         * 账号密码处理
         */
        function user_id() {
            var xmlhttp = new XMLHttpRequest();
            var user_id = document.getElementById("user_id").value;
            var password = document.getElementById("password").value;
            if(user_id.length<5||user_id.length>16){
                alert("账号应大于5位小于16位");
                return;
            }
            if(password.length<5||password.length>16){
                alert("密码应大于5位小于16位");
                return;
            }
            xmlhttp.open("GET","http://localhost:8080//registServlet?flag=2&user_id="+user_id+"&password="+password,true);
            xmlhttp.send();
            var xmlhttp2 = new XMLHttpRequest();
            xmlhttp2.open("GET","XML/user_name.xml",true);
            xmlhttp2.send();
            xmlhttp2.onreadystatechange=function () {
                if(xmlhttp2.readyState==4&&xmlhttp2.status==200){
                    document.getElementById("body").innerHTML=xmlhttp2.responseText;
                }
            }
        }

        /**
         * 用户信息页信息处理
         */
        function user_name() {
            var user_name = document.getElementById("user_name").value;
            var sex_list = document.getElementsByName("sex");
            var sex = null;
            for (var i = 0; i <sex_list.length ; i++) {
                if(sex_list[i].checked){
                    sex = sex_list[i].value;
                    break;
                }
            }
            var url = "http://localhost:8080//registServlet?flag=3&user_name="+user_name+"&sex="+sex;
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.open("GET",url,true);
            xmlhttp.send();

            //注册信息的写入
            var xmlhttp3 = new XMLHttpRequest();
            xmlhttp.open("POST","http://localhost:8080//registServlet",true);
            xmlhttp.send();

            //返回成功页面
            var xmlhttp2 = new XMLHttpRequest();
            xmlhttp2.open("GET","XML/regist_success.xml",true);
            xmlhttp2.send();

            xmlhttp2.onreadystatechange=function () {
                if(xmlhttp2.readyState==4&&xmlhttp2.status==200){
                    document.getElementById("body").innerHTML=xmlhttp2.responseText;
                }
            }
            alert("注册成功")
        }
    </script>

</div>
</body>
</html>
