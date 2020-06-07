<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Persona extends Model
{
    protected $table = "persona";
    protected $fillable =[
    	"genero_id","rango_edad_id","estrato_social"
    ];

    public function genero()
    {
    	return $this->belongsTo('App\Genero');
    }
    public function rangoEdad()
    {
    	return $this->belongsTo('App\Rango_edad');
    }
    public function respuestas()
    {
        return $this->hasMany('App\Respuesta');
    }
    public function resultadoTomas()
    {
        return $this->hasMany('App\Resultado_toma');
    }
}
