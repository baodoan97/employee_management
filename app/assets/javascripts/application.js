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
$( document ).on('turbolinks:load', function() {
	$( "#a" ).click(function() {
	$('#file-input').trigger('click'); 
	});

	$('input[type=file]').change(function () {
    // var fileToUpload = $('#file-input').prop('files')[0];
    //  $('#a').attr('src',fileToUpload.name);
    //   console.log(fileToUpload);
     if (this.files && this.files[0]) {
           if( checkTypeimg(this.files[0].type) == false){
            var input = $('input[type=file]');
                       input.replaceWith(input.val('').clone(true));
                     document.getElementById("a").src = "";
                     alert("only image type jpeg,png");
                  return;
            }
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

    $('#imagetsask').change(function () {
      var myNode = document.getElementById("imagetaskss");
          myNode.innerHTML = '';
     if (this.files && this.files) {
        for(var i = 0 ; i < this.files.length;i++){
                  console.log(checkTypeimg(this.files[i].type));
                 if( checkTypeimg(this.files[i].type) == false){
                    var input = $("#imagetsask");
                       input.replaceWith(input.val('').clone(true));
                       alert("only image type jpeg,png");
                  return;
                  }
        }
        var files = this.files
        for (var i = 0; i < files.length; i++) {
            let file = files[i];
            let reader = new FileReader();
            reader.onload = function(e) {
            var span = document.createElement('span');
            span.innerHTML = ['<img class="imgtask" src="', e.target.result,
                '" title="', escape(file.name), '">'
              ].join('');
              document.getElementById('imagetaskss').insertBefore(span, null);
            };
            reader.readAsDataURL(file);
          }
  }    
    
});
    function checkTypeimg(type){
        switch (type) {
          case "image/png":
           return true;
            break;
          case "image/jpeg":
           return true;
            break;
         default:
            return false 
            break;
        }
    }
});
