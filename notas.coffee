@Notes = new Meteor.Collection 'notes'

if Meteor.isClient
  Template.notes.notes = -> Notes.find()

  Template.notes.events =
      'submit #new_note': (event) ->
        event.preventDefault()
        Notes.insert content: $('#new_note_name').val()
        $('#new_note_name').val('')

if Meteor.isServer
  Meteor.startup ->
    # code to run on server at startup
