$(document).bind('page:change', function() {
  $('.ckeditor:eq(1)').each(function() {
    CKEDITOR.replace($(this).attr('id'),{
    	language : 'zh',
    	autoGrow_onStartup : false,
        extraPlugins : 'autogrow,smiley',
    });
  });
});