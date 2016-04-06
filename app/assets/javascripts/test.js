$(document).ready(function(){ $('div.dropdown ul.dropdown-menu li a').click(function (e) { $('.selected').html($(this).html()); }) });

$('div.dropdown ul.dropdown-menu li a').click(function (e) {
    $('.selected').html($(this).html());
})