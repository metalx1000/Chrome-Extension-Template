var s = document.createElement('script');
// TODO: add "script.js" to web_accessible_resources in manifest.json
s.src = chrome.extension.getURL('html_code.js');
s.onload = function() {
      this.parentNode.removeChild(this);
};

(document.head||document.documentElement).appendChild(s);
$(document).ready(function(){
  console.log("Script Running");
}
