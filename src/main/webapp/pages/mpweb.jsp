<%--
  Created by IntelliJ IDEA.
  User: jony
  Date: 2/1/18
  Time: 4:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags-->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <!-- Color theme for statusbar -->
    <meta name="theme-color" content="#2196f3">
    <!-- Your app title -->
    <title>酒店客控</title>
    <!-- Path to Framework7 Library CSS, Material Theme -->
    <link rel="stylesheet" href="/tlcc/framework7/framework7.ios.min.css">
    <!--theme-->
    <link rel="stylesheet" href="/tlcc/framework7/framework7.ios.colors.min.css">
    <!-- Path to your custom app styles-->
    <link rel="stylesheet" href="/tlcc/css/mpweb.css">
</head>
<body>

<!-- Status bar overlay for full screen mode (PhoneGap) -->
<div class="statusbar-overlay"></div>

<!-- First, we need to add Panel's overlay that will overlays app while panel is opened -->
<div class="panel-overlay"></div>

<!-- Left panel, open way is reveal(侧栏从整个App的内容中移出) or cover(侧栏覆盖App的内容) -->
<div class="panel panel-left panel-cover">

    <div class="content-block-title">Navigation</div>
    <div class="list-block">
        <ul>
            <li>
                <a class="item-link item-content" name="lights" href="#">
                    <div class="item-inner">
                        <div class="item-title">灯光</div>
                        <div class="item-after">lights</div>
                    </div>
                </a>
            </li>
            <li>
                <a class="item-link item-content" name="aircon" href="#">
                    <div class="item-inner">
                        <div class="item-title">空调</div>
                        <div class="item-after">Aircon</div>
                    </div>
                </a>
            </li>
            <li>
                <a class="item-link item-content" name="service" href="#">
                    <div class="item-inner">
                        <div class="item-title">服务</div>
                        <div class="item-after">service</div>
                    </div>
                </a>
            </li>
        </ul>
    </div>


    <div class="content-block-title"></div>
    <div class="list-block">
        <ul>
            <li>
                <a class="item-link item-content" name="setting" href="#">
                    <div class="item-inner">
                        <div class="item-title">设置</div>
                        <div class="item-after">Setting</div>
                    </div>
                </a>
            </li>
            <li>
                <a class="item-link item-content" name="about" href="#">
                    <div class="item-inner">
                        <div class="item-title">关于</div>
                        <div class="item-after">About</div>
                    </div>
                </a>
            </li>
            <li>
                <a class="item-link item-content" name="test" href="#">
                    <div class="item-inner">
                        <div class="item-title">测试</div>
                        <div class="item-after">Test</div>
                    </div>
                </a>
            </li>
        </ul>
    </div>


</div>

