class App.Views.Notes extends Backbone.View
  template: JST['app/templates/notes.us']

  events:
    'click a': 'showNote'

  render: =>
    @$el.html(@template(notes: @collection))
    @collection.forEach(@renderNote)
    this

  showNote: (e) =>
    $this = $(e.currentTarget)
    Backbone.history.navigate($this.attr('href'), trigger: true)
    false

  renderNote: (note) =>
    view = new App.Views.Note(model: note)
    @$('ul.notes').append(view.render().el)
