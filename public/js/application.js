$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.real-motivation').on('click', function(event) {
    event.preventDefault();
    var request = $.ajax({
      url: "/inspirations",
      type: "GET"
    });
    request.done(function(data) {
      phase = data['phase']
      url = data['url']
      $(".real-motivation img").attr('src', url);
      if(phase === 1) {
        $('h2').text('Do you really need this much motivation?');
      }
    })
  })

});
