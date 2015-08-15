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
var selected_robot = '';
$(document).ready(function(){
  $('.robot').click(function(e){
    selected_robot = $(e.target);
    $('.robot').removeClass('selected');
    selected_robot.addClass('selected');
    selected_robot.space = selected_robot.parent('.space');
    $('input#move_robot_id').val(selected_robot.attr('id'));
  });

  $('.space').click(function(e)
  {
    space = $(e.target);
    if(selected_robot.space.data('row') == space.data("row"))
    {
      if(selected_robot.space.data('column') < space.data('column'))
      {
        $('input#move_direction').val('right');
        submit_move_form();
      }
      else if(selected_robot.space.data('column') > space.data('column'))
      {
        $('input#move_direction').val('left')
        submit_move_form();
      }
    }
    if(selected_robot.space.data('column') == space.data('column'))
    {
      if(selected_robot.space.data('row') < space.data('row'))
      {
        $('input#move_direction').val('down')
        submit_move_form();
      }
      else if(selected_robot.space.data('row') > space.data('row'))
      {
        $('input#move_direction').val('up')
        submit_move_form();
      }
    }
  })
});
function submit_move_form()
{
  $('form.new_move').submit();
}