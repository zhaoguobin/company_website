// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree ../../../vendor/assets/javascripts/

$(document).ready(function(){
  $("#slider_images").anythingSlider({
    expand              : true,
    resizeContents      : true,
    autoPlay            : true,
    buildArrows         : true,      // If true, builds the forwards and backwards buttons
    buildNavigation     : false,      // If true, builds a list of anchor links to link to each panel
    buildStartStop      : false  
  });

  $("#products_show").slick({
    slidesToShow: 4,
    slidesToScroll: 1,
    autoplay: true,
    autoplaySpeed: 2000
  });

  $("#new_session").submit(function(){
    $(".ym-fbox").removeClass("ym-error");

    if($("#login").val()==""){
      $("#login_area").addClass("ym-error");
      return false;
    }
    if($("#password").val()==""){
      $("#password_area").addClass("ym-error");
      return false;
    }
    return true;
  });
});
