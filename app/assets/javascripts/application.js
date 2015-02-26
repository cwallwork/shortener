// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

"use strict"

var hostName = window.location.host

$(document).ready(function(){
	urlFormEventListener();



})

function urlFormEventListener(){
	$("#new_url_form").submit(function(event){
		event.preventDefault();
		var enteredUrl = $(this).serializeArray()[0].value;
		console.log(enteredUrl);
		$.ajax({
			type: "POST",
			url: "urls",
			data: {url:{full_url: enteredUrl}},
		}).done(function(response){responseHandler(response)});
		
	});
}

function responseHandler(response){
	if(response.full_url){
		var shortUrl = hostName + "/" + response.converted_url
		$("#new_url_box").html("<p id='short_url'>Your short URL is: <a href=" + shortUrl +">" + shortUrl + "</a></p>");
	}
	else {
		showErrorMessage(response);
	}
}

function showErrorMessage(response){
	$("#new_url_form").find("input[name=url]").val("");
	$("#new_url_box").prepend(response);
}

