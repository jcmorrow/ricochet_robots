/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

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
    if(selected_robot != '')
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
    }
  })
});
function submit_move_form()
{
  $('form.new_move').submit();
}
