
$(function(){
  // fix menu when passed
  // $('.masthead')
  //   .visibility({
  //     once: true,
  //     onBottomPassed: function() {
  //       $('.fixed.menu').transition('fade in');
  //     },
  //     onBottomPassedReverse: function() {
  //       $('.fixed.menu').transition('fade out');
  //     }
  //   })
  // ;
  //
  Lobibox.notify.DEFAULTS = $.extend({}, Lobibox.notify.DEFAULTS, {
    position: 'bottom left'
  });
  //
  // create sidebar and attach to menu open
  $('.menu .dropdown.item')
    .dropdown({
      on: 'hover'
    })
  ;

  $('.ui.sidebar')
    .sidebar('attach events', '.cart.item')
  ;

  $('.message .close')
    .on('click', function() {
      $(this)
        .closest('.message')
        .transition('fade')
      ;
    })
  ;

  $('.ui.radio.checkbox')
    .checkbox()
  ;

  $('.ui.checkbox')
    .checkbox()
  ;
  // $('select.dropdown').dropdown();

  // 
  $('.product.color a').click(function(){
    $('.product.color a').each(function(idx, e){
      value = $(e).attr('data-value');
      $(e).html(value);
    });

    value = $(this).attr('data-value');
    $(this).html("<i class='check square icon'></i>" + value);
    $('#buy_color').attr('value', value);
    // reset size
    $('.product.size a').each(function(idx, e){
      value = $(e).attr('data-value');
      $(e).html(value);
    });
    //
    $('#buy_buy_count').empty();
    $('#lbl_itemcode').text('尚未選擇尺寸');
  });
  // 
  $('.product.size a').click(function(){
    $('.product.size a').each(function(idx, e){
      value = $(e).attr('data-value');
      $(e).html(value);
    });

    value = $(this).attr('data-value');
    $(this).html("<i class='check square icon'></i>" + value);
    $('#buy_size').attr('value', value);

    $.post( '/site/spec', $('.form.buy').serialize(), function(data) {
      if (data&&data["qty"]>0) {
        $('#sellout').hide();
        $('.form.buy').show();
        $('#buy_buy_count').empty();
        for (i = 1; i <= data["qty"]; i++) { 
          $('#buy_buy_count').append($('<option>', { value : i })
            .text(i));
          //
          $('#lbl_itemcode').text(data["itemcode"]);
          $('#buy_itemcode').attr('value',data["itemcode"]);
        }
      }else{
        $('#sellout').show();
        $('.form.buy').hide();
        $('#lbl_itemcode').text('-');
      }
      // $('#buy_buy_count select').val("1");
    }); 
  });
  // 
  // $('.form.buy').submit(function(e){
  //   e.preventDefault();
  //   $.post( '/site/cart_add', $(this).serialize(), function(data) {
      
  //     // data = jQuery.parseJSON( data );
  //     console.log(data);
  //   })
  //   .done(function() {
  //     // alert( "second success" );
  //   })
  //   .fail(function() {
  //     // alert( "error" );
  //   })
  //   .always(function() {
  //     // alert( "finished" );
  //   });    
  // });

});

//
function check_buy()
{
  if ($('#buy_buy_count').val()<1) { 
    alert('尚未選擇尺寸'); 
    return false;
  }
}