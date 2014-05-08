@Notes = new Meteor.Collection 'notes'

if Meteor.isClient
  Template.notes.notes = -> Notes.find {},
    transform: (note) ->
      note.htmlContent = -> note.content.autoLink?()
      note

  Template.notes.events =
      'submit #new_note': (event) ->
        input = $ '#new_note_name'
        note  = input.val().trim()

        if /([^\s])/.test note
          Notes.insert content: note
          input.val('')

        input.focus()
        event.preventDefault()
