%rebase template title='Agregar Creditos - MotorTip', body='gray'


%include user_includes/user_header user=user

<!-- Container -->
<div class="container">
    <div class="alert alert-error hide" id="notification">
	
    </div>
     <div class="hero-unit credits">
	<div class="loader"></div>
    <h4>Agregar Creditos  a mi Cuenta</h4>
    <div>
    	
	<label>Cantidad de Creditos</label>
	<select class="credits" name="quantity" id="quantity">
	    <option>10</option>
	    <option>30</option>
	    <option>50</option>
	    <option>100</option>
	    <option>300</option>
	</select>
	<br/>
	<a href="javascript:;" id="moreCredits" class="btn btn-success btn-large ">Solicitar Creditos</a>
    </div>
    
    </div>

     <div class="alert alert-info explain">
	<h4>Como funcionan los Creditos?</h4>
	<p>El Administrador sera notificiado y el debe autorizar los nuevos Creditos, cuando el Administrador acredite sus creditos, usted recibira un email con la confirmacion.  </p>
    </div>
</div>

<script type="text/javascript">
    
    $(function() {  
	$("#moreCredits").click(function() {
	    $('.loader').fadeIn(800);
	    $('#notification').hide().delay(2000);
	    var quantity = $("select#quantity").val();  
	    var dataString = 'quantity='+ quantity;
	    
	    
	    
	    $.ajax({  
	      type: "POST",  
	      url: "/addCredits",  
	      data: dataString,  
	      dataType: 'json' ,
	      success: function(data) {  
			    if(data.success){
				var not = $('#notification');
				   $(not).removeClass('alert-error').addClass('alert-success');
				   $(not).html('<h4>Felicitaciones, ha solicitado Creditos con exito</h4>Le notificaremos cuando se le hayan acreditado a su Cuenta! <br/><a class="btn btn-warning" href="/leads">Volver a la pagina de Clientes</a> ');
				    $(not).slideDown();
				    $('.loader').fadeOut(800,function(){
					$('.hero-unit').css('visibility', 'hidden');
					});
				    
			    }
			    else {
				var not = $('#notification');
				$(not).removeClass('alert-success').addClass('alert-error');
				$(not).html('<h4>Error al Solicitar Creditos</h4>Lo sentimos, no hemos podido solicitar con exito sus creditos, vuelva a intentarlo en unos minutos');
				$(not).slideDown();
				 $('.loader').fadeOut(800);
				    
			    }
			    
	      }  
	    });  
	    return false; 
  
  
    });
});
    
    
    
    
</script>

%include footer