# for more details see: http://emberjs.com/guides/models/defining-models/

class Breakbeat.User extends DS.Model
  email: DS.attr 'string'
  passwordDigest: DS.attr 'string'
