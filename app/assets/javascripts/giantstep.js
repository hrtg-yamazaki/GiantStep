$(document).on('turbolinks:load', function(){

  $(function(){

    $(".header-menu__icon").click(function(){
      $(".header-lists").slideToggle();
      $(this).css("display", "none");
      $(".header-menu__close").css("display", "inline");
    });

    $(".header-menu__close").click(function(){
      $(".header-lists").slideToggle();
      $(this).css("display", "none");
      $(".header-menu__icon").css("display", "inline");
    })

  })

})
