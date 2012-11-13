class @User extends Backbone.Model
  fullName: ->
    [@get('first_name'), @get('last_name')].join(' ').trim()
