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
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" href="css/font.css">
    <link rel="stylesheet" href="css/xadmin.css">
    <!-- <link rel="stylesheet" href="./css/theme5.css"> -->
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
<body class="index">
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
<div>
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home">
                <i class="layui-icon">&#xe68e;</i>我的桌面</li></ul>
        <div class="layui-unselect layui-form-select layui-form-selected" id="tab_right">
            <dl>
                <dd data-type="this">关闭当前</dd>
                <dd data-type="other">关闭其它</dd>
                <dd data-type="all">关闭全部</dd></dl>
        </div>
        <div class="layui-tab-content">
            <div class="layui-tab-item layui-show" style="text-align: center;margin-top: 50px;margin-left: 200px">
                <form class="layui-form">
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>软件名称
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.softwareName}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>APK名称
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.APKName}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>支持ROM
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.supportROM}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>界面语言
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.interfaceLanguage}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>软件大小
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.softwareSize}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>下载次数
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.downloads}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>所属平台
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.flatFormName}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>所属分类
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.level1}->${app.level2}->${app.level3}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>APP状态
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.statusName}">
                        </div>
                    </div>
                    <div class="layui-form-item">
                        <label class="layui-form-label">
                            <span class="x-red">*</span>应用简介
                        </label>
                        <div class="layui-input-inline">
                            <input type="text" name="username" readonly
                                   autocomplete="off" class="layui-input" value="${app.appInfo}">
                        </div>
                    </div>
                    <h2>历史版本列表</h2>
                    <div class="layui-card-body layui-table-body layui-table-main">
                        <table class="layui-table">
                            <thead>
                            <tr>
                                <th>软件名称</th>
                                <th>版本号</th>
                                <th>版本大小(单位:M)</th>
                                <th>发布状态</th>
                                <th>APK文件下载</th>
                                <th>最新更新时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${versionList}" var="version">
                                <tr>
                                    <td>${version.appName}</td>
                                    <td>${version.versionNo}</td>
                                    <td>${version.versionSize}</td>
                                    <td>${version.publishStatus}</td>
                                    <td><a href="${version.downloadLink}">${version.downloadLink}</a></td>
                                    <td>${version.modifyDate}</td>
                                    <td class="version">${app.newVersion}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="layui-form-item">
                        <label for="L_repass" class="layui-form-label">
                        </label>
                        <button  class="layui-btn"  type="button" name="${app.id}" id="acpt" onclick="acc()">
                            审核通过
                        </button>
                        <label for="L_repass" class="layui-form-label">
                        </label>
                        <button  class="layui-btn layui-bg-red" type="button" name="${app.id}" id="no" onclick="noacc()">
                            不通过
                        </button>
                        <label for="L_repass" class="layui-form-label">
                        </label>
                        <button  class="layui-btn layui-bg-blue" type="button" onclick="back()">
                            返回
                        </button>
                    </div>
                </form>
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
var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script>
    function back() {
        history.back(-1);
    }

    function acc() {
        location.href = "app/modifyStatus?num=2&id="+$("#acpt").attr("name");
    }

    function noacc() {
        location.href = "app/modifyStatus?num=3&id="+$("#no").attr("name");
    }
</script>
</body>

</html>
