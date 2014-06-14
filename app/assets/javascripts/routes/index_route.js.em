class Breakbeat.IndexRoute extends Em.Route
  model: -> @store.find 'service'
