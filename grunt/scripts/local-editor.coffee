window.addEventListener 'load', () ->

    # Check the page contains editable content
    if document.querySelectorAll('[data-editable]').length == 0
        return

    # Build a palette of styles
    ContentTools.StylePalette.add([
        new ContentTools.Style('3rd-party', 'third-party', ['h3']),
        new ContentTools.Style('Above heading', 'above-heading', ['img']),
        new ContentTools.Style('Definition', 'definition', ['p']),
        new ContentTools.Style('Framed', 'framed', ['iframe', 'video']),
        new ContentTools.Style('Note', 'note', ['p']),
        new ContentTools.Style('Vertical header', 'v-head', ['table']),
        new ContentTools.Style('Button', 'Button--alt', ['a']),
        new ContentTools.Style('un-bulleted', 'plain-list', ['ul'])
        ])

    # Modify the behaviour of the heading tools to be h2 and h3
    ContentTools.Tools.Heading.tagName = 'h2'
    ContentTools.Tools.Subheading.tagName = 'h3'

    # Initialize the editor
    editor = ContentTools.EditorApp.get()
    editor.init('[data-editable]', 'data-name')

    editor.addEventListener 'saved', (ev) ->
        # Handle the page being saved
        regions = ev.detail().regions

        if Object.keys(regions).length == 0
            return

        # Mark the ignition as busy while we save the page
        editor.busy(true)

        # Build the payload to send to the server
        payload = new FormData()
        payload.append('__page__', window.location.pathname)
        for name, content of regions
            payload.append(name, content)

        # Save the changes
        handleResponse = (ev) ->
            readyState = ev.target.readyState
            text = ev.target.responseText
            status = ev.target.status

            # Look for done response
            if readyState != 4
                return

            # No matter the result revert the editor state from busy
            editor.busy(false)

            # Handle the result of the upload
            if parseInt(status) is 200

                # Re-instate permalinks
                addPermalinks()

                # Trigger a flash to indicate the save has been successful
                new ContentTools.FlashUI('ok')

            else
                # Trigger a flash to indicate the save has been successful
                new ContentTools.FlashUI('no')

        xhr = new XMLHttpRequest()
        xhr.addEventListener('readystatechange', handleResponse)
        xhr.open('POST', '/save-page')
        xhr.send(payload)

    editor.addEventListener 'start', () ->
        # Remove permalinks during editing
        removePermalinks()

    editor.addEventListener 'revert', () ->
        # Re-instate permalinks
        addPermalinks()