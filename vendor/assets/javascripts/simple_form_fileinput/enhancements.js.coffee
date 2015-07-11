$ ->
  # The plugin code
  $.fn.draghover = (options={})->
    defaults =
      fireDragLeaveOnChild: true
    settings = $.extend true, defaults, options
    @each ->
      collection = $()
      self = $(@)
      self.on 'dragenter', (e)->
        self.trigger 'draghoverstart'  if collection.length is 0
        collection = collection.add(e.target)
      self.on 'dragleave', (e)->
        console.log e
        console.log "#{e.originalEvent.pageX}, #{e.originalEvent.pageY}"
        if !settings.fireDragLeaveOnChild && e.originalEvent.pageX != 0
          e.preventDefault()
          return false
        collection = collection.not(e.target)
        self.trigger "draghoverend"  if collection.length is 0
      self.on 'drop', (e)->
        collection = collection.not(e.target)
        self.trigger "draghoverend"  if collection.length is 0

  $(document).ready ->
    $(window).draghover({fireDragLeaveOnChild: false}).on
      draghoverstart: ->
        $('.file-input-wrapper').addClass('file-in-window')
      draghoverend: ->
        $('.file-input-wrapper').removeClass('file-in-window')
    $('.file-input-wrapper input[type=file]').draghover().on
      draghoverstart: ->
        $(@).parent().addClass('file-hovering')
      draghoverend: ->
        $(@).parent().removeClass('file-hovering')