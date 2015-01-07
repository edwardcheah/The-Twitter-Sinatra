$(document).ready(function() {

  $(document).on('submit', '#tweet-form', function(event) {
    event.preventDefault()
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize()
    }).done(function(response) {
      var parsedResponse = JSON.parse(response)
      $('#tweet-list').prepend(parsedResponse.view)
      $('#sidebar-wrapper').html(parsedResponse.mini)
    })
  })

  $(document).on('submit', '.delete-button', function(event) {
    event.preventDefault()
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize()
    }).done(function(response) {
      var parsedResponse = JSON.parse(response)
      $target.closest('.col-lg-12').html(parsedResponse.index)
      $('#sidebar-wrapper').html(parsedResponse.mini)
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
      var parsedResponse = JSON.parse(response)
      $target.closest('.col-lg-12').html(parsedResponse.full)
      $('#sidebar-wrapper').html(parsedResponse.mini)
    })
  })

  $(document).on('submit', '.edit-user', function(event) {
    event.preventDefault()
    var $target = $(event.target)
    console.log($target)
    $.ajax({
      url: $target.attr('action'),
      type: 'PUT',
      data: $target.serialize()
    }).done(function(response) {
      var parsedResponse = JSON.parse(response)
      $target.closest('.col-lg-12').html(parsedResponse.full)
      $('#sidebar-wrapper').html(parsedResponse.mini)
    })
  })
});
