$(document).on('turbolinks:load', function(){
  
  $(function(){
    
    if (location.href.match(/\/records\/redirecting/)) {
      var redirectToCalculate = function(){
        $("#redirect-to-calculate")[0].click();
      }
      setTimeout(redirectToCalculate, 1000);
    };

  })

})

  

