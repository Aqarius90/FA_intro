window.addEventListener 'load', () ->

    # Permalinks for headings with Ids
    window.addPermalinks = () ->
        headings = document.querySelectorAll(
            '.formatted h2[id], .formatted h3[id]'
            )
        for heading in headings
            headingId = heading.getAttribute('id')
            heading.insertAdjacentHTML(
                'beforeend',
                " <a href='##{headingId}' class='permalink'>¶</a>"
                )

    window.removePermalinks = () ->
        permalinks = document.querySelectorAll(
            '.formatted h2[id] a.permalink, .formatted h3[id] a.permalink'
            )
        for permalink in permalinks
            permalink.parentNode.removeChild(permalink);

    addPermalinks()
