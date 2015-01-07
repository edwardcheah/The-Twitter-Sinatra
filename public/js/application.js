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
      var $response = JSON.parse(response)
      var $likeButton = $target.closest('.like-form').children('.like-button')
      if ($likeButton.attr('value') === 'like') {
        $likeButton.attr('value', 'dislike')
      } else {
        $likeButton.attr('value', 'like')
      }
      var $likeCount = $target.closest('div').children('.like-count')
      console.log($likeCount)
      $likeCount.text($response.like_count + " Likes")
    })
  })

});
