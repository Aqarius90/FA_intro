(function() {
  window.addEventListener('load', function() {
    var editor;
    if (document.querySelectorAll('[data-editable]').length === 0) {
      return;
    }
    ContentTools.StylePalette.add([new ContentTools.Style('3rd-party', 'third-party', ['h3']), new ContentTools.Style('Above heading', 'above-heading', ['img']), new ContentTools.Style('Definition', 'definition', ['p']), new ContentTools.Style('Framed', 'framed', ['iframe', 'video']), new ContentTools.Style('Note', 'note', ['p']), new ContentTools.Style('Vertical header', 'v-head', ['table']), new ContentTools.Style('Button', 'Button--alt', ['a']), new ContentTools.Style('un-bulleted', 'plain-list', ['ul'])]);
    ContentTools.Tools.Heading.tagName = 'h2';
    ContentTools.Tools.Subheading.tagName = 'h3';
    editor = ContentTools.EditorApp.get();
    editor.init('[data-editable]', 'data-name');
    editor.addEventListener('saved', function(ev) {
      var content, handleResponse, name, payload, regions, xhr;
      regions = ev.detail().regions;
      if (Object.keys(regions).length === 0) {
        return;
      }
      editor.busy(true);
      payload = new FormData();
      payload.append('__page__', window.location.pathname);
      for (name in regions) {
        content = regions[name];
        payload.append(name, content);
      }
      handleResponse = function(ev) {
        var readyState, status, text;
        readyState = ev.target.readyState;
        text = ev.target.responseText;
        status = ev.target.status;
        if (readyState !== 4) {
          return;
        }
        editor.busy(false);
        if (parseInt(status) === 200) {
          addPermalinks();
          return new ContentTools.FlashUI('ok');
        } else {
          return new ContentTools.FlashUI('no');
        }
      };
      xhr = new XMLHttpRequest();
      xhr.addEventListener('readystatechange', handleResponse);
      xhr.open('POST', '/save-page');
      return xhr.send(payload);
    });
    editor.addEventListener('start', function() {
      return removePermalinks();
    });
    return editor.addEventListener('revert', function() {
      return addPermalinks();
    });
  });

}).call(this);
