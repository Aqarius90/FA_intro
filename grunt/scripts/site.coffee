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


  #main nav functions
  
    document.querySelector('.hide-toggle').addEventListener 'click', () ->
        console.log('clicked')
        $target = '#' + $(this).data('target')
        document.querySelector('.tohide').not(target).hide()
        document.querySelector(target).show()
        document.querySelector('html, body').animate { scrollTop: 0 }, 'slow'
        return

        document.querySelector('#Intro').show()
        document.querySelector('html, body').animate { scrollTop: 0 }, 'slow'
        return