getParam = (name) ->
	res = ''
	hash = window.location.hash
	begin = hash.indexOf name
	if begin >0
		begin += name.length+1 #plus 1 for the =
		end = hash.indexOf '&', begin
		if end >0 then res = hash.substring begin, end
		else res = hash.substr begin
	return decodeURIComponent res

chrome.extension.onMessage.addListener (message, sender, sendResponse) ->
	if message['do'] == 'load'
		history.back()

window.onload = ->
	chrome.extension.sendMessage 'ok'

title = getParam 'title'
if title
	document.title = title

favicon = getParam 'icon'
if favicon
	document.getElementById('icon').href = favicon

console.info(favicon)