$(document).on('turbolinks:load', function(){
    $('.rating').raty({
      // path: '/assets/',
      starHalf: '<%= asset_path 'star-half.png' %>',
      starOff: '<%= asset_path 'star-off.png' %>',
      starOn: '<%= asset_path 'star-on.png' %>',
      scoreName: 'comment[rating]'
    });

    $('.rated').raty({
      // path: '/assets/',
      starHalf: '<%= asset_path 'star-half.png' %>',
      starOff: '<%= asset_path 'star-off.png' %>',
      starOn: '<%= asset_path 'star-on.png' %>',
      readOnly: true,
      score: function() {
        return $(this).attr('data-score');
      }
    });

    $("#new_comment").on('submit', function(){
      r = $(".rating").raty('score');
      if (typeof r === "undefined") {
          $('.my-rating-wrapper').tooltip("show")
          return false;
      }

    });

  });
