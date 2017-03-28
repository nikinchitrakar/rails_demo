
$ ->
  $("a[data-remote]").on "ajax:success", (e, data, status, xhr) ->
    alert "The comment was deleted."

$(document).ready ->
  $("#new_article").on("ajax:success", (e, data, status, xhr) ->
    $("#new_article").append xhr.responseText
  ).on "ajax:error", (e, xhr, status, error) ->
    $("#new_article").append "<p>ERROR</p>"