<!-- Views -->
<div class="views">
    <!-- Your main view, should have "view-main" class -->
    <div class="view view-main">

        <!-- Top Navbar-->
        <div class="navbar">

            <!--Navbar inner for Index page-->
            <div class="navbar-inner" data-page="index">
                <!-- We need cool sliding animation on title element, so we have additional "sliding" class -->
                <div class="center sliding">首页</div>
                <div class="right">
                    <a class="link icon-only open-panel" href="#">
                        <i class="icon icon-bars"></i>
                    </a>
                </div>
            </div>

            <!--Navbar inner for Lights page-->
            <div class="navbar-inner cached" data-page="lights">
                <div class="left sliding">
                    <a class="back link" href="#">
                        <i class="icon icon-back"></i>
                        <span name="back">返回</span>
                    </a>
                </div>
                <div class="center sliding" name="lights">灯光</div>
            </div>

            <!--Navbar inner for aircon page-->
            <div class="navbar-inner cached" data-page="aircon">
                <div class="left sliding">
                    <a class="back link" href="#">
                        <i class="icon icon-back"></i>
                        <span name="back">返回</span>
                    </a>
                </div>
                <div class="center sliding" name="aircon">空调</div>
            </div>

            <!--Navbar inner for service page-->
            <div class="navbar-inner cached" data-page="service">
                <div class="left sliding">
                    <a class="back link" href="#">
                        <i class="icon icon-back"></i>
                        <span name="back">返回</span>
                    </a>
                </div>
                <div class="center sliding" name="service">服务</div>
            </div>

            <!--Navbar inner for setting page-->
            <div class="navbar-inner cached" data-page="setting">
                <div class="left sliding">
                    <a class="back link" href="#">
                        <i class="icon icon-back"></i>
                        <span name="back">返回</span>
                    </a>
                </div>
                <div class="center sliding" name="setting">设置</div>
            </div>

            <!--Navbar inner for about page-->
            <div class="navbar-inner cached" data-page="about">
                <div class="left sliding">
                    <a class="back link" href="#">
                        <i class="icon icon-back"></i>
                        <span>Back</span>
                    </a>
                </div>
                <div class="center sliding">About</div>
            </div>

            <!--Navbar inner for test page-->
            <div class="navbar-inner cached" data-page="test">
                <div class="left sliding">
                    <a class="back link" href="#">
                        <i class="icon icon-back"></i>
                        <span>Back</span>
                    </a>
                </div>
                <div class="center sliding">测试</div>
            </div>
        </div>


        <!-- Pages container, because we use fixed-through navbar and toolbar, it has additional appropriate classes-->
        <div class="pages navbar-through toolbar-through">

            <!-- index Page, "data-page" contains page name -->
            <div data-page="index" class="page page-on-center">
                <!-- Scrollable page content -->
                <div class="page-content">
                    <div class="row">
                        <div class="col-50">
                            <a href="#lights"><img src="/tlcc/images/phone/light.png"></a>
                            <br/>
                            <span>灯光</span>
                        </div>
                        <div class="col-50">
                            <a href="#aircon"><img src="/tlcc/images/phone/aircon.png"></a>
                            <br/>
                            <span>空调</span>
                        </div>
                        <div class="col-50">
                            <a href="#service"><img src="/tlcc/images/phone/service.png"></a>
                            <br/>
                            <span>服务</span>
                        </div>
                        <div class="col-50">
                            <a href="#setting"><img src="/tlcc/images/phone/set.png"></a>
                            <br/>
                            <span>设置</span>
                        </div>

                    </div>

                </div>
            </div>

            <!--Lights page-->
            <div data-page="lights" class="page cached">
                <div class="page-content">
                    <div class="toolbar tabbar tabbar-scrollable">
                        <div class="toolbar-inner" id="lights-tabbar">
                            <a href="#" class="tab-link"></a>
                        </div>
                    </div>

                    <div class="tabs-animated-wrap">
                        <div class="tabs" id="lights-tabs">
                            <div class="tab">
                                <div class="row">
                                    <div class="col-50">
                                        <img  class="img-sw" isOpen=false src="/tlcc/images/phone/OFF3.png">
                                        <br/>
                                        <span class="zh">中文</span>
                                        <br/>
                                        <span class="en">english</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!--bottom toolbar-->
                <div class="toolbar">
                    <div class="toolbar-inner button-row">
                        <a class="button" href="#">全开</a>
                        <a class="button" href="#">全关</a>
                    </div>
                </div>
            </div>

            <!--aircon page-->
            <div data-page="aircon" class="page cached">
                <div class="page-content">
                    <div class="toolbar tabbar tabbar-scrollable">
                        <div class="toolbar-inner" id="aircon-tabbar">
                            <a href="#" class="tab-link"></a>
                        </div>
                    </div>

                    <div class="tabs-animated-wrap">
                        <div class="tabs" id="aircon-tabs">
                            <div class="tab">
                                <div class="card aircon-show">
                                    <div class="row no-gutter">
                                        <div class="col-40 temperature-col"><span class="temperature-show">26</span></div>
                                        <div class="col-30 img-show"><img src="/tlcc/images/phone/show_code.png"></div>
                                        <div class="col-30 img-show"><img src="/tlcc/images/phone/show_speed1.png"></div>

                                        <div class="col-100"><span>设置温度(℃):</span>26</div>

                                    </div>
                                </div>

                                <div class="card aircon-setting">
                                    <div class="row no-gutter">

                                        <div class="col-33  one-col">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/speed_auto.png" aircon-btn-tag=4>
                                            <br/>
                                            <span>Auto</span>
                                        </div>
                                        <div class="col-33">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/Shengwen.png" aircon-btn-tag=8>
                                            <br/>
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/JiangWen.png" aircon-btn-tag=9>
                                        </div>
                                        <div class="col-33  one-col">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/speed_stop.png" aircon-btn-tag=0>
                                            <br/>
                                            <span>Stop</span>
                                        </div>

                                        <div class="col-33">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/speed_low.png" aircon-btn-tag=1>
                                            <br/>
                                            <span>Low speed</span>
                                        </div>
                                        <div class="col-33">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/speed_medium.png" aircon-btn-tag=2>
                                            <br/>
                                            <span>Medium speed</span>
                                        </div>
                                        <div class="col-33">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/speed_high.png" aircon-btn-tag=3>
                                            <br/>
                                            <span>High speed</span>
                                        </div>

                                        <div class="col-33">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/model_cooling.png" aircon-btn-tag=5>
                                            <br/>
                                            <span>Cooling</span>
                                        </div>
                                        <div class="col-33">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/model_heating.png" aircon-btn-tag=6>
                                            <br/>
                                            <span>Heating</span>
                                        </div>
                                        <div class="col-33">
                                            <img class="img-ac" isSelected=false src="/tlcc/images/phone/model_ventilation.png" aircon-btn-tag=7>
                                            <br/>
                                            <span>Ventilation</span>
                                        </div>


                                        <!--<div class="col-50"><span>制冷</span></div>-->
                                        <!--<div class="col-50">制热</div>-->

                                        <!--<div class="col-50">通风</div>-->
                                        <!--<div class="col-50">停止</div>-->

                                        <!--<div class="col-33">一</div>-->
                                        <!--<div class="col-33">温度</div>-->
                                        <!--<div class="col-33">十</div>-->

                                        <!--<div class="col-25">低速</div>-->
                                        <!--<div class="col-25">中速</div>-->
                                        <!--<div class="col-25">高速</div>-->
                                        <!--<div class="col-25">自动</div>-->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--service page-->
            <div data-page="service" class="page cached">
                <div class="page-content">
                    <div class="row">
                        <div class="col-50">
                            <img class="img-sv" isSelected=false tag=0 src="/tlcc/images/phone/Service_QL.png">
                            <br/>
                            <span>清理</span>
                        </div>
                        <div class="col-50">
                            <img class="img-sv" isSelected=false tag=1 src="/tlcc/images/phone/Service_WR.png">
                            <br/>
                            <span>勿扰</span>
                        </div>
                        <div class="col-50">
                            <img class="img-sv" isSelected=false tag=2 src="/tlcc/images/phone/Service_SH.png">
                            <br/>
                            <span>稍后</span>
                        </div>
                        <div class="col-50">
                            <img class="img-sv" isSelected=false tag=3 src="/tlcc/images/phone/Service_SOS.png">
                            <br/>
                            <span>求助</span>
                        </div>
                    </div>
                </div>
            </div>

            <!--test page-->
            <div data-page="test" class="page cached">
                <div class="page-content">
                    <div class="row">
                        <div class="col-33">
                            <img  src="/tlcc/images/phone/ON1.png"><br/>
                            <span>床头灯</span>
                        </div>
                        <div class="col-33">
                            <img src="/tlcc/images/phone/ON1.png"><br/>
                            <span>床头灯</span>
                        </div>
                        <div class="col-33">
                            <img src="/tlcc/images/phone/ON1.png"><br/>
                            <span>床头灯</span>
                        </div>

                        <div class="col-50">
                            <img src="/tlcc/images/phone/ON0.png"><br/>
                            <span>床头灯</span>
                        </div>
                        <div class="col-50">
                            <img src="/tlcc/images/phone/ON0.png"><br/>
                            <span>床头灯</span>
                        </div>

                        <div class="col-50">
                            <img src="/tlcc/images/phone/ON2.png"><br/>
                            <span>床头灯</span>
                        </div>
                        <div class="col-50">
                            <img src="/tlcc/images/phone/OFF2.png"><br/>
                            <span>床头灯</span>
                        </div>

                        <div class="col-33">
                            <img src="/tlcc/images/phone/OFF2.png"><br/>
                            <span>床头灯</span>
                        </div>
                        <div class="col-33">
                            <img src="/tlcc/images/phone/OFF2.png"><br/>
                            <span>床头灯</span>
                        </div>
                        <div class="col-33">
                            <img src="/tlcc/images/phone/OFF2.png"><br/>
                            <span>床头灯</span>
                        </div>

                        <div class="col-33">
                            <img src="/tlcc/images/phone/OFF3.png"><br/>
                            <span>床头灯</span>
                        </div>
                        <div class="col-33">
                            <img src="/tlcc/images/phone/OFF3.png"><br/>
                            <span>床头灯</span>
                        </div>
                        <div class="col-33">
                            <img src="/tlcc/images/phone/ON3.png"><br/>
                            <span>床头灯</span>
                        </div>
                    </div>
                </div>
            </div>

            <!--setting page-->
            <div data-page="setting" class="page cached">
                <div class="page-content">

                    <div class="content-block-title">Themes</div>
                    <div class="list-block" id="themes">
                        <ul>
                            <!-- Single radio input -->
                            <li>
                                <label class="label-radio item-content">
                                    <!-- Checked by default -->
                                    <input type="radio" name="themes-radio" value="white" checked="checked">
                                    <div class="item-inner">
                                        <div class="item-title" name="white">White</div>
                                    </div>
                                </label>
                            </li>
                            <!-- Another radio input -->
                            <li>
                                <label class="label-radio item-content">
                                    <input type="radio" name="themes-radio" value="dark">
                                    <div class="item-inner">
                                        <div class="item-title" name="dark">Dark</div>
                                    </div>
                                </label>
                            </li>
                        </ul>
                    </div>

                    <div class="content-block-title">Language</div>
                    <div class="list-block" id="language">
                        <ul>
                            <!-- Single radio input -->
                            <li>
                                <label class="label-radio item-content">
                                    <!-- Checked by default -->
                                    <input type="radio" name="language-radio" value="english" checked="checked">
                                    <div class="item-inner">
                                        <div class="item-title" name="english">English</div>
                                    </div>
                                </label>
                            </li>
                            <!-- Another radio input -->
                            <li>
                                <label class="label-radio item-content">
                                    <input type="radio" name="language-radio" value="chinese">
                                    <div class="item-inner">
                                        <div class="item-title" name="chinese">Chinese</div>
                                    </div>
                                </label>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!--about page-->
            <div data-page="about" class="page cached">
                <div class="page-content">
                    <p>版本：1.0</p>
                    <p>开发者：lingdianyixiao</p>
                    <p>公司：YAVATOP</p>
                    <p>反馈：fg@yavatop.com</p>
                </div>
            </div>
        </div>

    </div>
