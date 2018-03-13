/**
 * Created by jony on 2/5/18.
 */

// Initialize app
var myApp = new Framework7();

// If we need to use custom DOM library, let's save it to $$ variable:
var $$ = Framework7.$;

// Add view
var mainView = myApp.addView('.view-main', {
    // Enable dynamic Navbar
    dynamicNavbar: true,
    // Enable Dom Cache so we can use all inline pages
    domCache: true,
    animatePages:false
});

$$(document).on('pageBeforeAnimation', function (e) {
    var page = e.detail.page;
    var fromPage = page.fromPage;
    // console.log(fromPage.name);

    $$(fromPage.container).addClass("cached");

});

//获得焦点和失去焦点在移动设备上不敏感
//触摸事件在电脑端不起作用
$$(".bottom-toolbar a").on('focus', function () {
    // $$(this).addClass('active');
    // console.log(this);
    // $$(this).css('color', 'yellow');
    // alert("123");
});
$$(".bottom-toolbar a").on('blur', function () {
    // $$(this).removeClass('active');
    // console.log(this);
    // $$(this).css('color', 'white');
});

$$(".bottom-toolbar a").on('click', function (){

    $$(".bottom-toolbar a").removeClass('active');

    $$(this).addClass('active');
});


function addEventForBottomToolbar() {

    $$('.bottom-toolbar a').on('focus', function () {
        // console.log(this);
    });
}

//dom loading finish event
window.onload = function () {

    console.log("Dom onload");
    addEventForBottomToolbar();

};
