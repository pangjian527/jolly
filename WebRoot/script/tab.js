
(function(a) {
	a.fn.Switchable = function(m) {
		var b = a.extend( {}, a.fn.Switchable.Default, m);
		var i = a("." + b.nav + " > li", a(this)),  j = a("." + b.content, a(this));
		var h = 1, g = j.children().size(), d = j.children(":first").width(), k = j
				.children(":first").height();
		var f, l;		
		return this.each(function() {
			var n = function() {
				a.fn.Switchable.Effect[b.effect](j, i, h, l, b);
				if (++h * b.steps >= g) {
					h = 0
				}
			};			
			if (i.size()) {							
				if (b.event == "hover") {
					var o = null;
					i.hover(function() {
						if (f) {
							clearInterval(f)
						}
						h = i.index(this);
						if (!b.hoverInterval) {
							a.fn.Switchable.Effect[b.effect](j, i, h, l, b)
						} else {
							o = setTimeout(function() {
								a.fn.Switchable.Effect[b.effect](j, i, h,l, b)
							}, b.hoverInterval)
						}
					}, function() {
						if (o) {
							clearInterval(o)
						}
						if (f) {
							clearInterval(f)
						}						
					})
				}				
			}			
		})
	};
	a.fn.Switchable.Default = {
		event : "click",
		effect : "none",		
		speed : "normal",
		timer : 2000,
		nav : "J_nav",
		content : "J_content",
		steps : 1
	};
	a.fn.Switchable.Effect = {		
		fade : function(d, c, e, b, f) {
			d.children().eq(e).stop(true, true).fadeIn(f.speed).siblings().hide();
			if (c) {
				c.eq(e).addClass("hover").siblings().removeClass("hover")
			}
		}
	};	
})(jQuery);

var KISSDW2 = {
	tabs : function(b, c) {
		var a = {
			nav : "J_nav:eq(0)",
			content : "J_content:eq(0)"
		};
		if (c && !c.hoverInterval && c.event === "hover") {
			a.hoverInterval = 300
		}
		var d = jQuery.extend( {}, a, c);
		jQuery(b).Switchable(d)
	}
};

function setHomePage(f) {
	var b = document.URL.split("/");
	var c = "http://" + b[2] + "/";
	try {
		f.style.behavior = "url(#default#homepage)";
		f.setHomePage(c)
	} catch (d) {
		if (window.netscape) {
			try {
				netscape.security.PrivilegeManager
						.enablePrivilege("UniversalXPConnect")
			} catch (d) {
				alert("\u6b64\u64cd\u4f5c\u88ab\u6d4f\u89c8\u5668\u62d2\u7edd\uff01\n\u8bf7\u5728\u6d4f\u89c8\u5668\u5730\u5740\u680f\u8f93\u5165\u201cabout:config\u201d\u5e76\u56de\u8f66\n\u7136\u540e\u5c06[signed.applets.codebase_principal_support]\u8bbe\u7f6e\u4e3a'true'")
			}
			var a = Components.classes["@mozilla.org/preferences-service;1"]
					.getService(Components.interfaces.nsIPrefBranch);
			a.setCharPref("browser.startup.homepage", c)
		}
	}
}
function addFavorite() {
	var a = document.URL.split("/");
	var c = "http://" + a[2] + "/";
	var b = document.title;
	try {
		window.external.AddFavorite(c, b)
	} catch (d) {
		window.sidebar.addPanel(b, c, "")
	}
}
function copyURL() {
	var b = top.location.href;
	var d = document.title;
	if (window.clipboardData) {
		var a = d + "\n" + b;
		var c = window.clipboardData.setData("Text", a);
		if (c) {
			alert("\u590d\u5236\u6210\u529f\uff01\u6309Ctrl+V ,\u7c98\u8d34\u5230QQ\u6216\u5fae\u535a\u4e0a\u53d1\u7ed9\u4f60\u7684\u597d\u53cb\u4eec\u5427\uff01")
		}
	} else {
		prompt("\u6309Ctrl+C\u590d\u5236\u5f53\u524d\u7f51\u5740", b + " " + d)
	}
};
