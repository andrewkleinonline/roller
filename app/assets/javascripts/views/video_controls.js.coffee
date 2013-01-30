class R.Views.VideoControls extends Backbone.View

	initialize: ->
		_.bindAll @

		@el = '#controls'

		@setElement(@el)

		@model.on 'change:state', @render
		@render()

	render: () =>
		$('.play').html('<i class="icon-play">')
		switch @model.get('state')
			when 'paused'
				$button = $('.play')
				$button.html('<i class="icon-play">')
			when 'playing'
				$button = $('.play')
				$button.html('<i class="icon-pause">')


		$('.play').addClass(@model.get('state'))

		$('.play').addClass(@model.get('state'))
		@

	events:
		'click button.play' : 'toggleState'
		'click button.restart' : 'restart'

	toggleState: =>
		switch @model.get('state')
			when 'playing'
				@model.set 'state', 'paused'
				@model.set 'cue', @model.get('current')				
			when 'paused' then  @model.set 'state', 'playing'
			else throw 'invalid state'


	restart: =>
		@model.set 'cue', @model.get('start')
		@model.trigger 'change:cue'
		@model.set('state', 'play')

