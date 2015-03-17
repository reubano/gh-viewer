debug_mobile = false
debug_prod = false
host = window?.location?.hostname ? require('os').hostname()
dev = host in ['localhost', 'tokpro.local', 'tokpro']
prod = not dev
cm_api_key = $PROCESS_ENV_CLOUD_MADE_API_KEY ? null

if dev and not debug_prod
  console.log 'development envrionment set'
  mode = 'development'
  api_fetch = "/api/fetch"
  api_render = "/api/render"
  api_uploads = "/api/uploads"
  api_logs = "http://localhost:8888/api/logs"
  age = 72 # in hours
else
  console.log 'production envrionment set'
  mode = 'production'
  api_fetch = 'http://ongeza.herokuapp.com/api/fetch'
  api_render = 'http://ongeza.herokuapp.com/api/render'
  api_uploads = 'http://ongeza.herokuapp.com/api/uploads'
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
    google: L?.GeoSearch?.Provider?.Google
    openstreetmap: L?.GeoSearch?.Provider?.OpenStreetMap
    esri: L?.GeoSearch?.Provider?.Esri

  tileProviders:
    1: 'MapBox.reubano.ghdp3e73'
    2: 'OpenStreetMap'
    3: 'Esri.WorldTopoMap'
    4: 'CloudMade'

  options:
    icon: 'home'
    markerColor: 'green'
    markers: false
    tileProvider: 3
    tpOptions: {maxZoom: 5, apiKey: cm_api_key, styleID: 1}
    srchProviderName: 'openstreetmap'
    zoomLevel: 3
    setView: true

  api_token: $PROCESS_ENV_GITHUB_ACCOUNT_KEY ? null
  api_base: 'https://api.github.com/users'
  cm_api_key: cm_api_key
  login: 'reubano'
  mode: mode
  prod: prod
  debug_prod: debug_prod
  dev: dev
  api_fetch: api_fetch
  api_render: api_render
  api_uploads: api_uploads
  api_logs: api_logs
  mobile: mobile
  max_age: age

module.exports = config
