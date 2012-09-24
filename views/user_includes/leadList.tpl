%rebase template title='Leads Automotores - MotorTip', body='gray'
 <script src="/static/js/flexigrid.pack.js" type="text/javascript" ></script>
 <link href="/static/css/flexigrid.pack.css" rel="stylesheet">
 
<!-- Container -->
<div class="container">
	    <ul class="nav nav-pills">
		%if content != 'my':

        	<li class="active">
        %else:
            <li>
        %end
		 
	        <a href="/leads">Todos los Clientes</a>
	    </li>
		<li >
		%if content == 'my':
			<li class="active">
		%else:
			<li>
		%end
		<a href="/leads/my">Solo mis Clientes</a></li>

    </ul>

    <div class="alert alert-block  fade in hide" id="alert">
        
        <h4 class="alert-heading">Esta a punto de comprar un nuevo Cliente!</h4>
        <p>
            Comprando el lead usted podra adquidir todos los datos de contacto de la persona y asi poder contactarlo.
            <br/>
            Recuerde que se le descontara un credito de su cuenta por cada Lead adquirido.
        </p>
        <p>
          <a id="btn_action"  href="javascript:;" class="btn btn-success">Comprar</a> <a href="javascript:;"  onclick="closeConfirm()" class="btn-danger btn">Cancelar</a>
        </p>
    </div>

	<table class="flexme3" style="display: none"></table>

	<script type="text/javascript">
		var myUrl = 
		%if content == 'my':
			'/leads/json/my'
		%else:
			'/leads/json';
		%end
		$(".flexme3").flexigrid({
				url: myUrl,
	dataType: 'json',
	colModel : [
		{display: 'Fecha', name : 'date', width : 94, sortable : true, align: 'right'}	,
		{display: 'Busca', name : 'type', width : 60, sortable : true, align: 'left'},
		{display: 'Marca', name : 'brand', width : 94, sortable : true, align: 'left'}	,
		{display: 'Modelo', name : 'model', width : 80, sortable : true, align: 'left'},
		{display: 'Combustible', name : 'fuell', width : 70, sortable : true, align: 'left'}	,
		{display: 'Precio', name : 'price', width : 94, sortable : true, align: 'left'}	,		
		{display: 'A&ntilde;o', name : 'year', width : 30, sortable : true, align: 'right'}	,
		{display: 'Nombre', name : 'name', width : 100, sortable : false, align: 'left'},
		{display: 'Telefono', name : 'phone', width : 44, sortable : false, align: 'right'}	,
		
		
		{display: '', name : 'action', width : 110, sortable : false, align: 'right'}			],
	searchitems : [
		{display: 'Marca', name : 'brand', isdefault: true},
		{display: 'Modelo', name : 'model', isdefault: false},
		{display: 'Combustible', name : 'fuell', isdefault: false}
		],
		sortname: "date",
		sortorder: "desc",
		usepager: true,
		novstripe: true,
		useRp: true,
		rp: 10,
			pagestat: 'Mostrando {from} a {to} de {total} Leads',
			pagetext: 'Pagina',
			outof: 'de',
			findtext: 'Buscar',
			params: [], //allow optional parameters to be passed around
			procmsg: 'Buscando Leads, por favor espere ...',

		showTableToggleBtn: false,
		width: 940,
		height: 400,
		singleSelect: true,
		showToggleBtn: false,
		addTitleToCell: true,
		resizable: false,
		striped: true, //apply odd even stripes
			novstripe: false,
			});



		function test(com, grid) {
			if (com == 'Delete') {
				confirm('Delete ' + $('.trSelected', grid).length + ' items?')
			} else if (com == 'Add') {
				alert('Add New Item');
			}
		}
	</script>
	
	
</div>


