<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pregunta extends Model
{
    protected $table = "pregunta";
    protected $fillable =[
    	"pregunta","ambito_id"
    ];

    public function ambito()
    {
    	return $this->belongTo('App\Ambito');
    }
    public function opcionesRespuesta()
    {
    	return $this->hasMany('App\Opcion_pregunta');
    }
}
