


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
					nextLabel:	'Forward',
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
						'newsletter':	'required',
						'password':		'required',
						'bio':			'required',
						'day':			'required'
					}, messages: {
						'user':			{ maxlength: 'User field should be less than 1!' },
						'email':		{ email: 	 'Invalid e-mail!' },
						'model':		{ required:  'model field is required!' },
						'newsletter':	{ required:  'Newsletter field is required!' },
						'password':		{ required:  'Password field is requerid!' },
						'bio':			{ required:  'Bio field is required!' },
						'day':			{ required:  'Day field is requerid!' },
					}
				});
				
        });
    </script>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body>

<div id="custom-demo" class="session">A custom form in a validation style:</div>		

			<form id="custom">
				<fieldset title="Thread 1">
					<legend>Que marca y Modelo Buscas</legend>		
		  <label>Marca</label>
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
		  <label>Modelo</label>
		  <input type="text" name="model" />
		  <label>Combustible:</label>
<select name="fuell">
		  	<option value="Nafta">Nafta</option>
		  	<option value="Gasoil">Gasoil</option>
		  </select><br/>
		   <label>Precio</label>
		  <select name="price">
		  	<option value="Entre 1000 y 3000">Entre 1000 y 3000</option>
		  	<option value="Entre 3000 y 5000">Entre 3000 y 5000</option>
		  	<option value="Entre 5000 y 8000">Entre 5000 y 8000</option>
		  	<option value="Entre 8000 y 10000">Entre 8000 y 10000</option>
		  	<option value="Mas de 10000">Mas de 10000</option>
		  </select>
		  
		  <label>Comentarios</label>
		  <textarea rows="4" cols="5" type="text" name="comments" ></textarea><br/>


				

					<label>E-mail:</label>
					<input type="text" size="40" name="email" />
					<input type="checkbox" name="checked" /> Checked?

					<label>Newsletter?</label>
					<input type="radio" name="newsletter" /> Yep
					<input type="radio" name="newsletter" /> Nop

					<label>Password:</label>
					<input type="password" name="password" size="40" />
				</fieldset>

				<fieldset title="Thread 2">
					<legend>description two</legend>

					<label>Nick Name:</label>
					<input type="text" size="30" />

					<label>Bio:</label>
					<textarea name="bio" rows="5" cols="60"></textarea>
				</fieldset>
	
				<fieldset title="Thread 3">
					<legend>description three</legend>

					<label>Birthday:</label>
					<select name="day">
						<option></option>
						<option>23</option>
					</select>

					<select>
						<option>10</option>
					</select>

					<select>
						<option>1984</option>
					</select>

					<label>Site:</label>
					<input type="text" name="site" size="40" />
				</fieldset>
	
				<input type="submit" class="finish" value="Finish!" />
			</form><br/>


  </body>
</html>
