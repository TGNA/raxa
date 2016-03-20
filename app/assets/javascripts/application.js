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
/*! jQuery Lazy 1.6.5 - MIT & GPL-2.0 license - Copyright 2012-2016 Daniel 'Eisbehr' Kern */
!function(t,e,r,n){"use strict";function a(r,n,a,o){function i(){p=e.devicePixelRatio>1,l(a),n("delay")>=0&&setTimeout(function(){u(!0)},n("delay")),(n("delay")<0||n("combined"))&&(o.e=m(n("throttle"),function(t){"resize"===t.type&&(b=v=-1),u(t.all)}),o.a=function(t){l(t),a.push.apply(a,t)},o.g=function(){return a},u(),t(n("appendScroll")).on("scroll."+r.name+" resize."+r.name,o.e))}function l(e){if(e=t(e).filter(function(){return!t(this).data(n("handledName"))&&(t(this).attr(n("attribute"))||t(this).attr(n("loaderAttribute")))}).data("plugin_"+r.name,r),n("defaultImage")||n("placeholder"))for(var a=0;a<e.length;a++){var o=t(e[a]),i=e[a].tagName.toLowerCase(),l="background-image";"img"==i&&n("defaultImage")&&!o.attr("src")?o.attr("src",n("defaultImage")):"img"==i||!n("placeholder")||o.css(l)&&"none"!=o.css(l)||o.css(l,"url("+n("placeholder")+")")}}function u(e){if(!a.length)return void(n("autoDestroy")&&r.destroy());for(var o=!1,i=n("imageBase")?n("imageBase"):"",l=0;l<a.length;l++)(function(r){if(d(r)||e){var a,l=t(r),u=r.tagName.toLowerCase(),f=l.attr(n("attribute"));l.data(n("handledName"))||n("visibleOnly")&&!l.is(":visible")||!(f&&("img"==u&&i+f!=l.attr("src")||"img"!=u&&i+f!=l.css("background-image"))||(a=l.attr(n("loaderAttribute"))))||(o=!0,l.data(n("handledName"),!0),c(l,u,i,a))}})(a[l]);o&&(a=t(a).filter(function(){return!t(this).data(n("handledName"))}))}function c(e,r,a,o){++h;var i=function(){g("onError",e),A()};if(g("beforeLoad",e),o)e.off("error").one("error",i),e.one("load",function(){n("removeAttribute")&&e.removeAttr(n("loaderAttribute")),g("afterLoad",e),A()}),g(o,e,function(t){t?e.load():e.error()})||e.error();else{var l=t(new Image);l.one("error",i),l.one("load",function(){e.hide(),"img"==r?e.attr("src",l.attr("src")):e.css("background-image","url("+l.attr("src")+")"),e[n("effect")](n("effectTime")),n("removeAttribute")&&e.removeAttr(n("attribute")+" "+n("retinaAttribute")),g("afterLoad",e),l.remove(),A()}),l.attr("src",a+e.attr(n(p&&e.attr(n("retinaAttribute"))?"retinaAttribute":"attribute"))),l.complete&&l.load()}}function d(t){var e=t.getBoundingClientRect(),r=n("scrollDirection"),a=n("threshold"),o=s()+a>e.top&&-a<e.bottom,i=f()+a>e.left&&-a<e.right;return"vertical"==r?o:"horizontal"==r?i:o&&i}function f(){return b>=0?b:b=t(e).width()}function s(){return v>=0?v:v=t(e).height()}function m(t,e){var a,o=0;return function(i,l){function u(){o=+new Date,e.call(r,i)}var c=+new Date-o;a&&clearTimeout(a),c>t||!n("enableThrottle")||l?u():a=setTimeout(u,t-c)}}function A(){--h,a.size()||h||g("onFinishedAll")}function g(t,e,a){return(t=n(t))?(t.apply(r,[].slice.call(arguments,1)),!0):!1}var h=0,b=-1,v=-1,p=!1;!function(){"event"==n("bind")?i():t(e).load(i)}()}function o(e,r){var o=this,i=t.extend({},o.configuration,r),l={};return o.config=function(t,e){return e===n?i[t]:(i[t]=e,o)},o.addItems=function(e){return l.a&&l.a("string"===t.type(e)?t(e):e),o},o.getItems=function(){return l.g?l.g():{}},o.update=function(t){return l.e&&l.e({},!t),o},o.loadAll=function(){return l.e&&l.e({all:!0},!0),o},o.destroy=function(){return t(o.config("appendScroll")).off("."+o.name,l.e),l={},n},a(o,o.config,e,l),o.config("chainable")?e:o}t.fn.Lazy=t.fn.lazy=function(t){return new o(this,t)},t.extend(o.prototype,{name:"lazy",configuration:{chainable:!0,autoDestroy:!0,bind:"load",threshold:500,visibleOnly:!1,appendScroll:e,scrollDirection:"both",imageBase:null,defaultImage:"data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==",placeholder:null,delay:-1,combined:!1,attribute:"data-src",retinaAttribute:"data-retina",loaderAttribute:"data-loader",removeAttribute:!0,handledName:"handled",effect:"show",effectTime:0,enableThrottle:!0,throttle:250,beforeLoad:null,afterLoad:null,onError:null,onFinishedAll:null}})}(jQuery,window,document);
var ready = function() {

  if($("#slider").length){
    $("#slider").responsiveSlides({
      auto: true,
      nav: true,
      speed: 500,
      namespace: "callbacks",
      pager: false,
    });
  }

  if($(".lazy").length){
    $('.lazy').Lazy({
      scrollDirection: 'vertical',
      effect: 'fadeIn',
      visibleOnly: true,
      onError: function(element) {
        $(element).attr('src', "http://raxadistribuciones.com/img/sin_imagen.png");
        console.log('error loading ' + element.data('src'));
      }
    });
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);