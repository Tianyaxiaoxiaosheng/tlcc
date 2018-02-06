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
