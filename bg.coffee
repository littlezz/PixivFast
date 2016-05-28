

chrome.runtime.onMessage.addListener(
  (request, sender, sendResponse) ->
    if request.action == "download"
      url = request.url
      console.log('ref'+request.referer)
      chrome.downloads.download({
        url: url,
        saveAs: true,
      })
)

console.log(pixiv)
