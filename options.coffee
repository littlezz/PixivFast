#@show = () ->
#  chrome.downloads.search({}, (e) ->
#    console.log(e[0])
#    $('#s').text(e[0]['filename'])
#
#  )

#show()



load_options = () ->
  chrome.storage.sync.get(default_options, (items) ->
    for id, val of items
      $('#'+id).prop('checked', val)
      console.log id+val
      console.log '#'+id
  )


load_options()

$('input:checkbox').change(() ->
  val = @checked
  id = @id
  toset = {}
  toset[id] = val
  chrome.storage.sync.set(toset)
)
