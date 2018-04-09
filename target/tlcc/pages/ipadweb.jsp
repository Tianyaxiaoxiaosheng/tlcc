<%--
  Created by IntelliJ IDEA.
  User: jony
  Date: 2/1/18
  Time: 2:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <!-- Required meta tags-->
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1, minimum-scale=1, user-scalable=no, minimal-ui">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <!-- Your app title -->
    <title>My App</title>
    <!-- Path to Framework7 iOS CSS theme styles-->
    <link rel="stylesheet" href="/tlcc/css/framework7.ios.min.css">
    <!-- Path to Framework7 iOS related color styles -->
    <link rel="stylesheet" href="/tlcc/css/framework7.ios.colors.min.css">
    <!-- Path to your custom app styles-->
    <link rel="stylesheet" href="/tlcc/css/ipadweb.css">
</head>
<body>
<!-- Status bar overlay for full screen mode (PhoneGap) -->
<div class="statusbar-overlay"></div>

<!-- Views -->
<div class="views">
    <div class="view view-main">

        <!-- Top Navbar-->
        <div class="navbar no-border">
            <div class="navbar-inner" data-page="lights">
                <div class="left">右边</div>
                <div class="center">灯光</div>
                <div class="right">左边</div>
            </div>

            <div class="navbar-inner cached" data-page="aircon">
                <div class="left">右边</div>
                <div class="center">空调</div>
                <div class="right">左边</div>
            </div>

            <div class="navbar-inner cached" data-page="service">
                <div class="left">右边</div>
                <div class="center">服务</div>
                <div class="right">左边</div>
            </div>
        </div>

        <!-- 固定布局, 使用穿透或者固定，都与导航自定义高度不兼容-->
        <div class="pages">

            <%--index(lights)--%>
            <div data-page="lights" class="page page-on-center">
                <!-- Scrollable page content -->
                <div class="page-content">
                    <div class="row">
                        <div class="col-20">
                            <p>light</p>
                        </div>
                        <div class="col-80">
                            <div class="toolbar tabbar tabbar-scrollable no-border">
                                <div class="toolbar-inner">
                                    <a href="#tab1" class="tab-link active">tab1</a>
                                    <a href="#tab2" class="tab-link">tab2</a>
                                    <a href="#tab3" class="tab-link">tab3</a>
                                </div>
                            </div>

                            <div class="tabs-animated-wrap">
                                <div class="tabs">
                                    <div class="tab active" id="tab1"><p>tab1</p></div>
                                    <div class="tab" id="tab2"><p>tab2</p></div>
                                    <div class="tab" id="tab3"><p>tab3</p></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--aircon--%>
            <div data-page="aircon" class="page cached">
                <div class="page-content">
                    <div class="row">
                        <div class="col-100">
                            <div class="toolbar tabbar tabbar-scrollable no-border">
                                <div class="toolbar-inner">
                                    <a href="#tab11" class="tab-link active">tab1</a>
                                    <a href="#tab12" class="tab-link">tab2</a>
                                </div>
                            </div>

                            <div class="tabs-animated-wrap">
                                <div class="tabs">
                                    <div class="tab active" id="tab11"><p>tab1</p></div>
                                    <div class="tab" id="tab12"><p>tab2</p></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%--service--%>
            <div data-page="service" class="page cached">
                <div class="page-content">
                    <div class="row">
                        <div class="col-100">
                            <p>service</p>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Bottom Toolbar-->
        <div class="toolbar bottom-toolbar no-border">
            <%--<div class="toolbar-inner">--%>
            <%--<!-- Toolbar links -->--%>
            <%--<a href="#lights" class="link">Link 1<br/>链接</a>--%>
            <%--<a href="#aircon" class="link">Link 2</a>--%>
            <%--<a href="#service" class="link">Link 2</a>--%>
            <%--</div>--%>

            <%--row 添加到toobar，a下的div去掉会导致换行失效--%>
            <%--放出row，方便调节--%>
            <div class="row">

                <div class="col-33">
                    <a href="#lights" class="link active">
                        <div>
                            <span class="zh">灯光</span>
                            <br/>
                            <span class="en">LIGHTS</span>
                        </div>
                    </a>
                </div>
                <div class="col-33">
                    <a href="#aircon" class="link">
                        <div>
                            <span class="zh">空调</span>
                            <br/>
                            <span class="en">AIRCON</span>
                        </div>
                    </a>
                </div>
                <div class="col-33">
                    <a href="#service" class="link">
                        <div>
                            <span class="zh">服务</span>
                            <br/>
                            <span class="en">SERVICE</span>
                        </div>
                    </a>
                </div>

            </div>

        </div>
    </div>
</div>
<!-- Path to Framework7 Library JS-->
<script type="text/javascript" src="/tlcc/js/framework7.min.js"></script>
<!-- Path to your app js-->
<script type="text/javascript" src="/tlcc/js/ipadweb.js"></script>
</body>
</html>
