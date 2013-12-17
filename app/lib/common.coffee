# _ = _ ? require 'underscore'

Common =
  convertData: (collection) ->
    endRows = []
    durRows = []
    maxTime = 5
    minTime = 5

    collection.each (model) ->
      created = model.get 'created_at'
      date = moment(created).format('MM-DD-YYYY')
      time = moment(created).format('HH:mm:ss').split(':')
      start = (time[0] * 60) + (time[1] * 1) + (time[2] / 60)
      end_val = parseFloat start.toFixed(3)
      dur_val = JSON.stringify(model.get('payload')).length / 60
      dur_val = parseFloat dur_val.toFixed(3)
      dur_val = if dur_val > maxTime then maxTime else dur_val
      dur_val = if dur_val < minTime then minTime else dur_val
      endRows.push {label: date, value: end_val}
      durRows.push {label: date, value: dur_val}

    data = [{key: 'End', values: endRows}, {key: 'Duration', values: durRows}]

module.exports = Common
