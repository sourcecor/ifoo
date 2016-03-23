// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
window.semantic = {
  handler: {}
};
semantic.menu = {};

// ready event
semantic.menu.ready = function() {

  // selector cache
  var
    $sortingPanel = $('.sorting_panel'),
    $navItem      = $('.ui .container .item'),
    $dropdownItem = $('.menu .dropdown.item'),
    $popupItem    = $('.popup.example .browse.item'),
    $menuItem     = $('.menu a.item, .menu .link.item').not($dropdownItem).not($navItem),
    $dropdown     = $('.menu .ui.dropdown'),
    // alias
    handler = {

      activate: function() {
        if(!$(this).hasClass('dropdown browse')) {
          $(this)
            .addClass('active')
            .closest('.ui.menu')
            .find('.item')
              .not($(this))
              .removeClass('active')
          ;
        }
      }

    }
  ;
  //
  $('#sidemenu')
    .on('click', function(){
	  $('.ui.sidebar')
	    .sidebar('toggle')
		;
  });

	$('.message .close')
		.on('click', function() {
			$(this)
				.closest('.message')
				.transition('fade')
			;
		})
	;
  //
  $dropdown
    .dropdown({
      on: 'hover'
    })
  ;

  $('.ui.accordion').accordion();

  $('.main.container .ui.search')
    .search({
      type: 'category',
      apiSettings: {
        action: 'categorySearch'
      }
    })
  ;

  $('.school.example .browse.item')
    .popup({
      popup     : '.admission.popup',
      hoverable : true,
      position  : 'bottom left',
      delay     : {
        show: 300,
        hide: 800
      }
    })
  ;

  $popupItem
    .popup({
      inline   : true,
      hoverable: true,
      popup    : '.fluid.popup',
      position : 'bottom left',
      delay: {
        show: 300,
        hide: 800
      }
    })
  ;
  //
  $('.ui.sticky')
    .sticky({
      offset       : 60,
      context: '.ui.green.segment'
    })
  ;
  //
  $('.ui.checkbox').checkbox();
  //
  $('select.dropdown').dropdown();
  //
  $menuItem.on('click', handler.activate);
  // Sorting Panel
  $($sortingPanel).sortable({
    stop: function(event, ui){
      $('.sorting_panel:eq(0) div').not("div[style='display: none;']").find('input[name*=seq]').each(function(idx, e){
        $(e).val(idx);
      });
      //
      $('.sorting_panel:eq(1) div').not("div[style='display: none;']").find('input[name*=seq]').each(function(idx, e){
        $(e).val(idx);
      });
      //
      $('.sorting_panel:eq(2) div').not("div[style='display: none;']").find('input[name*=seq]').each(function(idx, e){
        $(e).val(idx);
      });
    },
  });
  // reorder position after insert or remove item
  $($sortingPanel).on('cocoon:after-insert cocoon:after-remove', function(e, childItem) {
      //
      $('.sorting_panel:eq(0) div').not("div[style='display: none;']").find('input[name*=seq]').each(function(idx, e){
        $(e).val(idx);
      });
      //
      $('.sorting_panel:eq(1) div').not("div[style='display: none;']").find('input[name*=seq]').each(function(idx, e){
        $(e).val(idx);
      });
      //
      $('.sorting_panel:eq(2) div').not("div[style='display: none;']").find('input[name*=seq]').each(function(idx, e){
        $(e).val(idx);
      });
      $('select.dropdown').dropdown();
      //
      $("html, body").animate({ scrollTop: $(document).height() }, "slow");
        return false;
      });
};


// attach ready event
$(document)
  .ready(semantic.menu.ready)
;
// $(function(){




// 	$('.ui.dropdown').dropdown();

// 	$('.ui.accordion').accordion();
// });