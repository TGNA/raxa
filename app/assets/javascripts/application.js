// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

//= require jquery.flexisel.js
//= require bootstrap.js
//= require imagezoom.js

var ready = function() {

  $("#slider").responsiveSlides({
    auto: true,
    nav: true,
    speed: 500,
    namespace: "callbacks",
    pager: false,
  });
  // $(".memenu").memenu();  

  $('.lazy').Lazy({
    scrollDirection: 'vertical',
    effect: 'fadeIn',
    visibleOnly: true,
    onError: function(element) {
      $(element).attr('src', "http://raxadistribuciones.com/img/sin_imagen.png");
      console.log('error loading ' + element.data('src'));
    }
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);