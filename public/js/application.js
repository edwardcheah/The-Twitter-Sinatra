$(document).ready(function() {
  $(document).on('submit', '#tweet-form', function(event) {
    event.preventDefault()
    $target = $(event.target)
    $.ajax({
      url: $target.attr('action'),
      type: 'POST',
      data: $target.serialize()
    }).done(function(response) {
      console.log(response)
      $response = JSON.parse(response)
      console.log($response.tweet.content)
      if ($response.tweet.id) {
        $('#tweet-list').prepend('<li id=\'single-tweet\'><a href=\'/user/' + $response.author.id + '\'><img class=\'profile-pic-thumb\' src=' + $response.author.pic_url + '>' + $response.author.user_name + '</a><br>' + $response.tweet.elapsed_time + '<br>' + $response.tweet.content+'<br></li>');
        $('#tweet-count').replaceWith($response.tweet_count)
      }
    })
  })
});
