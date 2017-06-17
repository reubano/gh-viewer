debug_mobile = false
debug_prod = false
host = window?.location?.hostname ? require('os').hostname()
dev = host in ['localhost', 'tokpro.local', 'tokpro']
prod = not dev
cm_api_key = $PROCESS_ENV_CLOUD_MADE_API_KEY ? null
gh_api_key = $PROCESS_ENV_GITHUB_TOKEN_TH ? null

if dev and not debug_prod
  console.log 'development envrionment set'
  mode = 'development'
  api_logs = "http://localhost:8888/api/logs"
  age = 72 # in hours
else
  console.log 'production envrionment set'
  mode = 'production'
  api_logs = 'http://flogger.herokuapp.com/api/logs'
  age = 12 # in hours

ua = navigator?.userAgent?.toLowerCase()
list = 'iphone|ipod|ipad|android|blackberry|opera mini|opera mobi'
mobile_device = (/"#{list}"/).test ua?.toLowerCase()
force_mobile = (dev and debug_mobile)
mobile = mobile_device or force_mobile

console.log "host: #{host}"
console.log "mobile device: #{mobile}"
console.log "debug production: #{debug_prod}"

config =
  srchProviders:
    google: 'Google'
    openstreetmap: 'OpenStreetMap'
    esri: 'Esri'

  tileProviders:
    1: 'MapBox.reubano.ghdp3e73'
    2: 'OpenStreetMap'
    3: 'Esri.WorldTopoMap'
    4: 'CloudMade'

  options:
    icon: 'user'
    tileProvider: 3
    tpOptions: {maxZoom: 5, apiKey: cm_api_key, styleID: 1}
    srchProviderName: 'openstreetmap'
    zoomLevel: 2
    center: [20, 8]
    setView: true

  api_token: gh_api_key
  api_base: 'https://api.github.com/users'
  cm_api_key: cm_api_key
  login: 'reubano'
  mode: mode
  prod: prod
  debug_prod: debug_prod
  dev: dev
  api_logs: api_logs
  mobile: mobile
  max_age: age

module.exports = config
