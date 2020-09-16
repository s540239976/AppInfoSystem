<%--
  Created by IntelliJ IDEA.
  User: HiSoft-36
  Date: 2020/9/11
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html class="x-admin-sm">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>后台登录-X-admin2.2</title>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
    <script src="js/jquery-1.8.3.min.js"></script>
    <script src="lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="js/xadmin.js"></script>


    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        // 是否开启刷新记忆tab功能
        // var is_remember = false;
    </script>

</head>
<body>
<!-- 顶部开始 -->
<div class="container">
    <div class="logo">
        <a href="../index.html">APP后台管理系统</a></div>
    <div class="left_open">
        <a><i title="展开左侧栏" class="iconfont">&#xe699;</i></a>
    </div>
    <ul class="layui-nav left" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;">${backUser.userName}</a>
            <dl class="layui-nav-child">
                <!-- 二级菜单 -->
                <dd>
                    <a onclick="xadmin.open('个人信息','http://www.baidu.com')">个人信息</a></dd>
                <dd>
                    <a onclick="xadmin.open('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
                <dd>
                    <a href="backUser/logout">退出</a></dd>
            </dl>
        </li>
    </ul>
</div>
<!-- 顶部结束 -->
<!-- 中部开始 -->
<!-- 左侧菜单开始 -->
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="会员管理">&#xe6b8;</i>
                    <cite>APP管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a href="app/query">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>APP审核</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('会员列表(静态表格)','member-list.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>广告推广</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="管理员管理">&#xe726;</i>
                    <cite>用户管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a onclick="xadmin.add_tab('管理员列表','admin-list.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>后台用户管理</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('角色管理','admin-role.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>开发者资质审核</cite></a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="javascript:;">
                    <i class="iconfont left-nav-li" lay-tips="其它页面">&#xe6b4;</i>
                    <cite>其它页面</cite>
                    <i class="iconfont nav_right">&#xe697;</i></a>
                <ul class="sub-menu">
                    <li>
                        <a href="login.html" target="_blank">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>登录页面</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('错误页面','error.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>错误页面</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('示例页面','demo.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>示例页面</cite></a>
                    </li>
                    <li>
                        <a onclick="xadmin.add_tab('更新日志','log.html')">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>更新日志</cite></a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- <div class="x-slide_left"></div> -->
<!-- 左侧菜单结束 -->
<!-- 右侧主体开始 -->
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面
            </li>
        </ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd>
            </dl>
        </div>
        <div class="layui-tab-content" id="content">
            <div class="layui-tab-item layui-show" style="text-align: center">
                <div class="layui-fluid">
                    <div class="layui-row layui-col-space15">
                        <div class="layui-col-md12">
                            <div class="layui-card">
                                <div class="layui-card-body ">
                                    <form class="layui-form layui-col-space5" method="post" action="app/query">
                                        <div class="layui-inline layui-show-xs-block">
                                            <span style="color: grey;font-weight: bold">软件名称:</span>
                                            <input type="text" class="layui-input" value="${app.softwareName}"
                                                   autocomplete="off"
                                                   name="softwareName"
                                                   style="width: 195px">
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="layui-inline layui-show-xs-block">
                                            <span style="color: grey;font-weight: bold">所属平台:</span>
                                            <select name="flatformId" id="select_flat" value="${app.flatformId}">
                                            </select>
                                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="layui-inline layui-show-xs-block">
                                            <span style="color: grey;font-weight: bold"> 一级分类:</span>
                                            <select name="categoryLevel1" id="level1" lay-filter="f1">
                                            </select>
                                        </div>
                                        <br/>
                                        <div class="layui-inline layui-show-xs-block">
                                            <span style="color: grey;font-weight: bold">二级分类:</span>
                                            <select name="categoryLevel2" id="level2" lay-filter="f2">
                                            </select>
                                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <div class="layui-inline layui-show-xs-block">
                                            <span style="color: grey;font-weight: bold">三级分类:</span>
                                            <select name="categoryLevel3" id="level3">
                                            </select>
                                        </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;
                                        <div class="layui-inline layui-show-xs-block">
                                            <button class="layui-btn" type="submit"
                                                    style="margin-top: 20px"><i
                                                    class="layui-icon">&#xe615;</i></button>
                                        </div>
                                    </form>
                                </div>
                                <div class="layui-card-body layui-table-body layui-table-main">
                                    <table class="layui-table">
                                        <thead>
                                        <tr>
                                            <th>软件名称</th>
                                            <th>APK名称</th>
                                            <th>软件大小(单位:M)</th>
                                            <th>所属平台</th>
                                            <th>所属分类(一级分类,二级分类,三级分类)</th>
                                            <th>状态</th>
                                            <th>下载次数</th>
                                            <th>最新版本号</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${appList}" var="app">
                                            <tr>
                                                <td>${app.softwareName}</td>
                                                <td>${app.APKName}</td>
                                                <td>${app.softwareSize}</td>
                                                <td>${app.flatFormName}</td>
                                                <td>${app.level1}->${app.level2}->${app.level3}</td>
                                                <td>${app.statusName}</td>
                                                <td>${app.downloads}</td>
                                                <td class="version">${app.newVersion}</td>
                                                <td>
                                                    <span class="layui-btn layui-btn-normal layui-btn-mini btn-check"
                                                          name="${app.id}">审核</span>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="layui-card-body ">
                                    <div class="page">
                                        <div>
                                            <a class="prev" href="app/query?currPageNo=1">&lt;&lt;</a>
                                            <c:forEach begin="1" end="${app.totalPageSize}" varStatus="var">
                                                <c:if test="${app.currPageNo==var.count}">
                                                    <span class="current">${app.currPageNo}</span>
                                                </c:if>
                                                <c:if test="${app.currPageNo!=var.count}">
                                                    <a class="num"
                                                       href="app/query?currPageNo=${var.count}">${var.count}</a>
                                                </c:if>
                                            </c:forEach>
                                            <a class="next"
                                               href="app/query?currPageNo=${app.totalPageSize}">&gt;&gt;</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div id="tab_show"></div>
    </div>
</div>
<div class="page-content-bg"></div>
<style id="theme_style"></style>


<!-- 右侧主体结束 -->
<!-- 中部结束 -->
<script>//百度统计可去掉
var _hmt = _hmt || [];
(function () {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>


<script>
    layui.use(['laydate', 'form'], function () {
        var laydate = layui.laydate;
        var form = layui.form;

        // 监听一级分类
        form.on('select(f1)', function (data) {
            $.ajax({
                type: "get",
                url: "dict/queryLevel",
                data: {id: $("#level1").val()},
                dataType: "json",
                success: function (data) {
                    $("#level2").empty();
                    $("#level2").append("<option value='0'>未选择</option>")
                    for (var i = 0; i < data.length; i++) {
                        $("#level2").append("<option value=" + data[i].id + ">" + data[i].categoryName + "</option>");
                    }
                    form.render('select');
                }
            })
        })
        // 监听二级分类
        form.on('select(f2)', function (data) {
            $.ajax({
                type: "get",
                url: "dict/queryLevel",
                data: {id: $("#level2").val()},
                dataType: "json",
                success: function (data) {
                    $("#level3").empty();
                    $("#level3").append("<option value='0'>未选择</option>")
                    for (var i = 0; i < data.length; i++) {
                        $("#level3").append("<option value=" + data[i].id + ">" + data[i].categoryName + "</option>");
                    }
                    form.render('select');
                }
            })
        })

        // 监听全选
        form.on('checkbox(checkall)', function (data) {

            if (data.elem.checked) {
                $('tbody input').prop('checked', true);
            } else {
                $('tbody input').prop('checked', false);
            }
            form.render('checkbox');
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });


    });

    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});

            } else {
                $(obj).attr('title', '启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }

        });
    }

    // 所属平台
    $.ajax({
        type: "get",
        url: "dict/queryFlatFroms",
        dataType: "json",
        success: function (data) {
            $("#select_flat").append("<option value='0'>未选择</option>")
            for (var i = 0; i < data.length; i++) {
                $("#select_flat").append("<option value=" + data[i].valueId + ">" + data[i].valueName + "</option>");
            }
        }
    })
    // 一级分类
    $.ajax({
        type: "get",
        url: "dict/queryLevel",
        data: {id: "0"},
        dataType: "json",
        success: function (data) {
            $("#level1").append("<option value='0'>未选择</option>")
            for (var i = 0; i < data.length; i++) {
                $("#level1").append("<option value=" + data[i].id + ">" + data[i].categoryName + "</option>");
            }
        }
    })
    // 审核按钮
    $(".btn-check").on("click", function () {
        if ($(this).parent().prev().html() == "") {
            alert("没有最新版本号，无法审核");
        } else {
            location.href = "app/appCheck?id=" + $(this).attr("name");
    }
    })
</script>
</body>
</html>
