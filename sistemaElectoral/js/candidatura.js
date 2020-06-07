$(document).ready(function() {
	getCandidatura();
});

function getCandidatura() {
	$.get('http://api-electoral.com.devel/api/candidaturas').done(function(resp) {
		for (var i = 0; i < resp.length; i++) {
			$("#txtEleccion").append(new Option(resp[i].nombre,resp[i].id));
		}
		getPeriodo();
	}).fail(function(err) {
		console.log(err);
		respError = err.responseJSON;
		console.log(respError);
		var htmlError = '<br><div class="alert alert-danger" role="alert">Error al consumir el servicio</div>';
		$("#setencias").html(htmlError);
	})
}
function getPeriodo() {
	var eleccion = $("#txtEleccion").val();
	$.get('http://api-electoral.com.devel/api/periodo/'+eleccion).done(function(resp) {
		console.log(resp)
		$("#txtPeriodo").append(new Option(resp,resp));
	}).fail(function(err) {
		console.log(err);
		respError = err.responseJSON;
		console.log(respError);
		var htmlError = '<br><div class="alert alert-danger" role="alert">Error al consumir el servicio</div>';
		$("#setencias").html(htmlError);
	})
}
function TraerPreguntas() {
	var data ={
		"candidatura_id":$("#txtEleccion").val(),
		"periodo":$("#txtPeriodo").val()
	};
	$.post('http://api-electoral.com.devel/api/preguntas',data).done(function(resp) {
		//localStorage.setItem('idCiudadano',resp.ciudadano.id);
		var html ="";
		console.log(resp);
		jQuery.each(resp.preguntas, function(i, val) {
			html+='<div class="card mb-5">';
				html+='<div class="card-header">';
					html+=i
				html+='</div>';
				html+='<div class="card-body preguntas" id="salud">';
					html+='<p class="text-justify">';
						html+=val.pregunta;
					html+='</p>';
						jQuery.each(val.opciones, function(j, opcion) {
							html+='<div class="custom-control custom-radio">';
								html+='<input type="radio" value="'+j+'" id="opcion'+j+'" name="pregunta'+val.id_pregunta+'" class="custom-control-input">';
								html+='<label class="custom-control-label" for="opcion'+j+'">'+opcion+'</label>';
							html+='</div>';
						});
				html+='</div>';
			html+='</div>';
		});
		$("#preguntas").html(html);
		$("#btnGuardar").show();
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
function enviarRespuestas() {
	$("#respuesta").html('<center><h3>Por favor espere<br><i class="fas fa-spinner fa-spin"></i></h3></center>')
	var respuestas = [];
	var respuestasCompletas = true;
	$(".preguntas").each(function( index ) {
		respuestasCompletas = true;
		var id = parseInt(index)+1;
		var respuesta = $("input[name='pregunta"+id+"']:checked").val();
		if (respuesta==undefined) {
			respuestasCompletas = false;
			return false;
		} else{
			respuestas.push(respuesta);
		}
	});
	if (respuestasCompletas) {
		var data = {
			"id_persona" : localStorage.getItem("idCiudadano"),
			"respuestas" : JSON.stringify(respuestas)
		};
		$.post('http://api-electoral.com.devel/api/storePreguntas',data).done(function(resp) {
			localStorage.setItem("resultadoToma", JSON.stringify(resp.resultado));
			location.href="resultadoToma.html";
		}).fail(function(err) {
			console.log(err);
			respError = err.responseJSON;
			console.log(respError);
			var htmlError = '<br><div class="alert alert-danger" role="alert">Error al consumir el servicio</div>';
			$("#respuesta").html(htmlError);
		})
	} else{
		console.log("error");
		$("#respuesta").html('error')
	}
}