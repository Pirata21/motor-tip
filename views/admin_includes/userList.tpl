


%rebase template title='Listado de Usuarios | Administrador - MotorTip', body='gray'


%include admin_includes/admin_header user=user

<!-- Container -->
<div class="container">


<!-- Container -->
<div class="container">

     %if stats is None:
     None
     %else:
     <div class="alert alert-success">
	     Bien Hecho! Se ha creado un nuevo Usuario.
     </div>
     %end
     
    <table class="table table-hover">
    	<thead>
    		<tr>
	    		<td>Id</td>
	    		<td>Username</td>
	    		<td>Email</td>
	    		<td>Password</td>
	    		<td>Credits</td>
	    		<td>Action</td>
    		</tr>
    	</thead>
    	<tbody>
    		%for user in content:
    		
    		<tr>
	    		<td>{{user.Id}}</td>
	    		<td>{{user.Username}}</td>
	    		<td>{{user.Email}}</td>
	    		<td>{{user.Password}}</td>
	    		<td>{{user.Credit}}</td>
	    		<td><a href="/admin/edit_user/{{user.Id}}">Edit</a></td>
	    		<td><a href="/admin/delete_user/{{user.Id}}">Delete</a></td>

    		</tr>
    		%end
    	</tbody>
    </table>
	
	
	
</div>
	
	
</div>



%include footer