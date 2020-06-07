<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Propuesta extends Model
{
   	protected $table = "propuesta";
   	protected $fillable = [
   		"candidato_candidatura_id", "ambito_id","enunciado_propuesta"
   	];

   	public function candidatoCandidatura()
   	{
   		return $this->belongsTo('App\Candidato_candidatura');
   	}

   	public function ambito()
    {
    	return $this->belongTo('App\Ambito');
    }
    public function opcionesRespuesta()
    {
      return $this->hasMany('App\Opcion_pregunta');
    }
}
