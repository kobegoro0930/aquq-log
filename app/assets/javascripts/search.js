$(function() {
  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
      $.ajax({
        type: 'GET',
        url: '/sample/search',
        data: { area: input },
        dataType: 'json'
      });
  });
});
