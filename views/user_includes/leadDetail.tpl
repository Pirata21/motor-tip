%rebase template title='Detalle del Cliente - MotorTip', body='gray'


%include user_includes/user_header user=user

<!-- Container -->
<div class="container">

    %if content:

            <div class="hero-unit detail" >
                <h2>Detalle del Cliente</h2>
                <div class="col">
                    <p><strong>Nombre:</strong> {{content.Name}}</p>
                    <p><strong>Telefono:</strong> {{content.Phone}}</p>
                    <p><strong>Mail:</strong> {{content.Email}}</p>
                   
                </div>
                <div class="col">

                    %if content.Type:
                        <p><strong>Busca:</strong>
                        {{content.Type}}
                    %end
                    
                    %if content.Brand:
                        <p><strong>Marca:</strong>
                        {{content.Brand}}
                    %end
                    
                    %if content.Model:
                        <p><strong>Modelo:</strong>
                        {{content.Model}}
                    %end
                    
                    %if content.Fuel:
                        <p><strong>Combustible:</strong>
                        {{content.Fuel}}
                    %end
                    
                    %if content.Year:
                        <p><strong>A&ntilde;o:</strong>
                        {{content.Year}}
                    %end
                    
                    %if content.Price:
                        <p><strong>Precio:</strong>
                        {{content.Price}}
                    %end
                    
                    %if content.Comments:
                        <p><strong>Comentarios:</strong>
                        {{content.Comments}}
                    %end
                    </p>
                   
		</div>
                <div class="clear"></div>
                <a class="btn btn-info btn-large" href="/leads">
                    Volver a el listado de Clientes
                </a>
            </p>
           
            </div>
        
    %else:
        
	<div class="hero-unit detail" >
                <h2>Detalle del Cliente</h2>
            <p>
                Ups! Lo sentimos {{user.Username}}, pero usted no tiene permiso para ver la informacion de este Cliente!
            </p>
           
            </div>
    %end
	
</div>


%include footer