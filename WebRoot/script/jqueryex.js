function syncAjax(func) {
    var _async = $.ajaxSettings.async;
    $.ajaxSettings.async = false;
    try {
        func();
    }
    finally {
        $.ajaxSettings.async = _async;
    }
}
$.trim = function(text) {
    return (text || "").replace(/^[\s\xA0]+|[\s\xA0]+$/g, "");
};

function postJson(url, data, successCallback) {
    jQuery.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: successCallback,
        dataType: 'json'
    });
}

function syncGetJson(url, data, successCallback) {
    jQuery.ajax({
        url: url,
        data: data,
        success: successCallback,
        dataType: 'json',
        async: false
    });
}

function syncPostJson(url, data, successCallback) {
    jQuery.ajax({
        type: 'POST',
        url: url,
        data: data,
        success: successCallback,
        dataType: 'json',
        async: false
    });
}

function addFormDatas(data, moreDatas) {
    for(var key in moreDatas || {}) {
        data.push({name: key, value: moreDatas[key]});
    }
}