/**
 * @license Copyright (c) 2003-2016, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */
"use strict";!function(){function e(e){function t(){r=e.document,s=r[CKEDITOR.env.ie?"getBody":"getDocumentElement"](),l=CKEDITOR.env.quirks?r.getBody():r.getDocumentElement(),c=CKEDITOR.dom.element.createFromHtml('<span style="margin:0;padding:0;border:0;clear:both;width:1px;height:1px;display:block;">'+(CKEDITOR.env.webkit?"&nbsp;":"")+"</span>",r)}function n(){var t=e.getCommand("maximize");return!e.window||t&&t.state==CKEDITOR.TRISTATE_ON}function i(){s.append(c);var e=c.getDocumentPosition(r).y+c.$.offsetHeight;return c.remove(),e}function o(){f&&l.setStyle("overflow-y","hidden");var t=e.window.getViewPaneSize().height,n=i();n+=u,n=Math.max(n,d),n=Math.min(n,h),n!=t&&a!=n&&(n=e.fire("autoGrow",{currentHeight:t,newHeight:n}).newHeight,e.resize(e.container.getStyle("width"),n,!0),a=n),f||(h>n&&l.$.scrollHeight>l.$.clientHeight?l.setStyle("overflow-y","hidden"):l.removeStyle("overflow-y"))}var a,r,s,l,c,u=e.config.autoGrow_bottomSpace||0,d=void 0!==e.config.autoGrow_minHeight?e.config.autoGrow_minHeight:200,h=e.config.autoGrow_maxHeight||1/0,f=!e.config.autoGrow_maxHeight;e.addCommand("autogrow",{exec:o,modes:{wysiwyg:1},readOnly:1,canUndo:!1,editorFocus:!1});var m={contentDom:1,key:1,selectionChange:1,insertElement:1,mode:1};for(var g in m)e.on(g,function(e){"wysiwyg"==e.editor.mode&&setTimeout(function(){return n()?void(a=null):(o(),void(f||o()))},100)});e.on("afterCommandExec",function(e){"maximize"==e.data.name&&"wysiwyg"==e.editor.mode&&(e.data.command.state==CKEDITOR.TRISTATE_ON?l.removeStyle("overflow-y"):o())}),e.on("contentDom",t),t(),e.config.autoGrow_onStartup&&e.execCommand("autogrow")}CKEDITOR.plugins.add("autogrow",{init:function(t){t.elementMode!=CKEDITOR.ELEMENT_MODE_INLINE&&t.on("instanceReady",function(){t.editable().isInline()?t.ui.space("contents").setStyle("height","auto"):e(t)})}})}();