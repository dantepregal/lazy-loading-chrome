// Generated by CoffeeScript 1.6.1
(function() {
  var favicon, getParam, title;

  getParam = function(name) {
    var begin, end, hash, res;
    res = '';
    hash = window.location.hash;
    begin = hash.indexOf(name);
    if (begin > 0) {
      begin += name.length + 1;
      end = hash.indexOf('&', begin);
      if (end > 0) {
        res = hash.substring(begin, end);
      } else {
        res = hash.substr(begin);
      }
    }
    return decodeURIComponent(res);
  };

  chrome.extension.onMessage.addListener(function(message, sender, sendResponse) {
    if (message['do'] === 'load') {
      return history.back();
    }
  });

  window.onload = function() {
    chrome.extension.sendMessage('ok');
    return document.getElementById('go-back-link').style.display = 'none';
  };

  title = getParam('title');

  if (title) {
    document.title = title;
  }

  favicon = getParam('icon');

  if (favicon) {
    document.getElementById('icon').href = favicon;
  }

  console.info(favicon);

}).call(this);
