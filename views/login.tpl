% #This is the page content: {{content}}
%rebase template title='Bienvenidos a MotorTip', body=''

<div class="container login">
	    
	<div class="span12">
		
		<form class="form-horizontal" >
			
			<div class="hero-unit">
			    <h1>MotorTip</h1>
			    <div class="alert alert-block" id="error_login">
				    <h4>Whoops!</h4>
				     Usuario o contraseña incorrectos, verifique e intente de nuevo
			    </div>
			</div>
			
		    <div class="control-group">
		    	<label class="control-label" for="inputEmail">Email</label>
		    	<div class="controls">
		    	<input type="text" id="inputEmail" name="email" placeholder="Email">
		    	<label class="error alert alert-error" for="name" id="name_error">Email requerido.</label>  
      
		    	</div>
		    </div>
		    <div class="control-group">
		    	<label class="control-label" for="inputPassword">Password</label>
		    	<div class="controls">
		    		<input type="password" name="password" id="inputPassword" placeholder="Password">
		    		<label class="error alert alert-error" for="inputPassword" id="pass_error">Password requerido.</label>  
      
		    	</div>
		    </div>
		    <div class="control-group">
		    	<div class="controls">
			    <label class="checkbox">
			    	<input type="checkbox" id="remember" name="remember"> Recordarme
			    </label>
			    <button type="submit" id="submit" class="btn btn-info" data-loading-text="Entrando...">Entrar</button>
			    </div>
		    </div>
	    </form>
	</div>
</div>

<script type="text/javascript">
	    
   
    
    
	$(function() {  
		
		$('.error, #error_login').hide();  
		$("#submit").click(function() {  
		// validate and process form here  
		  
			$('.error').hide();  
			  var name = $("input#inputEmail").val();  
			    if (name == "") {  
			  $("label#name_error").show();  
			  $("input#inputEmail").focus();  
			  return false;  
			}  
			    var pass = $("input#inputPassword").val();  
			    if (pass == "") {  
			  $("label#pass_error").show();  
			  $("input#pass_error").focus();  
			  return false;  
			}  
			
			var name = $("input#inputEmail").val();  
			var pass = $("input#inputPassword").val();  
			var remember = ($('#remember').attr('checked') == 'checked') ? 'True' : 'False';  
			var dataString = 'email='+ name + '&password=' + pass + '&remember=' + remember;
			
			
			
			$.ajax({  
			  type: "POST",  
			  url: "/user/login_check",  
			  data: dataString,  
			  dataType: 'json' ,
			  success: function(data) {  
			  		if(data.success){
				  		window.location.href= data.page_redirect;
			  		}
			  		else {
				  		console.info('no entro');
				  		$('#error_login').slideDown();
			  		}
			  		
			  }  
			});  
			return false; 
		  
		  
		});  
	});  
</script>
