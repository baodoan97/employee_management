// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap
function main() {
	$( "#a" ).click(function() {
	$('#file-input').trigger('click'); 
	});

	$('input[type=file]').change(function () {
    // var fileToUpload = $('#file-input').prop('files')[0];
    //  $('#a').attr('src',fileToUpload.name);
    //   console.log(fileToUpload);
     if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#a').attr('src', e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });

    $('.fa-exchange').hover(function(){
          $(this).fadeOut( 100 );
            $(this).fadeIn( 500 );
    });

    // example = true;
    // $(window).bind('refesh', function(){
    //  if 
    // });
    // if(example){
    //  alert("x");
    //  }
}
$(document).ready(main);