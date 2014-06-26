@Notes = new Meteor.Collection 'notes'

if Meteor.isClient
  Template.notes.notes = -> Notes.find {},
    transform: (note) ->
      note.htmlContent = -> note.content.autoLink?()
      note

  Template.notes.events =
      'submit #new-note': (event) ->
        input = $ '#new-note-name'
        note  = input.val().trim()

        if note
          Notes.insert content: note
          input.val ''

        input.focus()
        event.preventDefault()
