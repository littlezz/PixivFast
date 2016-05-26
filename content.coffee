previewToggle =
  ()->
    $('._layout-thumbnail.ui-modal-trigger').click()


$(document).keypress(
  (e) ->
    key = String.fromCharCode(e.which)
    if key == 'p' or key=='P'
      previewToggle()
)




