$ ->
  # The plugin code
  $.fn.draghover = (options)->
    @each ->
      collection = $()
      self = $(@)
      self.on "dragenter", (e)->
        self.trigger "draghoverstart"  if collection.length is 0
        collection = collection.add(e.target)
      self.on "dragleave drop", (e)->
        collection = collection.not(e.target)
        self.trigger "draghoverend"  if collection.length is 0

  $(document).ready ->
    $(window).draghover().on
      draghoverstart: ->
        $('.file-input-wrapper').addClass('file-in-window')
      draghoverend: ->
        $('.file-input-wrapper').removeClass('file-in-window')
    $('.file-input-wrapper input[type=file]').draghover().on
      draghoverstart: ->
        $(@).parent().addClass('file-hovering')
      draghoverend: ->
        $(@).parent().removeClass('file-hovering')