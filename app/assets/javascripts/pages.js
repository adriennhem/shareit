
var ready;
ready = function() {

$(window).scroll(function() {
  if ($(document).scrollTop() > 150) {
    $('nav.navbar-home').addClass('shrink-home');
    $('nav.navbar-home').addClass('navbar-fixed-top');
    $('nav.navbar-home').removeClass('navbar-initial');
  } else {
    $('nav.navbar-home').removeClass('shrink-home');
    $('nav.navbar-home').removeClass('navbar-fixed-top');
    $('nav.navbar-home').addClass('navbar-initial');
  }
}); 

$(window).scroll(function() {
  if ($(document).scrollTop() > 670) {
  	$('.landing-body').addClass('margin-body');
  	$('.landing-navbar-container').addClass('navbar-fixed-top');
    $('.landing-navbar-container').addClass('landing-navbar-fixed');
  } else {
  	$('.landing-body').removeClass('margin-body');
  	$('.landing-navbar-container').removeClass('navbar-fixed-top');
    $('.landing-navbar-container').removeClass('landing-navbar-fixed');
  }
}); 

};

$(document).ready(ready);
$(document).on('page:load', ready);

!function(){var analytics=window.analytics=window.analytics||[];if(!analytics.initialize)if(analytics.invoked)window.console&&console.error&&console.error("Segment snippet included twice.");else{analytics.invoked=!0;analytics.methods=["trackSubmit","trackClick","trackLink","trackForm","pageview","identify","group","track","ready","alias","page","once","off","on"];analytics.factory=function(t){return function(){var e=Array.prototype.slice.call(arguments);e.unshift(t);analytics.push(e);return analytics}};for(var t=0;t<analytics.methods.length;t++){var e=analytics.methods[t];analytics[e]=analytics.factory(e)}analytics.load=function(t){var e=document.createElement("script");e.type="text/javascript";e.async=!0;e.src=("https:"===document.location.protocol?"https://":"http://")+"cdn.segment.com/analytics.js/v1/"+t+"/analytics.min.js";var n=document.getElementsByTagName("script")[0];n.parentNode.insertBefore(e,n)};analytics.SNIPPET_VERSION="3.0.1";
analytics.load("lClBhIVY3ECHXIZeNbjCj2YI2P9MIgp6");
analytics.page()
}}();


