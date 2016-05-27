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





$(document).keypress(
  (e) ->
    key = String.fromCharCode(e.which)
    if key == 'p'
      previewToggle()

    if key == 's'
#      sendDownloadMessage()
      getImage()
)

$ ->
  url = $('.ui-modal-close-box img')[0]['dataset']['src']
  img = document.createElement('img')
  img.src = url
  img.setAttribute('hidden', true)
  $('body').append(img)
#  img.id = 'ggsmd'
#  $('head').append('<meta name="referrer" content="always">')
#  a = document.createElement('a')
#  a.href=url
#  a.download=''
#  a.text='ddddd'
#  $('.user').append(a)


