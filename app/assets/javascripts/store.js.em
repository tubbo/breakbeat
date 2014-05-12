class Breakbeat.Store extends DS.Store

# Override the default adapter with the `DS.ActiveModelAdapter` which
# is built to work nicely with the ActiveModel::Serializers gem.
class Breakbeat.ApplicationAdapter extends DS.ActiveModelAdapter
