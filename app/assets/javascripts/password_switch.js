$(document).on('turbolinks:load', function() {
  $("#reveal_password").change(function(){
    if($(this).prop('checked')){
      $('#PWForm').attr('type','text');
      $('#PWForm_confirmation').attr('type','text');
    }else{
      $('#PWForm').attr('type','password');
      $('#PWForm_confirmation').attr('type','password');
    }
  });
});