</div>

<!--登录屏-->
<!-- Should be a direct child of BODY -->
<div class="login-screen modal-in">
    <!-- Default view-page layout -->
    <div class="view">
        <div class="page">
            <!-- page-content has additional login-screen content -->
            <div class="page-content login-screen-content">
                <div class="login-screen-title">My App</div>
                <!-- Login form -->
                <form id="login-form">
                    <div class="list-block">
                        <ul>
                            <li class="item-content">
                                <div class="item-inner">
                                    <div class="item-title label">Username</div>
                                    <div class="item-input">
                                        <input type="text" name="username" placeholder="Username">
                                    </div>
                                </div>
                            </li>
                            <li class="item-content">
                                <div class="item-inner">
                                    <div class="item-title label">Password</div>
                                    <div class="item-input">
                                        <input type="password" name="password" placeholder="Password">
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="list-block">
                        <ul>
                            <li><a href="#" class="item-link list-button" id="login">Sign In</a></li>
                        </ul>
                        <div class="list-block-label">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
                            <p><a href="#" class="close-login-screen">Close Login Screen</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- Path to Framework7 Library JS-->
<script type="text/javascript" src="/tlcc/framework7/framework7.min.js"></script>
<!--<script type="text/javascript" src="/hcsdemo3/js/jquery-3.2.1.js"></script>-->
<!-- Path to your app js-->
<script type="text/javascript" src="/tlcc/js/mpweb.js"></script>

</body>
</html>
