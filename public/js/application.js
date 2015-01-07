$(document).ready(function() {

  $(document).on('submit', '#tweet-form', function(event) {
    event.preventDefault()
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize()
    }).done(function(response) {
      $('#tweet-list').prepend(response)
    })
  })

  $(document).on('submit', '.like-form', function(event) {
    event.preventDefault()
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize()
    }).done(function(response) {
      $target.closest('li').replaceWith(response)
    })
  })

  $(document).on('submit', '.follow-form', function(event) {
    event.preventDefault()
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize()
    }).done(function(response) {
      console.log(response)
      $target.closest('.col-lg-12').html(response)
    })
  })
});
