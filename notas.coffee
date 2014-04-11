@Notes = new Meteor.Collection 'notes'

if Meteor.isClient
  Template.notes.notes = -> Notes.find {},
    transform: (note) ->
      note.htmlContent = -> note.content.autoLink?()
      note

  Template.notes.events =
      'submit #new_note': (event) ->
        event.preventDefault()
        Notes.insert content: $('#new_note_name').val()
        $('#new_note_name').val('')
