// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function() {
  $('#task_name').focus();

  $('.modal-footer .btn-primary').click(function() {
    $('.edit_task').submit();
  });
});

