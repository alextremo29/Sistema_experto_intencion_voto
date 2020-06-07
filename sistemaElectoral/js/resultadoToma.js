$(document).ready(function() {
	getResultado();
});

function getResultado() {
	var resultado = JSON.parse(localStorage.getItem("resultadoToma"));
	var html ="";
	console.log(resultado);
	jQuery.each(resultado, function(i, val) {
		html+="<p>"+val.nombre+": <b>"+val.porcentaje+"</b></p>";
	});
	$("#resultadoToma").html(html);
}