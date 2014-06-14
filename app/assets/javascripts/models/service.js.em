# for more details see: http://emberjs.com/guides/models/defining-models/

class Breakbeat.Service extends DS.Model
  name: DS.attr 'string'
  url: DS.attr 'string'
  status: DS.attr 'string'
  statusMessage: DS.attr 'string'
