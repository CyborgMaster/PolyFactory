inject_page_script = (script_file) ->
  # script_file lives in the extension
  script = document.createElement "script"
  script.setAttribute "type", "text/javascript"
  script.setAttribute "src", chrome.extension.getURL script_file
  document.documentElement.appendChild script
  document.documentElement.removeChild script

inject_page_script 'build/factory.js'
