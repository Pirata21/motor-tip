


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Motor Tip - Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Author">
    <script src="/static/js/jquery-1.8.0.min.js" type="text/javascript" ></script>
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
  </head>

  <body>

    <div class="hero-unit">
    <h1>Motor Tip</h1>
    <p>Agregar Lead</p>
    <div>
    	<form action="/save/" method="post" >
		  
		  <label>Name</label>
		  <input type="text" name="name" /><br/>
		  <label>Phone</label>
		  <input type="text" name="phone" /><br/>
		  <label>Email</label>
		  <input type="text" name="email" />
		  
		  <br/>
		  <label>Precio</label>
		  <select name="price">
		  	<option value="Entre 1000 y 3000">Entre 1000 y 3000</option>
		  	<option value="Entre 3000 y 5000">Entre 3000 y 5000</option>
		  	<option value="Entre 5000 y 8000">Entre 5000 y 8000</option>
		  	<option value="Entre 8000 y 10000">Entre 8000 y 10000</option>
		  	<option value="Mas de 10000">Mas de 10000</option>
		  </select>
		  <label>ANo</label>
		  <input type="text" name="year" /><br/>
		  <label>Combustible</label>
		 
		  <select name="fuell">
		  	<option value="Nafta">Nafta</option>
		  	<option value="Gasoil">Gasoil</option>
		  </select><br/>
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

		  <br/>
		  
		  <label>Modelo</label>
		  <input type="text" name="model" />
		 		  <br/>
		  <label>Comentarios</label>
		  <input type="text" name="comments" /><br/>
		  <label>Tipo</label>
		  <select name="typeCar">
		  	<option value="Auto">Auto</option>
		  	<option value="Camioneta">Camioneta</option>
		  	<option value="Utilitario">Utilitario</option>
		  	<option value="Camion">Camion</option>
		  </select><br/>
		  <label>Cuantos te contactan</label>
		   <select name="maxBuyers">
		  	<option value="1">1</option>
		  	<option value="3">3</option>
		  	<option value="5">5</option>

		  </select>

		  <br/>
		  
		  

		  <input type="Submit" class="btn btn-primary btn-large" value="Salvar"  /><br/>

		</form>


    </div>
    </div>

  </body>
</html>
