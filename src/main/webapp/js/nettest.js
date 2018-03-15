/**
 * Created by jony on 3/13/18.
 */

var cometConId = null;

var cometConnUrl = "/tlcc/conn";
var bindUrl = "/tlcc/bind.do";
var sendUrl = "/tlcc/send.do";

function startConn() {
    JS.Engine.start(cometConnUrl);

}

function dropConn() {
    JS.Engine.stop("client request drop connect");
}

function cometProcess() {


    JS.Engine.on({
        start : function (cId, channelList, engine) {

            $("#status").text('连接已建立，连接ID为：' + cId);
            cometConId = cId;
        },
        stop : function (cause, cId, url, engine) {

            $("#status").text('连接已断开，连接ID为：' + cId + ',断开原因：' + cause + ',断开的连接地址：'+ url);
        },
        order: function (str) {
            // alert(str);
            $("#msgShow").append("order:"+str+"<br>");
        },
        status: function (str) {
            $("#msgShow").append("status:"+str+"<br>");
        }

    });
}

function bind() {
    $.post(bindUrl,
        {
            clientId:"123456",
            connId:cometConId
        },
        function (data,status) {
            $("#bindReturn").append("ajax Status: " + status+"\tReturn Data: " + data);
            $("#bindReturn").append("<br/>");
        }
    );
}

function sendMessage() {
    $.post(sendUrl,
        {
            str:"123456"
        },
        function (data,status) {
            $("#sendReturn").append("ajax Status: " + status+"\tReturn Data: " + data);
            $("#sendReturn").append("<br/>");
        }
    );
}


$(document).ready(function () {


    console.log("load");
    setTimeout(cometProcess);

    $("#startConn").click(function () {
        startConn();
    });

    $('#dropConn').click(function () {
        dropConn();
    });
    $('#bind').click(function () {
        bind();
    });
    $('#sendMessage').click(function () {
        sendMessage();
    });
});