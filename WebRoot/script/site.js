/**
 * Created by IntelliJ IDEA.
 * User: zzl
 * Date: 11-6-27
 * To change this template use File | Settings | File Templates.
 */
function _is_form_dirty(form)
{
    var el, opt, hasDefault, i = 0, j;
    while (el = form.elements[i++]) {
        switch (el.type) {
        case 'text' :
        case 'textarea' :
        case 'hidden' :
            if (el.value != el.defaultValue) return true;
            break;
        case 'checkbox' :
        case 'radio' :
            if (el.checked != el.defaultChecked) return true;
            break;
        case 'select-one' :
        case 'select-multiple' :
            j = 0,hasDefault = false;
            while (opt = el.options[j++])
                if (opt.defaultSelected) hasDefault = true;
            j = hasDefault ? 0 : 1;
            while (opt = el.options[j++])
                if (opt.selected != opt.defaultSelected) return true;
            break;
        }
    }
    return false;
}

function gotoUrl(url, target) {
    var useLink = $.browser.msie;
    if (useLink) {
        var $link = $('#_gotoUrl');
        if ($link.length == 0) {
            var html = '<a href="' + url + '" style="display:none" id="_gotoUrl">gotoUrl</a>';
            $('body').append(html);
            $link = $('#_gotoUrl');
        }
        $link.attr('href', url);
        $link.attr('target', target || '');
        $link[0].click();
    }
    else if (target) {
        window.open(url, target);
    }
    else {
        window.location = url;
    }
    return false;
}

function _reset(clear) {
    var evt = window.event;
    var $frm = $(evt.srcElement).parents('form:first');
    if (typeof(clear) == 'undefined') {
        clear = !_is_form_dirty($frm[0]);
    }
    if (evt.shiftKey || clear) {
        $frm.clearForm();
    }
    else {
        $frm.resetForm();
    }
}

function returnUrl(uri) {
    var url = _loadUrl(uri);
    window.location = url;
}

if (window.$) {
    $(function() {
        _saveUrl();
        _updateReturnUrlFields();
    });
}

function _updateReturnUrlFields() {
    $(':hidden[name=returnUrl]').each(function(index) {
        var uri = this.value;
        this.value = _loadUrl(uri);
    });
}

function _loadUrl(uri) {
    if (uri.charAt(0) != '/' && uri.indexOf('http:') == -1) {
        var path = location.pathname;
        uri = path.substring(0, path.lastIndexOf('/') + 1) + uri;
    }
    if (parent._urlDict) {
        var qs = (parent._urlDict[uri] || '');
        return uri + (qs ? '?' + qs : '');
    }
    var urls = (window.name || '');
    var key = '\n' + uri + '?';
    var pos = urls.indexOf(key);
    if (pos == -1) {
        return uri;
    }
    var pos2 = urls.indexOf('\n', pos + key.length);
    if (pos2 == -1) {
        pos2 = urls.length;
    }
    return urls.substring(pos + 1, pos2);
}

function _saveUrl() {
    var qs = location.search;
    qs = qs && qs.substr(1);
    var uri = location.pathname;
    if (parent._urlDict) {
        parent._urlDict[uri] = qs;
        return;
    }
    var urls = window.name || '';
    var key = '\n' + uri + '?';
    var pos = urls.indexOf(key);
    if (pos == -1) {
        urls += key + qs;
    }
    else {
        var pos2 = urls.indexOf('\n', pos + key.length);
        if (pos2 == -1) {
            pos2 = urls.length;
        }
        urls = urls.substring(0, pos) + key + qs + urls.substr(pos2);
    }
    window.name = urls;
}
