




%rebase template title='Listado de Usuarios | Administrador - MotorTip', body='gray'


%include admin_includes/admin_header user=user

<!-- Container -->
<div class="container">


<!-- Container -->
<div class="container">

    <div class="hero-unit">
    <h1>Motor Tip</h1>
    <p>{{text or 'Agregar'}} Usuario</p>
    <div>
    	<form action="/admin/save_user" method="post" >
		  %if user is None:
		  <label>Name</label>
		  <input type="text" name="name" /><br/>
		  <label>Email</label>
		  <input type="text" name="email" /><br/>
		  <label>Password</label>
		  <input type="text" name="password" /><br/>
		  <label>Credits</label>
		  <input type="text" name="credits" /><br/>
		  <input type="Submit" name="submit" value="Salvar" class="btn btn-success btn-small" /><br/>
		  %else:
		  <label>Name</label>
		  <input type="text" name="name" value="{{user.Username}}"/><br/>
		  <label>Email</label>
		  <input type="text" name="email" value="{{user.Email}}" /><br/>
		  <label>Password</label>
		  <input type="text" name="password" value="" /><br/>
		  <label>Credits</label>
		  <input type="text" name="credits" value="{{user.Credit}}" /><br/>
		   <input type="hidden" name="id" value="{{user.Id}}" /><br/>
		  <input type="Submit" class="btn btn-primary btn-large" value="Salvar"  /><br/>
		  %end
		</form>

    </div>
    </div>
	
	
	
</div>
	
	
</div>



%include footer