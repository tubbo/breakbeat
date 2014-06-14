# For more information see: http://emberjs.com/guides/routing/

Breakbeat.Router.map ->
  @resource 'updates', ->
    @route 'index'
    @route 'new'
