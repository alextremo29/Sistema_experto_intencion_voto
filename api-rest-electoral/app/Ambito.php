<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Ambito extends Model
{
    protected $table = "ambito";
    protected $fillable = [
    	"nombre"
    ];

    public function preguntas()
    {
    	return $this->hasMany('App\Pregunta');
    }
    public function propuestas()
    {
    	return $this->hasMany('App\Propuesta');
    }
}
