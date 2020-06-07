<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Respuesta extends Model
{
    protected $table ="respuesta";
    protected $fillable =[
    	"persona_id","propuesta_id","toma"
    ];

    public function opcionRespuesta()
    {
    	return $this->belongsTo('App\opcion_respuesta');
    }
    public function persona()
    {
    	return $this->belongsTo('App\Persona');
    }
}
