/*
 * jQuery Templates Plugin 1.0.0pre
 * http://github.com/jquery/jquery-tmpl
 * Requires jQuery 1.4.2
 *
 * Copyright Software Freedom Conservancy, Inc.
 * Dual licensed under the MIT or GPL Version 2 licenses.
 * http://jquery.org/license
 */
!function(e){function t(t,n,i,o){var a={data:o||0===o||o===!1?o:n?n.data:{},_wrap:n?n._wrap:null,tmpl:null,parent:n||null,nodes:[],calls:c,nest:u,wrap:d,html:h,update:f};return t&&e.extend(a,t,{nodes:[],parent:n}),i&&(a.tmpl=i,a._ctnt=a._ctnt||a.tmpl(e,a),a.key=++C,(O.length?b:v)[C]=a),a}function n(t,o,a){var r,s=a?e.map(a,function(e){return"string"==typeof e?t.key?e.replace(/(<\w+)(?=[\s>])(?![^>]*_tmplitem)([^>]*)/g,"$1 "+g+'="'+t.key+'" $2'):e:n(e,t,e._ctnt)}):t;return o?s:(s=s.join(""),s.replace(/^\s*([^<\s][^<]*)?(<[\w\W]+>)([^>]*[^>\s])?\s*$/,function(t,n,o,a){r=e(o).get(),l(r),n&&(r=i(n).concat(r)),a&&(r=r.concat(i(a)))}),r?r:i(s))}function i(t){var n=document.createElement("div");return n.innerHTML=t,e.makeArray(n.childNodes)}function o(t){return new Function("jQuery","$item","var $=jQuery,call,__=[],$data=$item.data;with($data){__.push('"+e.trim(t).replace(/([\\'])/g,"\\$1").replace(/[\r\t\n]/g," ").replace(/\$\{([^\}]*)\}/g,"{{= $1}}").replace(/\{\{(\/?)(\w+|.)(?:\(((?:[^\}]|\}(?!\}))*?)?\))?(?:\s+(.*?)?)?(\(((?:[^\}]|\}(?!\}))*?)\))?\s*\}\}/g,function(t,n,i,o,a,s,l){var c,u,d,h=e.tmpl.tag[i];if(!h)throw"Unknown template tag: "+i;return c=h._default||[],s&&!/\w$/.test(a)&&(a+=s,s=""),a?(a=r(a),l=l?","+r(l)+")":s?")":"",u=s?a.indexOf(".")>-1?a+r(s):"("+a+").call($item"+l:a,d=s?u:"(typeof("+a+")==='function'?("+a+").call($item):("+a+"))"):d=u=c.$1||"null",o=r(o),"');"+h[n?"close":"open"].split("$notnull_1").join(a?"typeof("+a+")!=='undefined' && ("+a+")!=null":"true").split("$1a").join(d).split("$1").join(u).split("$2").join(o||c.$2||"")+"__.push('"})+"');}return __;")}function a(t,i){t._wrap=n(t,!0,e.isArray(i)?i:[E.test(i)?i:e(i).html()]).join("")}function r(e){return e?e.replace(/\\'/g,"'").replace(/\\\\/g,"\\"):null}function s(e){var t=document.createElement("div");return t.appendChild(e.cloneNode(!0)),t.innerHTML}function l(n){function i(n){function i(e){e+=c,r=u[e]=u[e]||t(r,v[r.parent.key+c]||r.parent)}var o,a,r,s,l=n;if(s=n.getAttribute(g)){for(;l.parentNode&&1===(l=l.parentNode).nodeType&&!(o=l.getAttribute(g)););o!==s&&(l=l.parentNode?11===l.nodeType?0:l.getAttribute(g)||0:0,(r=v[s])||(r=b[s],r=t(r,v[l]||b[l]),r.key=++C,v[C]=r),I&&i(s)),n.removeAttribute(g)}else I&&(r=e.data(n,"tmplItem"))&&(i(r.key),v[r.key]=r,l=e.data(n.parentNode,"tmplItem"),l=l?l.key:0);if(r){for(a=r;a&&a.key!=l;)a.nodes.push(n),a=a.parent;delete r._ctnt,delete r._wrap,e.data(n,"tmplItem",r)}}var o,a,r,s,l,c="_"+I,u={};for(r=0,s=n.length;s>r;r++)if(1===(o=n[r]).nodeType){for(a=o.getElementsByTagName("*"),l=a.length-1;l>=0;l--)i(a[l]);i(o)}}function c(e,t,n,i){return e?void O.push({_:e,tmpl:t,item:this,data:n,options:i}):O.pop()}function u(t,n,i){return e.tmpl(e.template(t),n,i,this)}function d(t,n){var i=t.options||{};return i.wrapped=n,e.tmpl(e.template(t.tmpl),t.data,i,t.item)}function h(t,n){var i=this._wrap;return e.map(e(e.isArray(i)?i.join(""):i).filter(t||"*"),function(e){return n?e.innerText||e.textContent:e.outerHTML||s(e)})}function f(){var t=this.nodes;e.tmpl(null,null,null,this).insertBefore(t[0]),e(t).remove()}var m,p=e.fn.domManip,g="_tmplitem",E=/^[^<]*(<[\w\W]+>)[^>]*$|\{\{\! /,v={},b={},T={key:0,data:{}},C=0,I=0,O=[];e.each({appendTo:"append",prependTo:"prepend",insertBefore:"before",insertAfter:"after",replaceAll:"replaceWith"},function(t,n){e.fn[t]=function(i){var o,a,r,s,l=[],c=e(i),u=1===this.length&&this[0].parentNode;if(m=v||{},u&&11===u.nodeType&&1===u.childNodes.length&&1===c.length)c[n](this[0]),l=this;else{for(a=0,r=c.length;r>a;a++)I=a,o=(a>0?this.clone(!0):this).get(),e(c[a])[n](o),l=l.concat(o);I=0,l=this.pushStack(l,t,c.selector)}return s=m,m=null,e.tmpl.complete(s),l}}),e.fn.extend({tmpl:function(t,n,i){return e.tmpl(this[0],t,n,i)},tmplItem:function(){return e.tmplItem(this[0])},template:function(t){return e.template(t,this[0])},domManip:function(t,n,i){if(t[0]&&e.isArray(t[0])){for(var o,a=e.makeArray(arguments),r=t[0],s=r.length,l=0;s>l&&!(o=e.data(r[l++],"tmplItem")););o&&I&&(a[2]=function(t){e.tmpl.afterManip(this,t,i)}),p.apply(this,a)}else p.apply(this,arguments);return I=0,!m&&e.tmpl.complete(v),this}}),e.extend({tmpl:function(i,o,r,s){var l,c=!s;if(c)s=T,i=e.template[i]||e.template(null,i),b={};else if(!i)return i=s.tmpl,v[s.key]=s,s.nodes=[],s.wrapped&&a(s,s.wrapped),e(n(s,null,s.tmpl(e,s)));return i?("function"==typeof o&&(o=o.call(s||{})),r&&r.wrapped&&a(r,r.wrapped),l=e.isArray(o)?e.map(o,function(e){return e?t(r,s,i,e):null}):[t(r,s,i,o)],c?e(n(s,null,l)):l):[]},tmplItem:function(t){var n;for(t instanceof e&&(t=t[0]);t&&1===t.nodeType&&!(n=e.data(t,"tmplItem"))&&(t=t.parentNode););return n||T},template:function(t,n){return n?("string"==typeof n?n=o(n):n instanceof e&&(n=n[0]||{}),n.nodeType&&(n=e.data(n,"tmpl")||e.data(n,"tmpl",o(n.innerHTML))),"string"==typeof t?e.template[t]=n:n):t?"string"!=typeof t?e.template(null,t):e.template[t]||e.template(null,E.test(t)?t:e(t)):null},encode:function(e){return(""+e).split("<").join("&lt;").split(">").join("&gt;").split('"').join("&#34;").split("'").join("&#39;")}}),e.extend(e.tmpl,{tag:{tmpl:{_default:{$2:"null"},open:"if($notnull_1){__=__.concat($item.nest($1,$2));}"},wrap:{_default:{$2:"null"},open:"$item.calls(__,$1,$2);__=[];",close:"call=$item.calls();__=call._.concat($item.wrap(call,__));"},each:{_default:{$2:"$index, $value"},open:"if($notnull_1){$.each($1a,function($2){with(this){",close:"}});}"},"if":{open:"if(($notnull_1) && $1a){",close:"}"},"else":{_default:{$1:"true"},open:"}else if(($notnull_1) && $1a){"},html:{open:"if($notnull_1){__.push($1a);}"},"=":{_default:{$1:"$data"},open:"if($notnull_1){__.push($.encode($1a));}"},"!":{open:""}},complete:function(){v={}},afterManip:function(t,n,i){var o=11===n.nodeType?e.makeArray(n.childNodes):1===n.nodeType?[n]:[];i.call(t,n),l(o),I++}})}(jQuery);