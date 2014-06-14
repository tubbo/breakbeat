
class Breakbeat.Report extends DS.Model
  kind: DS.attr 'string'
  description: DS.attr 'string'
  service: DS.belongsTo 'Breakbeat.Service'
