<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Opcion_respuesta extends Model
{
    protected $table = "opcion_respuesta";

    public function pregunta()
    {
    	return $this->belongsTo('App\Pregunta');
    }
    public function propuesta()
    {
    	return $this->belongsTo('App\Propuesta');
    }
    public function respuestas()
    {
    	return $this->hasMany('App\Respueta');
    }
}
