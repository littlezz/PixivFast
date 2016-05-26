previewToggle = ()->


$(document).keypress(
  (e) ->
    keycode = e.which()
    if keycode == 115
      previewToggle()
)


