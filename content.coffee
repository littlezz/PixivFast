previewToggle =
  ()->
    $('._layout-thumbnail.ui-modal-trigger').click()


sendDownloadMessage =
  () ->
    url = $('.ui-modal-close-box img')[0]['dataset']['src']
    console.log('find url'+url)

    chrome.runtime.sendMessage({
      'action': 'download',
      'url': url,
      'referer': window.location.href
    })

@getImage =
  () ->
    url = $('.ui-modal-close-box img')[0]['dataset']['src']
    arr = url.split('/')
    name = arr[arr.length - 1]
    xhr = new XMLHttpRequest()
    xhr.open('GET', url, true)
    xhr.responseType = 'blob'
    xhr.onload =
      (e) ->
        if @status == 200
          blob = @response
          a = document.createElement('a')
          a.href = window.URL.createObjectURL(blob)
          a.download = name
          a.click()
    xhr.send()



give10star = () ->
  pixiv.ranking.apply(10)



$(document).keypress(
  (e) ->
    key = String.fromCharCode(e.which)
    if key == 'p'
      previewToggle()

    if key == 's'
      getImage()
      give10star()

#    if key == 'q'
#      press = jQuery.Event("keypress");
#      press.ctrlKey = false;
#      press.which = 76;
#      $(document).trigger(press);

)

$ ->
  url = $('.ui-modal-close-box img')[0]['dataset']['src']
  img = document.createElement('img')
  img.src = url
  img.setAttribute('hidden', true)
  $('body').append(img)


