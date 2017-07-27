# NAVIGATION
# --
# Allows for open/ close of navigation in mobile.

# Site pop up
# --
# Once clicked, display pop-up over all else on page.*/
popUpToggles = document.querySelectorAll('.pop-up-toggle')

for popUpToggle in popUpToggles 
	popUpToggle.addEventListener 'click', () ->		
    	document.querySelector('.body').classList.toggle('body--pop-up-active')
    	removeVideo()

document.querySelector('.pop-up__content').addEventListener 'click', (ev) ->
	ev.stopPropagation()

videoLinks = document.querySelectorAll('.video-link')

moveVideo = (video) ->
	destination = document.querySelector('.pop-up__video')
	videoUrl = video.getAttribute('data-video-url')
	destination.setAttribute('src', videoUrl)

removeVideo = () ->
	destination = document.querySelector('.pop-up__video')
	destination.setAttribute('src', '')

addEvent = (el, type, handler) ->
	if el.attachEvent
		el.attachEvent('on'+type, handler)
	else
		el.addEventListener(type, handler)
			
for videoLink in videoLinks 
	videoLink.addEventListener 'click', (ev) ->		
		moveVideo(this)