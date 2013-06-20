$(document).ready(function() {

  $("#create_event").on("submit", function(event){
    event.preventDefault();
    var url = '/events';
    var data = $('#create_event').serialize();
    $.post(url, data, function(response){
      $("#event_list").append(response);
    });
  });


});





