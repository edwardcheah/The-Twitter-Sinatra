$(document).ready(function() {

  $(document).on('submit', '#tweet-form', function(event) {
    event.preventDefault()
    var $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize()
    }).done(function(response) {
      var $response = JSON.parse(response)
      console.log($response.tweet.content)
      if ($response.tweet.id) {
        $('#tweet-list').prepend('<li id=\'single-tweet\'><div class=\'single-tweet\'><a href=\'/user/' + $response.author.id + '\'><img class=\'profile-pic-thumb\' src=' + $response.author.pic_url + '> @' + $response.author.user_name + '</a><br>' + $response.tweet.elapsed_time + '<br>' + $response.tweet.content+'<br></li></div>');
        $('#tweet-count').replaceWith($response.tweet_count)
      }
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
