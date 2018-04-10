<%--
  Created by IntelliJ IDEA.
  User: jony
  Date: 3/13/18
  Time: 11:52 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>网络测试</title>
    <script type="text/javascript" src="../tlcc/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../tlcc/js/comet4j.js"></script>
    <script type="text/javascript" src="../tlcc/js/nettest.js"></script>
</head>
<body>

<button type="button" id="startConn">start connect</button>
<button type="button" id="dropConn">drop connect</button>
<button type="button" id="bind">bind</button>
<button type="button" id="register">register</button>
<button type="button" id="sendMessage">send Message</button>

<p>status:<span id="status"></span></p>

<div id="msgShow">
    <p>message:</p>
</div>

<div id="bindReturn">
    <p>bind return:</p>>
</div>

<div id="registerReturn">
    <p>register return:</p>>
</div>

<div id="sendReturn">
    <p>send return:</p>>
</div>

</body>
</html>

