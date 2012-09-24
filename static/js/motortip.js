
    
function confirmBuy(id, brand){
    $('#alert h4').text('Esta a punto de adquirir un nuevo cliente interesado en un '+ brand);
    $('#btn_action').attr('href', '/buy/'+id);
    $('#alert').slideDown();
    $('html, body').animate({scrollTop:100}, 'slow');
}

function closeConfirm(){
    
    $('#alert').slideUp();
}