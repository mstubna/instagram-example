$ ->
  for k, v of $("#image_container").data("images")
    for image in v
      $("#image_container").append "<figure class='#{k}_image'>
      <img src=#{image['url']} class='img-rounded'>
      <figcaption>#{image['caption']}</figcaption>
      </figure>"
  $("figure").hide()

$ ->
  $(document).on "click", ".hash", (e) ->
    $(".hash").removeClass("disabled")
    $(".#{[e.target.innerText]}").addClass("disabled")
    $("figure").hide()
    $(".#{[e.target.innerText]}_image").show(500)