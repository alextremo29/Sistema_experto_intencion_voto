$(document).ready(function() {
	getRangoEdad();
	getGenero();
});

function getRangoEdad() {
	$.get('http://api-electoral.com.devel/api/rangoEdad').done(function(resp) {
		for (var i = 0; i < resp.length; i++) {
			$("#txtEdad").append(new Option(resp[i].rango,resp[i].id));
		}
	}).fail(function(err) {
		console.log(err);
		respError = err.responseJSON;
		console.log(respError);
		var htmlError = '<br><div class="alert alert-danger" role="alert">Error al consumir el servicio</div>';
		$("#setencias").html(htmlError);
	})
}
function getGenero() {
	$.get('http://api-electoral.com.devel/api/genero').done(function(resp) {
		for (var i = 0; i < resp.length; i++) {
			$("#txtGenero").append(new Option(resp[i].genero,resp[i].id));
		}
	}).fail(function(err) {
		console.log(err);
		respError = err.responseJSON;
		console.log(respError);
		var htmlError = '<br><div class="alert alert-danger" role="alert">Error al consumir el servicio</div>';
		$("#setencias").html(htmlError);
	})
}
function guardarCiudadano() {
	var data = {
		"genero_id": $("#txtGenero").val(),
		"rango_edad_id": $("#txtEdad").val(),
		"estrato_social":$("#txtEstrato").val()
	};
	$.post('http://api-electoral.com.devel/api/savePersona',data).done(function(resp) {
		localStorage.setItem('idCiudadano',resp.ciudadano.id);
		location.href="preguntas.html";
	}).fail(function(err) {
		console.log(err);
		respError = err.responseJSON;
		console.log(respError);
		var htmlError = '<br><div class="alert alert-danger" role="alert">Error al consumir el servicio</div>';
		$("#setencias").html(htmlError);
	})
}