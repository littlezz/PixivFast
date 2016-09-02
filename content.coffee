settings = {}



chrome.storage.sync.get(default_options, (items) ->
  settings = items
)


previewToggle =
  ()->
    $('._layout-thumbnail.ui-modal-trigger').click()




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
  $('#pixivfast_vbutton').click()



$(document).keypress(
  (e) ->
    key = String.fromCharCode(e.which)
    if key == 'p'
      previewToggle()

    if key == 's'
      give10star()
      getImage()
)


preload_image = () ->
  url = $('.ui-modal-close-box img')[0]['dataset']['src']
  img = document.createElement('img')
  img.src = url
  img.setAttribute('hidden', true)
  img.setAttribute('id', 'pixivfast_preload_img')
  $('body').append(img)


bigBookmarkImage = () ->
  for img in $('a div img')
    img.src = img.src.replace('150x150', '240x240')

  $('.image-item').css({"width":240, 'padding':'0px'})


inject10star = () ->
  $('#pixivfast_vbutton').click(() ->
    console.log('press vbutton')
    pixiv.rating.apply(10)
  )




$ ->
  vbutton = document.createElement('button')
  vbutton.setAttribute('hidden', true)
  vbutton.setAttribute('id', 'pixivfast_vbutton')
  $('body').append(vbutton)
  inject_script = '(' + inject10star + ')();'
  script = document.createElement('script')
  script.textContent = inject_script
  (document.head||document.documentElement).appendChild(script)
  script.remove();

  currentURL = window.location.href
  console.log 'now: ' + currentURL
  if currentURL.indexOf('member_illust.php') >= 0
    if settings.preload
      console.log "preload"
      preload_image()
  else if currentURL.indexOf('bookmark.php') >= 0
    if settings.big_bookmark
      console.log 'big bookmark'
      bigBookmarkImage()


