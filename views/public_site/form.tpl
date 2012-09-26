


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Motor Tip - Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Author">
    <script src="/static/js/jquery-1.8.0.min.js" type="text/javascript" ></script>
    <script src="/static/js/jquery.stepy.min.js" type="text/javascript" ></script>
    <script src="/static/js/jquery.validate.min.js" type="text/javascript" ></script>
     <link href="/static/css/motor.css" rel="stylesheet" />
    <style type="text/css">



			/* Custom */
			form#target fieldset img { margin-top: 10px; }

			div#title-target { height: 25px;  margin-left: 215px; margin-top: 2px; }
			div#title-target ul.stepy-titles li { font-size: 12px; padding: 4px; }
			div#title-target ul.stepy-titles li:hover { color: #BBB; }
			div#title-target ul.stepy-titles li.current-step { color: #369; }

			/* Example of dynamic class name */
			p.default-buttons { margin-top: 30px; }
		</style>
     <script type="text/javascript">
        $(document).ready(function(){
          $('#custom').stepy({
					backLabel:	'Backward',
					block:		true,
					errorImage:	true,
					nextLabel:	'Continuar',
					titleClick:	true,
					validate:	true
				});

							// Optionaly
				$('#custom').validate({
					errorPlacement: function(error, element) {
						$('#custom div.stepy-error').append(error);
					}, rules: {
						'brand':			'required' ,
						'email':		'email',
						'model':		'required',
						'name':	'required',
						'email':		'required',
						'phone':			'required'
					}, messages: {
						'email':		{ email: 	 'Mail Invalido' },
						'email':		{ required: 	 'No olvides colocar tu email' },
						'model':		{ required:  'Cuentanos que modelo buscas!' },
						'password':		{ required:  'Password field is requerid!' },
						'name':			{ required:  'Debes darnos tu nombre!' },
						'phone':			{ required:  'Cual es tu telefono?!' },
					}
				});
				
        });
    </script>
   
  </head>

  <body>
  

  <div class="medium-box">
   
   
    <div class="inner-white">
      	<form id="custom" action="/save/" method="post" >
	   <div class="arrow"></div>
	  <fieldset title="Paso 1">
		  <legend>Que marca y Modelo Buscas</legend>		
		    <div class="left_form">  
		      <label>*Marca</label>
		      <select name="brand">
		  	<option >Alfa Romeo</option>
			<option >Audi</option>
			<option >BMW</option>
			<option >Chrysler</option>
			<option >Citroen</option>
			<option >Dacia</option>
			<option >Daewoo</option>
			<option >Dodge</option>
			<option >Fiat</option>
			<option >Ford</option>
			<option >Hyundai</option>
			<option >Isuzu</option>
			<option >Jeep</option>
			<option >Land Rover</option>
			<option >Lexus</option>
			<option >Mazda</option>
			<option >Mercedes-Benz</option>
			<option >Mitsubishi</option>
			<option >Nissan</option>
			<option >Opel</option>
			<option >Peugeot</option>
			<option >Renault</option>
			<option >Saab</option>
			<option >Seat</option>
			<option >Skoda</option>
			<option >Subaru</option>
			<option >Suzuki</option>
			<option >Toyota</option>
			<option >Volvo</option>
			<option >Volkswagen</option>
			<option >Altceva</option>
		      </select>
		      <br/>
		      <label>*Modelo</label>
		      <input type="text" name="model" />
		      <br/>
		      <label>*Combustible:</label>
		      <select name="fuell">
			    <option value="Nafta">Nafta</option>
			    <option value="Gasoil">Gasoil</option>
		      </select><br/>
		       <label>*A&ntilde;o</label>
		  <select name="year">
		  	<option value="1990">1990</option>

		  </select>
		  </div>
		  <label>Comentarios</label>
		  <textarea rows="4" cols="5" type="text" name="comments" ></textarea>
		</fieldset>

		<fieldset title="Paso 2">
		  <legend>Como te contactamos?</legend>
		  <label>*Nombre</label>
		  <input type="text" name="name" /><br/>
		  <label>*Telefono</label>
		  <input type="text" name="phone" /><br/>
		  <label>*Email</label>
		  <input type="text" name="email" /><br/>
		  <label>Cuantos te contactan</label>
		   <select name="maxBuyers">
		  	<option value="1">1</option>
		  	<option value="3">3</option>
		  	<option value="5">5</option>

		  </select>
			
		</fieldset>
	
				<input type="submit" class="finish" value="Enviar" />
			</form><br/>
    </div>
  </div>
		

		


  </body>
</html>
