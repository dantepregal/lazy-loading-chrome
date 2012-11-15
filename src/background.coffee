urlBlank = 'https://lazy-loading-chrome.googlecode.com/git/server/blank.html'#es posible leer el manifiesto pero asi me ahorro una request
parkTab = (tab)->
	if !tab.active
		if tab.url.substring(0, tab.url.indexOf '#') != urlBlank
			url = urlBlank + '#title=' + encodeURIComponent tab.title
			if tab.favIconUrl
				url += '&icon=' + encodeURIComponent tab.favIconUrl
			chrome.tabs.update tab.id, {'url': url, 'selected': false}

park = (tab) ->
	chrome.windows.get tab.windowId, populate: true, (window)->
		for t in window.tabs
			parkTab t
		setTimeout chrome.windows.remove, 1000, tab.windowId

chrome.browserAction.onClicked.addListener park

chrome.tabs.onActivated.addListener (activeInfo) ->
	chrome.tabs.sendMessage activeInfo.tabId, {'do': 'load'}, ->
