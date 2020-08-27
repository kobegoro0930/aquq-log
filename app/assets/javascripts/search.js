$(function() {

  var search_list = $(".contents.row");

  function appendSample(sample) {
    var current_user = sample.user_sign_in && sample.user_sign_in.id == sample.user_id ? 
                             `<li>
                                <a href="/samples/${sample.id}/edit" data-method="get" >編集</a>
                              </li>
                              <li>
                                <a href="/samples/${sample.id}" data-method="delete" >削除</a>
                              </li>` : "";

    var html = `<div class="content_post" style="background-image: url(${sample.image});">
                  <div class="more">
                    <span><img src="/assets/arrow_top.png"></span>
                    <ul class="more_list">
                      <li>
                        <a href="/samples/${sample.id}" data-method="get" >詳細</a>
                      </li>
                      ${current_user}
                    </ul>
                  </div>
                  <p>${sample.text}</p><br>
                  <span class="name">
                    <a href="/users/${sample.user_id}">
                      <span>投稿者</span>${sample.nickname}
                    </a>
                  </span>
                </div>`
    search_list.append(html);
  }
  
  function appendErrMsgToHTML(msg) {
    var html = `<div class='name'>${ msg }</div>`
    search_list.append(html);
  }

  $(".search-input").on("keyup", function() {
    let input = $(".search-input").val();
    $.ajax({
      type: 'GET',
      url: '/groups/search',
      data: { area: input },
      dataType: 'json'
    });
    .done(function(groups) {
      $(".contents.row").empty();
      if (groups.length !== 0) {
        groups.forEach(function(group){
          appendSample(group);
        });
      }
      else {
        appendErrMsgToHTML("一致する水族館がありません");
      }
    })
  });
});
