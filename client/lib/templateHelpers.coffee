Template.registerHelper 'space', -> ' '

TemplateHelpers.add
    pluralize: (number, singular, plural) ->
        # single point so it's easier to internationalize later
        if number is 1
            singular
        else
            plural

    avatarUrl: (user) ->
        user.profile?.avatarUrl ? user.defaultAvatar ? '/default-avatar.jpg'

    displayName: (user) ->
        return 'nobody' unless user?
        # you *can* pass a profile, but then there's no username fallback
        profile = user.profile ? user
        assembled = if profile.first and profile.last
            "#{profile.first} #{profile.last}"
        profile.displayName ? profile.name ? assembled ? user.username

    playerName: (player) ->
        player.name ? TemplateHelpers.h.displayName player.user()

Template::bindDateDisplay = ->
    @.events
        'touchend .date-display': (event) ->
            if event.currentTarget.title
                alert event.currentTarget.title
