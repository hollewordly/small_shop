<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>管理员登录-后台管理系统-Admin 1.0</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/font.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/weadmin.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery.validate.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/messages_zh.js"></script>
</head>
<body class="login-bg">

<div class="login">
    <div class="message">Admin 1.0-管理登录</div>
    <div id="darkbannerwrap"></div>

    <form  method="post" class="layui-form" id="userForm" >
        <input name="user_name" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
        <hr class="hr15">
        <input name="user_password" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
        <hr class="hr15">
        <input class="loginin" value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
        <b><font color="red" id="mess"></font></b>
            <hr class="hr20" >

    </form>
</div>

<script type="text/javascript">


    layui.extend({
        admin: '{/}./static/js/admin'
    });
    layui.use(['form','admin'], function(){
        var form = layui.form
            ,admin = layui.admin;

        //监听提交
        //form.on('submit(login)', function(data){
           // layer.msg(JSON.stringify(data.field),function(){
               // location.href='./tologin'
            //});
          //  return true;
     //  });
    });
</script>
<script type="text/javascript">

    //表单校验
    $(function() {
        $("#userForm").validate({
            submitHandler : function() {
                //提交Ajax
                $.ajax({
                    data : $("#userForm").serialize(),
                    dataType : "text",
                    type : "post",
                    url : "${pageContext.request.contextPath}/tologin",
                    success : function(rec) {
                        if(rec=="0"){
                            layer.msg("用户名或密码错误")
                        }else{
                            location.href = "${pageContext.request.contextPath}/index"
                        }
                    }
                });
            }
        });
    })

</script>


<!-- 底部结束 -->
</body>
</html>
